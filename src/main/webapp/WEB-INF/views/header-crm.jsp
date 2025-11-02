<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CRM Application</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Styling -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold text-white" href="home"> <i
				class="bi bi-building-fill me-2"></i> CRM App
			</a>

			<button class="navbar-toggler text-white" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto align-items-lg-center">

					<!-- Home -->
					<li class="nav-item"><a
						class="nav-link text-white fw-medium d-flex align-items-center"
						href="home"> <i class="bi bi-house-door-fill me-2"></i> Home
					</a></li>

					<!-- About -->
					<li class="nav-item"><a
						class="nav-link text-white fw-medium d-flex align-items-center"
						href="#"> <i class="bi bi-info-circle-fill me-2"></i> About
					</a></li>

					<!-- Contact -->
					<li class="nav-item"><a
						class="nav-link text-white fw-medium d-flex align-items-center"
						href="#"> <i class="bi bi-envelope-fill me-2"></i> Contact
					</a></li>

					<!-- Login/Register Merged Button -->
					<li class="nav-item ms-2"><a
						class="btn btn-warning fw-semibold px-4 py-2 rounded-pill shadow-sm d-flex align-items-center"
						href="adminlogin"> <i class="bi bi-box-arrow-in-right me-2"></i>
							Login / Register
					</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Add padding to avoid content hidden under fixed navbar -->
	<div style="padding-top: 80px;"></div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap Icons -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
		rel="stylesheet">
</body>

</html>