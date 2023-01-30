<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Login Page</title>

	<style type="text/css">
		.container {
			margin: 10px
		}

		.label {
			font-size: 14pt;
			font-weight: bold;
			margin-bottom: 0.5rem;
		}

		.row {
			display: flex;
			flex-direction: column;
		}

		.mt-2 {
			margin-top: 1rem;
		}

		.input {
			padding: 6px;
			width: 100%;
		}

		.w-30 {
			width: 30% !important;
		}

		.btn {
			width: 100%;
			color: white;
			background-color: #09b202;
			border: none;
			padding: 10px;
			cursor: pointer;
		}

		.alert-success {
			padding: 8px;
			background-color: #09b202;
			color: white;
		}

		.alert-danger {
			padding: 8px;
			background-color: red;
			color: white;
		}
	</style>
</head>

<body>

	<div class="container">
		<?php if ($this->session->flashdata('msg')) : ?>
			<div class="row">
				<div class="w-30">
					<p class="alert-<?= $this->session->flashdata('status') ? 'success' : 'danger' ?>">
						<?= $this->session->flashdata('msg') ?>
					</p>
				</div>
			</div>
		<?php endif ?>

		<form action="<?= site_url('login/login') ?>" method="post">
			<input type="hidden" name="<?= $csrf_name ?>" value="<?= $csrf_token ?>">
			<div class="row">
				<div class="w-30">
					<span class="label">Username atau email:</span>
					<input type="text" placeholder="Username atau email" require name="username" class="input">
				</div>
			</div>
			<div class="row mt-2">
				<div class="w-30">
					<span class="label">Password:</span>
					<input type="password" placeholder="Password" require name="password" class="input">
				</div>
			</div>
			<div class="row mt-2">
				<div class="w-30">
					<button class="btn" type="submit">Login</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>