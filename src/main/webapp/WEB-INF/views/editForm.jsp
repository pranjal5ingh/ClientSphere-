<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Employee</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
	font-family: "Poppins", sans-serif;
}

.card {
	border-radius: 15px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
	border: none;
}

h2 {
	font-weight: 600;
	color: #343a40;
}

.btn-custom {
	background-color: #ffc107;
	border: none;
	font-weight: 600;
	transition: 0.3s;
}

.btn-custom:hover {
	background-color: #e0a800;
	transform: scale(1.05);
}

label {
	font-weight: 500;
	color: #495057;
}

.form-control:focus {
	border-color: #ffc107;
	box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25);
}
</style>
</head>
<body>

	<main class="content">
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-10">
					<div class="card p-4">
						<h2 class="text-center mb-4">✏️ Edit Employee</h2>

						<form action="updateEmpForm" method="post">

							<!-- Hidden ID -->
							<input type="hidden" name="id" value="">

							<!-- Employee Name -->
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="empName" class="form-label">Employee Name</label> <input
										type="text" class="form-control" id="empName" name="name"
										placeholder="Enter employee name" required>
								</div>

								<!-- Email -->
								<div class="col-md-6">
									<label for="empEmail" class="form-label">Email</label> <input
										type="email" class="form-control" id="empEmail" name="email"
										placeholder="Enter email" required>
								</div>
							</div>

							<!-- Password & Age -->
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="empPassword" class="form-label">Password</label> <input
										type="password" class="form-control" id="empPassword"
										name="password" placeholder="Enter password" required>
								</div>

								<div class="col-md-6">
									<label for="empAge" class="form-label">Age</label> <input
										type="number" class="form-control" id="empAge" name="age"
										placeholder="Enter age" min="18" max="65" required>
								</div>
							</div>

							<!-- Gender -->
							<div class="mb-3">
								<label class="form-label d-block">Gender</label>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="male" value="Male"> <label
										class="form-check-label" for="male">Male</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="female" value="Female"> <label
										class="form-check-label" for="female">Female</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="other" value="Other"> <label
										class="form-check-label" for="other">Other</label>
								</div>
							</div>

							<!-- Address -->
							<div class="mb-3">
								<label for="empAddress" class="form-label">Address</label>
								<textarea class="form-control" id="empAddress" name="address"
									rows="3" placeholder="Enter address"></textarea>
							</div>

							<!-- Role & Phone -->
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="empRole" class="form-label">Role</label> <input
										type="text" class="form-control" id="empRole" name="role"
										placeholder="Enter role" required>
								</div>
								<div class="col-md-6">
									<label for="empPhone" class="form-label">Phone Number</label> <input
										type="tel" class="form-control" id="empPhone" name="phone"
										placeholder="Enter phone number" pattern="[0-9]{10}" required>
								</div>
							</div>

							<!-- Buttons -->
							<div class="text-center mt-4">
								<button type="submit" class="btn btn-custom px-5 py-2">Update
									Employee</button>
								<a href="employeeList" class="btn btn-secondary px-4 py-2 ms-2">Cancel</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
