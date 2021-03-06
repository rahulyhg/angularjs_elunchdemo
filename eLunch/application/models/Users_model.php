<?php

class Users_model extends CI_Model{

    private static $db;

    function __construct() {
        parent::__construct();
        self::$db = &get_instance()->db;
    }

    /**
     * Get all users
     *
     * @param       int  $perpage
     * @param       int  $offset
     * @return      array
     */
    static function get_all_users($perpage = NULL, $offset = NULL, $search = NULL)
    {
        self::$db->cache_on();
        self::$db->select('users.*, floors.name AS floor, shifts.name AS shift, shifts.id AS shift_id, shifts.start_time, shifts.end_time');
        self::$db->from('users');
        self::$db->join('floors', 'users.floor_id = floors.id');
        self::$db->join('shifts', 'users.shift_id = shifts.id');
        if (!is_null($perpage) && !is_null($offset))
        {
            self::$db->limit($perpage, $offset)->order_by('users.admin', 'DESC');
        }
        self::$db->like('users.first_name', $search);
        self::$db->order_by('users.email', 'ASC');
        $query = self::$db->get();
        return $query->result();
    }

    /**
     * Get number of users
     *
     * @return      int
     */
    static function get_num_of_users($search = NULL)
    {
        return self::$db->like('users.first_name', $search)->get('users')->num_rows();
    }

    /**
     * Delete user by id
     *
     * @param       int  $user_id
     * @return      bool
     */
    static function delete_user($user_id)
    {
        self::$db->cache_delete('admin', 'users');
        return self::$db->query('DELETE users, tracking_users FROM users
            INNER JOIN tracking_users ON users.id = tracking_users.user_id
            WHERE users.id = ?', array($user_id));
    }

    /**
     * Get user by field
     *
     * @param       string  $field
     * @param       string  $field_value
     * @return      object
     */
    static function get_user_by($field, $field_value)
    {
        self::$db->select('users.*, floors.name AS floor, floors.id AS floor_id, , shifts.name AS shift, shifts.id AS shift_id, shifts.start_time, shifts.end_time');
        self::$db->from('users');
        self::$db->join('floors', 'users.floor_id = floors.id', 'left');
        self::$db->join('shifts', 'users.shift_id = shifts.id', 'left');
        self::$db->where('users.'.$field, $field_value);
        $query = self::$db->get();
        return $query->first_row();
    }

    /**
     * Get user without floor by field
     *
     * @param       string  $field
     * @param       string  $field_value
     * @return      object
     */
    static function get_user_with_no_floor_by($field, $field_value)
    {
        self::$db->select('users.*');
        self::$db->from('users');
        self::$db->where('users.'.$field, $field_value);
        $query = self::$db->get();
        return $query->first_row();
    }

    /**
     * Edit profile
     *
     * @param       array  $data
     * @param       int  $user_id
     * @return      bool
     */
    function edit_profile($data, $user_id)
    {
        if (!is_null($data['want_vegan_meal']) || (!is_null($data['what_taste'])))
        {
            $this->db->cache_delete('admin', 'users');
            if (!is_null($data['want_vegan_meal']))
            {
                $data['want_vegan_meal'] = ($data['want_vegan_meal'] == 'true') ? 1 : 0;
                $this->load->model('tables_model');
                $query = ($data['want_vegan_meal'] == 0) ? $this->tables_model->update_table_for_user($user_id, TRUE) : $this->tables_model->update_table_for_user($user_id, FALSE);
                ($query) ? $this->db->set('want_vegan_meal', $data['want_vegan_meal']) : '';
            }
            if(!is_null($data['what_taste'])) $this->db->set('what_taste', $data['what_taste']);
            $this->db->where('id', $user_id);
            return $this->db->update('users');
        }
        else return FALSE;
    }

    /**
     * Login
     *
     * @param       array  $user
     * @param       string  $login_admin
     * @return      [bool, object]
     */
    function login($user)
    {
        $this->db->select('users.*, shifts.name AS shift, shifts.id AS shift_id, shifts.start_time, shifts.end_time');
        $this->db->from('users');
        $this->db->join('shifts', 'users.shift_id = shifts.id', 'left');
        $this->db->where('users.email', $user['email']);
        $query = $this->db->get();
        $result = $query->first_row();
        if (isset($result) && $this->bcrypt->check_password($user['password'], $result->encrypted_password))
        {
            $access_point = $this->db->get_where('access_point', array('selected' => 1))->result();
            foreach ($access_point as $value)
            {
                $value->id = (int)$value->id;
                $value->floor_id = (int)$value->floor_id;
            }
            $result->access_point = $access_point;
            $this->load->library('encryption');
            $data['authentication_token'] = $this->encryption->encrypt(date('Ymd Hms') + $user['password']);
            $result->authentication_token = $data['authentication_token'];
            $this->db->where('id', $result->id);
            $this->db->update('users', $data);
            return [TRUE, $result];
        }
        else
        {
            return [FALSE, NULL];
        }
    }

    /**
     * Change password
     *
     * @param       int  $user_id
     * @param       string  $current_password
     * @param       string  $new_password
     * @return      bool
     */
    function change_password($user_id, $current_password, $new_password)
    {
        $this->load->library('encryption');
        $result = $this->db->get_where('users', array('id' => $user_id))->first_row();
        if (isset($result) && $this->bcrypt->check_password($current_password, $result->encrypted_password))
        {
            $new_password_hash = $this->bcrypt->hash_password($new_password);
            $authentication_token = $this->encryption->encrypt(date('Ymd Hms') + $new_password);
            $data = array(
                'encrypted_password'=> $new_password_hash,
                'authentication_token' => $authentication_token);
            $this->db->where('id', $user_id);
            return $this->db->update('users', $data);
        }
        else return FALSE;
    }

    /**
     * Admin change password for user
     *
     * @param       int  $user_id
     * @param       string  $new_password
     * @return      bool
     */
    function change_password_of_admin($user_id, $new_password)
    {
        $this->load->library('encryption');
        $new_password_hash = $this->bcrypt->hash_password(md5($new_password));
        $authentication_token = $this->encryption->encrypt(date('Ymd Hms') + md5($new_password));
        $data = array(
            'encrypted_password'=> $new_password_hash,
            'authentication_token' => $authentication_token);
        $this->db->where('id', $user_id);
        return $this->db->update('users', $data);
    }

    /**
     * Authenticate
     *
     * @param       array  $user
     * @return      [bool, object]
     */
    function authenticate($user)
    {
        if (!isset($user['tok']) OR !isset($user['tok']))
        {
            return [FALSE, NULL];
        }

        $result = $this->db->get_where('users', array('authentication_token' => $user['tok']))->first_row();
        if (isset($result) && $this->bcrypt->check_password($user['password'], $result->encrypted_password))
        {
            return [TRUE, $result];
        }
        else
        {
            return [FALSE, NULL];
        }
    }

    /**
     * Destroy token
     *
     * @param       array  $user
     * @return      bool
     */
    function destroy_token($user)
    {
        $user = $this->get_user_with_no_floor_by('email', $user['email']);
        if ($user != NULL)
        {
            $user->authentication_token = '';
            $user->gcm_regid = '';
            $this->db->replace('users',$user);
            return TRUE;
        }
        else return FALSE;
    }

    /**
     * Insert new user
     *
     * @param       array  $user
     * @return      [int, array]
     */
    function insert_user($user)
    {
        $this->load->library('encryption');
        // Check user existed or not in db
        if (!$this->is_user_exists($user['email']))
        {
            $data = array(
                'email' => strtolower($user['email']),
                'encrypted_password' => $this->bcrypt->hash_password(md5($user['password'])),
                'authentication_token' => $this->encryption->encrypt(date('Ymd Hms') + md5($user['password'])),
                'first_name' => $user['first_name'],
                'last_name' => $user['last_name'],
                'what_taste' => $user['what_taste'],
                'admin' => $user['role'],
                'avatar_file_name' => $user['avatar_file_name'],
                'avatar_content_file' => $user['avatar_content_file'],
                'want_vegan_meal' => $user['want_vegan_meal'],
                'floor_id' => $user['floor'],
                'shift_id' => $user['shift'],
                'created_at' => date('Y-m-d H:i:s'));
            $this->db->trans_begin();
            $this->db->insert('users', $data);
            $user_id = $this->db->insert_id();
            $this->load->model('tracking_users_model');
            $this->tracking_users_model->insert_status_user($user_id, ATTEND);
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                return [USER_CREATE_FAILED, NULL];
            }
            else
            {
                $this->db->cache_delete('admin', 'users');
                $this->db->trans_commit();
                return [USER_CREATED_SUCCESSFULLY, $data];
            }
        }
        else
        {
            return [USER_ALREADY_EXISTED, NULL];
        }
    }

    /**
     * Update user
     *
     * @param       int  $user_id
     * @param       array  $user_data
     * @return      bool
     */
    function update_user($user_id, $user_data)
    {
        $data = array(
                'first_name' => $user_data['first_name'],
                'last_name' => $user_data['last_name'],
                'want_vegan_meal' => $user_data['want_vegan_meal'],
                'what_taste' => $user_data['what_taste'],
                'admin' => $user_data['role'],
                'avatar_file_name' => $user_data['avatar_file_name'],
                'avatar_content_file' => $user_data['avatar_content_file'],
                'floor_id' => $user_data['floor'],
                'updated_at' => date('Y-m-d H:i:s'));
        $this->load->model('tables_model');
        $this->db->trans_begin();
        ($user_data['want_vegan_meal'] == 0) ? $this->tables_model->update_table_for_user($user_id, TRUE) : $this->tables_model->update_table_for_user($user_id, FALSE);
        $this->db->where('id', $user_id);
        $this->db->update('users', $data);
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            return FALSE;
        }
        else
        {
            $this->db->cache_delete('admin', 'users');
            $this->db->trans_commit();
            return TRUE;
        }
    }

    /**
     * Update reg id of google cloud messages api for user
     *
     * @param       int  $user_id
     * @param       array  $gcm_regid
     * @return      bool
     */
    static function update_gcm_regid($user_id, $gcm_regid)
    {
        self::$db->trans_begin();
        self::$db->where('gcm_regid', $gcm_regid);
        self::$db->update('users', array('gcm_regid' => ''));
        self::$db->where('id', $user_id);
        self::$db->update('users', array('gcm_regid' => $gcm_regid));
        if (self::$db->trans_status() === FALSE)
        {
            self::$db->trans_rollback();
            return FALSE;
        }
        else
        {
            self::$db->trans_commit();
            return TRUE;
        }
    }

    /**
     * Update shift for user
     *
     * @param       int  $user_id
     * @param       int  $shift_id
     * @return      bool
     */
    function update_shift($user_id, $shift_id)
    {
        $this->db->trans_begin();
        $this->load->model('tables_model');
        $this->tables_model->leave_tables_in_shift_for_user($user_id);
        $this->db->where('id', $user_id);
        $this->db->update('users', array('shift_id' => $shift_id));
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            return FALSE;
        }
        else
        {
            $this->db->cache_delete('admin', 'users');
            $this->db->trans_commit();
            return TRUE;
        }
    }

    /**
     * Check user exists or not
     *
     * @param       int  $email
     * @return      int
     */
    static function is_user_exists($email)
    {
        $query = self::$db->get_where('users', array('email' => $email));
        return $query->num_rows();
    }

    /**
     * Check user want to eat vegan meal or not
     *
     * @param       int  $user_id
     * @return      bool
     */
    static function is_user_want_vegan_meal($user_id)
    {
        $query = self::$db->get_where('users',array('id' => $user_id));
        $want_vegan_meal = $query->first_row()->want_vegan_meal;
        if ($want_vegan_meal == 0) return FALSE;
        else return TRUE;
    }

    function forgot_password($email)
    {
        $user = $this->get_user_by('email', $email);
        $this->load->helper('string');
        $token = bin2hex(random_string('alnum', 16));
        $this->db->where('id', $user->id);
        return [$this->db->update('users', array('reset_password_token' => $token, 'reset_password_sent_at' => date('Y-m-d H:i:s'))), $token];
    }

    function reset_password($token, $password)
    {
        $user = $this->get_user_by('reset_password_token', $token);
        if ($user != NULL)
        {
            $date_send_request = new DateTime(date('Y-m-d H:i:s', strtotime($user->reset_password_sent_at)));
            $end_time_of_reset = $date_send_request->add(new DateInterval('P1D'))->format('Y-m-d H:i:s');
            $current_date = (new DateTime(date('Y-m-d H:i:s')))->format('Y-m-d H:i:s');
            if ($current_date <= $end_time_of_reset)
            {
                $this->db->trans_begin();
                $this->change_password_of_admin($user->id, $password);
                $this->db->where('id', $user->id);
                $this->db->update('users', array('reset_password_token' => '', 'reset_password_sent_at' => ''));
                if ($this->db->trans_status() === FALSE)
                {
                    $this->db->trans_rollback();
                    return FALSE;
                }
                else
                {
                    $this->db->trans_commit();
                    return TRUE;
                }
            }
            return FALSE;
        }
        return FALSE;
    }

    public function send_mail($email, $token)
    {
        $message = $this->common->get_message('forgot_password', array('reset_password', 'send_mail_success'));
        $url = base_url('admin/forgot_password/reset').'?token='.$token;
        $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => 'ssl://smtp.gmail.com',
            'smtp_port' => 465,
            'smtp_user' => 'elunch.enclaveit@gmail.com',
            'smtp_pass' => 'enclaveit@123',
            'mailtype'  => 'html',
            'auth' => true,
            'charset'   => 'iso-8859-1'
        );
        date_default_timezone_set('GMT');
        $this->load->library('email');
        $this->email->initialize($config);
        $this->email->set_newline("\r\n");
        $this->email->from('elunch.enclaveit@gmail.com', 'Elunch');
        $this->email->to($email);
        $this->email->subject($message['reset_password']);
        $this->email->message($message['send_mail_success']. $url);
        return $this->email->send();
    }
}
