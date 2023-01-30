<?php

class Access_model extends CI_Model
{
    function insert_ip($ip, $success_login)
    {
        $insert = array(
            'ip_address' => $ip,
            'success_login' => $success_login,
        );
        return $this->db->insert('ip_access', $insert);
    }

    function check_access($ip)
    {
        //check whitelist
        $whitelisted = $this->db->select('1')->from('white_list_ip')->where('ip_address', $ip)->get()->row();
        if ($whitelisted) {
            return true;
        }

        $last_5_minute = date('Y-m-d H:i:s', strtotime('-5 minutes'));

        //sudah ada di block_list
        $blocked = $this->check_blocklist($ip);
        if ($blocked) {
            return false;
        }

        //cek apakah ada akses 3 kali atau lebih gagal
        $fail_count = $this->db->from('ip_access')
            ->where('success_login', 0)
            ->where('time >= ', $last_5_minute)
            ->count_all_results();
        if ($fail_count >= 3) {
            //insert ke blocklist
            $this->db->insert('block_list', ['ip_address' => $ip]);
            return false;
        } else {
            return true;
        }
    }

    function get_last_access($ip)
    {
        return $this->db->from('ip_access')->where('ip_address', $ip)->order_by('id', 'desc')->get()->row();
    }

    function check_blocklist($ip)
    {
        $last_5_minute = date('Y-m-d H:i:s', strtotime('-5 minutes'));
        //check block_list
        $blocked = $this->db->select('*')
            ->from('block_list')
            ->where('ip_address', $ip)
            ->where('time >= ', $last_5_minute)
            ->get()->row();
        if ($blocked) {
            return strtotime($blocked->time) + 300;
        } else {
            return false;
        }
    }
}
