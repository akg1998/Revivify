<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Vivek Yadav">
<link rel="icon" href="" type="image/icon type">
<title>Let's Start</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">


<!-- Custom styles for this template-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
</head>

<body class="bg-gradient-light ">
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row justify-content-around">
					<div class="col-xl-4 col-lg-5 d-none d-lg-block">
						<img class="card-img ps-5 pt-5 " style="" src="register.svg"
							alt="">
					</div>
					<div class="col-xl-6 col-lg-6 col-md-10 p-5">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h3 fw-bolder mb-4">Let's Start our Journey!</h1>
								<span class="text-danger">${errormsg}</span>
							</div>
							<form class="user" action="" method="post">
								<div class="form-group ">
									<div class="row mb-3">
										<div class="input-group flex-nowrap">
											<span class="input-group-text" id="addon-wrapping"><i
												class="fas fa-user-circle"></i></span> <input type="text"
												class="form-control" placeholder="Username" name="username"
												aria-label="Username" aria-describedby="addon-wrapping"
												required>
										</div>
										<!-- <input type="text" class="form-control form-control-user" id="userName" name="userName" placeholder="UserName" required pattern=".{1,50}" title="Limit Characters to 50 only" /> -->
									</div>

									<div class="row mb-3">
										<div class="input-group flex-nowrap">
											<span class="input-group-text" id="addon-wrapping"> <i
												class="far fa-envelope"></i>
											</span> <input type="email" class="form-control"
												placeholder="Email-id" name="emailid" aria-label="E-mail"
												pattern="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[.]+[a-zA-Z0-9-]+$" aria-describedby="addon-wrapping" required>
										</div>
										<!-- <input type="text" class="form-control form-control-user" id="userName" name="userName" placeholder="UserName" required pattern=".{1,50}" title="Limit Characters to 50 only" /> -->
									</div>

									<div class="row mb-3">
										<div class="input-group flex-nowrap">
											<span class="input-group-text" id="addon-wrapping"><i
												class="fa fa-key" aria-hidden="true"></i></span> <input
												type="password" class="form-control form-control-user"
												aria-label="Password" aria-describedby="addon-wrapping"
												id="password" name="password" placeholder="Password"
												required maxlength="4" pattern="^[.\S]{4}$"
												title="Password must be of 4 alpha-numeric characters"
												required />
										</div>
									</div>
									<div class="row mb-3 p-3">
										<button type="submit" name="userRegister"
											class="btn btn-success btn-user btn-block">Create
											Account</button>
									</div>

								</div>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="/login">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>


</body>

</html>
