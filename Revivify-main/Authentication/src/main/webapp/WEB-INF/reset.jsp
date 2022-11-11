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
<title>Reset Password</title>

<!-- Custom fonts for this template-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Custom styles for this template-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
</head>


<body class="bg-gradient-light">
	<div id="work-in-progress" class="d-none">
		<div class="work-spinner"></div>
	</div>
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div id="validateCredentials" class="row collapse show">
							<div class="col-lg-3 d-none d-lg-block "></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-2 font-weight-bold">
											<b>Reset Password ?</b> <img src="looking_eye.gif" width=10%
												height="10%" />
										</h1>
										<span class="text-danger">${error}</span>
										<p class="mb-4" style="text-align: justify;">Please verify
											your User-Name and Password. Before proceeding further.</p>
									</div>
									<div class=" form-group">
										<div class="row mb-3">
											<div class="input-group flex-nowrap">
												<span class="input-group-text" id="addon-wrapping"><i
													class="fa fa-user" aria-hidden="true"></i></span> <input
													type="text" class="form-control"
													placeholder="Enter User-Name" name="userName" id="userName"
													required>
											</div>
										</div>
										<div class="row mb-3">
											<div class="input-group flex-nowrap">
												<span class="input-group-text" id="addon-wrapping"><i
													class="fa fa-key" aria-hidden="true"></i></span> <input
													type="password" class="form-control"
													placeholder="Enter Current Password" name="currentPassword"
													id="currentPassword" maxlength="4" pattern="^[.\S]{4}$"
													title="Password must be of 4 alpha-numeric characters without space"
													aria-label="currentPassword"
													aria-describedby="addon-wrapping" required>
											</div>
										</div>

									</div>
									<div class="d-grid p-2 px-5">
										<button class="btn btn-sm btn-success font-weight-bold"
											onclick="validateCredentials()">Verify ?</button>
									</div>
									<hr>
									<div class="text-sm-center">
										<a class="small text-decoration-none" href="/register">Create
											an Account !</a>
									</div>
								</div>
							</div>

						</div>

						<div id="inputPassword" class="row collapse">

							<div class="col-md-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-2 font-weight-bold">
											<b>Enter OTP</b>
										</h1>
									</div>
									<form action="" method="POST">
										<input type="hidden" name="hiddenUserName" id="hiddenUserName">
										<input type="hidden" name="hiddenPassword" id="hiddenPassword">
										<div class=" form-group mb-2">
											<input type="text" class="form-control form-control-user"
												maxlength="6" min="6" placeholder="######" id="otp"
												name="otp"
												onkeyup="this.value=this.value.replace(/[^\d]/,'')" required
												style="letter-spacing: 2rem; text-align: center; font-size: large; font-weight: bolder;" />
										</div>
										<hr>
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-2 font-weight-bold">
												<b>Enter new Password</b> <img src="looking_eye.gif"
													width=10% height="10%" />
											</h1>
										</div>
										<div class=" form-group mb-2">
											<label for="newPassword">New Password:</label> <input
												type="password" class="form-control form-control-user"
												maxlength="4" placeholder="****" id="newPassword"
												name="newPassword" pattern="^[.\S]{4}$"
												title="Password must be of 4 alpha-numeric characters"
												style="letter-spacing: 2rem; text-align: center; font-size: large; font-weight: bolder;" />
										</div>
										<div class=" form-group mb-2">
											<label for="retypePassword">Retype Password:</label> <input
												type="password" class="form-control form-control-user"
												maxlength="4" placeholder="****" id="retypePassword"
												name="retypePassword" pattern="^[.\S]{4}$"
												title="Password must be of 4 alpha-numeric characters"
												style="letter-spacing: 2rem; text-align: center; font-size: large; font-weight: bolder;" />
										</div>
										<div class="text-center">
											<button type="submit" id="btnVerify"
												class="btn btn-primary btn-user btn-block font-weight-bolder text-light">Change
												Password</button>
										</div>

									</form>


									<hr>
								</div>
							</div>
							<div class="col-md-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h3 text-gray-900 mb-2 font-weight-bold">
											<b>Help Section</b>
										</h1>
										<p class="text-success" style="text-align: center;">OTP
											has been sent to your registered Email ID.</p>

										<p class="mb-4" style="text-align: center;">Try login with
											new password after resetting it.</p>

										<p class="mb-4" style="text-align: center;">Stay safe from
											Shoulder Surfing</p>

									</div>
									<hr>
									<div class="text-center">
										<a class="small" href="/register">Create an Account!</a>
									</div>
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

		</div>

	</div>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>

	<script>
		function validateCredentials() {
			let userName = $('#userName').val();
			let password = $('#currentPassword').val();

			console.log("UserName : " + userName + " Password : " + password);
			if (!userName || !password) {
				alert('Please enter UserName and your CurrentPassword to continue forward');
			} else if (password.length < 4) {
				alert("Please Enter 4 alphanumeric characters in Password field without space.");
			} else {

				$
						.ajax({
							type : "POST",
							url : "validateCredentials",
							contentType : "application/json; charset=utf-8",
							data : {
								"userName" : userName,
								"password" : password
							},
							cache : false,
							success : function(result) {
								var response = result;

								if (response == 1) {
									$('#validateCredentials').collapse('hide');
									$('#inputPassword').collapse('show');
									$('#hiddenUserName').val(userName);
									$('#hiddenPassword').val(password);
								} else if (response == 301) {
									alert("Your account has been Blocked Permanently. Please Contact Administrator for further enquiry.");
								} else {
									alert("Credentials are incorrect, Please try Again.");
								}

								/* if (response == 200) {
									$('#inputUserName').collapse('hide');
									$('#inputPassword').collapse('show');
									$('#hiddenUserName').val(userId);
								} else if (response == 403) {
									alert("Your Account has been blocked permanently. Please Contact Administrator.");
								} else if (response == 404) {
									alert("Username does not exist");
								} else {
									alert("Unecessary Error Faced, Please try again.");
								} */

							},
							error : function(err) {
								alert("Error Faced, Please try Again!!!!");
							}
						});

			}
		}
	</script>

</body>


</html>
