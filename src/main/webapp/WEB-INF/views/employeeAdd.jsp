<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Add Employee</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Custom Styling -->
<link rel="stylesheet" type="text/css"href="css/admin-profile-style.css">

<style>
body {
	/* UPDATED: Changed to a warm, sunset-themed animated gradient */
	height: 100vh;
	margin: 0;
	background: linear-gradient(270deg, #36d1dc, #5b86e5);
	background-size: 400% 400%;
	animation: gradientShift 2s ease infinite;
	font-family: "Poppins", sans-serif;
}

/* Defines the animation for the background gradient */
@
keyframes gradientShift { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
.card {
	border-radius: 16px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
	animation: fadeIn 0.6s ease-in-out;
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
}

/* Defines the fade-in animation for the card */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.form-label {
	font-weight: 500;
}

.btn-custom {
	background: linear-gradient(135deg, #6c63ff, #5a4be1);
	color: #fff;
	font-weight: 600;
	border: none;
	transition: all 0.3s ease;
}

.btn-custom:hover {
	background: linear-gradient(135deg, #5a4be1, #4b3bd9);
	color: #fff;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.content {
	padding-top: 20px;
}
</style>
</head>
<body>

	<!-- Top Navbar -->
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand text-white" href="#">CRM Admin</a>
			<button class="navbar-toggler text-white" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarMenu">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="/admindashboard"><i class="bi bi-speedometer2 me-1"></i>
							Dashboard</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="employeeDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-people-fill me-1"></i> Product
					</a>
						<ul class="dropdown-menu" aria-labelledby="employeeDropdown">
							<li><a class="dropdown-item" href="#">Product's List</a></li>
							<li><a class="dropdown-item" href="#">Add Product's</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="employeeDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-people-fill me-1"></i> Employees
					</a>
						<ul class="dropdown-menu" aria-labelledby="employeeDropdown">
							<li><a class="dropdown-item" href="/empManager">All
									Employees</a></li>
							<li><a class="dropdown-item" href="/empAdd">Add Employee</a></li>
						</ul></li>

					<li class="nav-item"><a class="nav-link" href="#"><i
							class="bi bi-graph-up me-1"></i> Sales</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="bi bi-gear me-1"></i> Settings</a></li>
				</ul>

				<!-- Right Profile -->
				<div class="d-flex align-items-center gap-3">
					<div class="text-end profile-info d-none d-sm-block">
						<div class="fw-semibold">Pranjal Singh</div>
						<small>Administrator</small>
					</div>
					<img class="avatar" src="https://i.pravatar.cc/150?img=12"
						alt="avatar"> <a class="btn btn-sm btn-danger" href="logout">
						<i class="bi bi-box-arrow-right"></i> Logout
					</a>
				</div>
			</div>
		</div>
	</nav>


	<!-- Page Content -->
	<main class="content">
		<div class="container-fluid mt-4">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-10">
					<div class="card p-4">
						<h2 class="text-center mb-4">Add Employee</h2>

						<form:form id="employeeForm" class="row g-3" action="addEmpForm"
							method="post" modelAttribute="modelEmpAttr">

							<!-- Employee Name -->
							<div class="col-md-6">
								<label for="empName" class="form-label">Employee Name</label>
								<form:input cssClass="form-control" id="empName" path="name" />
								<form:errors path="name" cssClass="text-danger" />
							</div>

							<!-- Email -->
							<div class="col-md-6">
								<label for="empEmail" class="form-label">Email</label>
								<form:input class="form-control" id="empEmail" path="email" />
								<form:errors path="email" cssClass="text-danger" />
							</div>

							<!-- Password -->
							<div class="col-md-6">
								<label for="empPassword" class="form-label">Password</label>
								<form:password cssClass="form-control" id="empPassword"
									path="password" />
								<form:errors path="password" cssClass="text-danger" />
							</div>

							<!-- Age -->
							<div class="col-md-4">
								<label for="empAge" class="form-label">Age</label>
								<form:input type="number" class="form-control" id="empAge"
									path="age" />
								<form:errors path="age" cssClass="text-danger" />
							</div>

							<!-- Gender -->
							<div class="col-md-8">
								<label class="form-label d-block">Gender</label>
								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" id="male" value="Male"
										cssClass="form-check-input" />
									<label class="form-check-label" for="male">Male</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" id="female" value="Female"
										cssClass="form-check-input" />
									<label class="form-check-label" for="female">Female</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" id="other" value="Other"
										cssClass="form-check-input" />
									<label class="form-check-label" for="other">Other</label>
								</div>
								<form:errors path="gender" cssClass="text-danger" />
							</div>

							<!-- Address -->
							<div class="col-12">
								<label for="empAddress" class="form-label">Address</label>
								<textarea class="form-control" id="empAddress" name="address"
									rows="3"></textarea>
								<form:errors path="address" cssClass="text-danger" />
							</div>

							<!-- Role -->
							<div class="col-md-6">
								<label for="empRole" class="form-label">Role</label>
								<form:select path="role" cssClass="form-select" id="empRole">
									<form:option value="">-- Select Role --</form:option>
									<form:option value="DEVELOPER">Developer</form:option>
									<form:option value="MANAGER">Manager</form:option>
									<form:option value="EMPLOYEE">Employee</form:option>
									<form:option value="INTERN">Intern</form:option>
								</form:select>
								<form:errors path="role" cssClass="text-danger" />
							</div>

							<!-- Phone -->
							<div class="col-md-6">
								<label for="empPhone" class="form-label">Phone Number</label>
								<form:input type="tel" class="form-control" id="empPhone"
									path="phone" />
								<form:errors path="phone" cssClass="text-danger" />
							</div>

							<!-- Submit -->
							<div class="col-12 text-center mt-4">
								<button type="submit" class="btn btn-custom px-5 py-2">Add
									Employee</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<div class="modal fade" id="resultModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body text-center">
					<c:if test="${success}">
						<div class="alert alert-success mb-0">✅ Employee added
							successfully!</div>
					</c:if>

					<c:if test="${error}">
						<div class="alert alert-danger mb-0">⚠️ Please fix the
							highlighted errors below.</div>
					</c:if>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	9
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
window.addEventListener("DOMContentLoaded", function () {
    const success = "${success}";
    const error = "${error}";
    if (success === "true" || error === "true") {
        var myModal = new bootstrap.Modal(document.getElementById('resultModal'));
        myModal.show();
    }
});

</script>

</body>
</html>

