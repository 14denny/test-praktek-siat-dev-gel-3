<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

	public function index()
	{
		$data_view = array(
			'csrf_name' => $this->security->get_csrf_token_name(),
			'csrf_token' => $this->security->get_csrf_hash(),
		);
		$this->load->view('login_page', $data_view);
	}

	public function login()
	{
		$this->load->model('access_model');
		$username_email = $this->input->post('username');
		$password = $this->input->post('password');

		$ip_address = $this->input->ip_address();

		//check access ip
		if(!$this->access_model->check_access($ip_address)){
			$blocked = $this->access_model->check_blocklist($ip_address);
			$this->session->set_flashdata('status', false);
			$remaining = $blocked-time();
			$min = intval($remaining/60);
			$sec = intval($remaining%60);
			$this->session->set_flashdata('msg', "IP Anda diblokir, silahkan akses dalam $min:$sec");
			return redirect(site_url('login'));
		}

		if(!$username_email || !$password){
			$this->access_model->insert_ip($ip_address, 0);
			$this->session->set_flashdata('status', false);
			$this->session->set_flashdata('msg', "Harap isi username/email dan password");
			return redirect(site_url('login'));
		}

		$user = $this->db->from('user')
			->group_start()
			->or_where('username',$username_email)
			->or_where('email',$username_email)
			->group_end()
			->get()->row();

		if(!$user){
			$this->access_model->insert_ip($ip_address, 0);
			$this->session->set_flashdata('status', false);
			$this->session->set_flashdata('msg', "Username/email tidak dapat ditemukan");
			return redirect(site_url('login'));
		}

		if(!password_verify($password, $user->password)){
			$this->access_model->insert_ip($ip_address, 0);
			$this->session->set_flashdata('status', false);
			$this->session->set_flashdata('msg', "Password salah");
		} else {
			$this->access_model->insert_ip($ip_address, 1);
			$this->session->set_flashdata('status', true);
			$this->session->set_flashdata('msg', "Berhasil login dengan nama: $user->nama");
		}
		return redirect(site_url('login'));
	}
}
