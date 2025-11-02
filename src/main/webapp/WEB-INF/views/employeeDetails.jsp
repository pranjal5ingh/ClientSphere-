<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">


<!-- Custom Styling -->
<link rel="stylesheet" type="text/css"
	href="css/admin-profile-style.css">

<style>
body {
	background: #f8f9fa;
}

.card, .table-container, .form-container {
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	background: #fff;
}

.modal-content {
	border-radius: 12px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
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
							<li><a class="dropdown-item" href="/productAdd">Add
									Product's</a></li>
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


	<div class="container my-5">

		<!-- Search Bar -->
		<div class="row mb-4">
			<div class="col-md-12">
				<input type="text" id="searchInput" class="form-control"
					placeholder="🔍 Search employees by name, role or salary...">
			</div>
		</div>

		<!-- Dashboard Cards -->
		<div class="row mb-4">
			<div class="col-md-4">
				<div class="card text-center p-3">
					<h5>Total Employees</h5>
					<h2 id="totalEmp">0</h2>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-center p-3">
					<h5>Developers</h5>
					<h2 id="totalDev">0</h2>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-center p-3">
					<h5>Managers</h5>
					<h2 id="totalMgr">0</h2>
				</div>
			</div>
		</div>

		<!-- Employee Table -->
		<div class="table-container">
			<h4 class="mb-3">Employee Details</h4>
			<table
				class="table table-striped table-hover align-middle text-center">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Full Name</th>
						<th>Role</th>
						<th>Email</th>
						<th>Phone Number</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${model_list_emp}">
						<tr>
							<td>${employee.getId()}</td>
							<td>${employee.getName()}</td>
							<td>${employee.getRole()}</td>
							<td>${employee.getEmail()}</td>
							<td>${employee.getPhone()}</td>
							<td>
								<!-- Edit Button --> <a href="javascript:void(0);"
								class="btn btn-primary btn-sm"
								onclick="openEditModal(
                               '${employee.getId()}',
                               '${employee.getName()}',
                               '${employee.getRole()}',
                               '${employee.getEmail()}',
                               '${employee.getPhone()}',
                               '${employee.getPassword()}',
                               '${employee.getAge()}',
                               '${employee.getGender()}',
                               '${employee.getAddress()}'
                           )">
									<i class="fas fa-edit"></i> Edit
							</a> <!-- Delete Button --> <a href="javascript:void(0);"
								class="btn btn-danger btn-sm"
								onclick="openDeleteModal('${employee.getEmail()}')"> <i
									class="fas fa-trash"></i> Delete
							</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- Pagination -->
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<c:if test="${currentPage > 0}">
						<li class="page-item"><a class="page-link"
							href="?page=${currentPage - 1}&size=${pageSize}">Previous</a></li>
					</c:if>

					<c:if test="${totalPages > 0}">
						<c:forEach var="i" begin="0" end="${totalPages - 1}">
							<li class="page-item ${i == currentPage ? 'active' : ''}"><a
								class="page-link" href="?page=${i}&size=${pageSize}">${i + 1}</a>
							</li>
						</c:forEach>
					</c:if>

					<c:if test="${currentPage < totalPages - 1}">
						<li class="page-item"><a class="page-link"
							href="?page=${currentPage + 1}&size=${pageSize}">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Confirm Deletion</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					Are you sure you want to delete the employee with email: <strong
						id="employeeEmail"></strong> ?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<a href="#" id="confirmDeleteBtn" class="btn btn-danger">Delete</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Edit Employee Modal -->
	<div class="modal fade" id="editModal" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content rounded-5 shadow-lg border-0">
				<!-- Modal Header -->
				<div class="modal-header bg-gradient-primary text-white py-3">
					<h5 class="modal-title" id="editModalLabel">
						<i class="fas fa-user-edit me-2"></i>Edit Employee
					</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body p-4 bg-light">
					<form id="updateForm" method="post" action="updateForm">
						<input type="hidden" id="editEmpId" name="id">

						<div class="row g-3">
							<!-- Name -->
							<div class="col-md-6">
								<label class="form-label fw-semibold">Name</label>
								<div class="input-group">
									<span class="input-group-text bg-primary text-white"><i
										class="fas fa-user"></i></span> <input type="text" id="editEmpName"
										name="name" class="form-control" placeholder="Enter name"
										required>
								</div>
							</div>

							<!-- Role -->
							<div class="col-md-6">
								<label class="form-label fw-semibold">Role</label>
								<div class="input-group">
									<span class="input-group-text bg-primary text-white"><i
										class="fas fa-briefcase"></i></span> <input type="text"
										id="editEmpRole" name="role" class="form-control"
										placeholder="Enter role" required>
								</div>
							</div>

							<!-- Email -->
							<div class="col-md-6">
								<label class="form-label fw-semibold">Email</label>
								<div class="input-group">
									<span class="input-group-text bg-primary text-white"><i
										class="fas fa-envelope"></i></span> <input type="email"
										id="editEmpEmail" name="email" class="form-control"
										placeholder="Enter email" required readonly>
								</div>
							</div>

							<!-- Phone -->
							<div class="col-md-6">
								<label class="form-label fw-semibold">Phone</label>
								<div class="input-group">
									<span class="input-group-text bg-primary text-white"><i
										class="fas fa-phone"></i></span> <input type="text" id="editEmpPhone"
										name="phone" class="form-control"
										placeholder="10-digit number" required pattern="\d{10}">
								</div>
							</div>

							<!-- Password -->
							<div class="col-md-6">
								<label class="form-label fw-semibold">Password</label>
								<div class="input-group">
									<span class="input-group-text bg-primary text-white"><i
										class="fas fa-key"></i></span> <input type="password"
										id="editEmpPassword" name="password" class="form-control"
										placeholder="Enter new password">
								</div>
							</div>

							<!-- Age -->
							<div class="col-md-6">
								<label class="form-label fw-semibold">Age</label> <input
									type="number" id="editEmpAge" name="age" class="form-control"
									min="18" max="70" placeholder="Enter age">
							</div>

							<!-- Gender -->
							<div class="col-md-12">
								<label class="form-label fw-semibold d-block">Gender</label>
								<div class="btn-group" role="group"
									aria-label="Gender selection">
									<input type="radio" class="btn-check" name="gender"
										id="editMale" value="Male" readonly> <label
										class="btn btn-outline-primary" for="editMale">Male</label> <input
										type="radio" class="btn-check" name="gender" id="editFemale"
										value="Female" readonly> <label
										class="btn btn-outline-primary" for="editFemale">Female</label>

									<input type="radio" class="btn-check" name="gender"
										id="editOther" value="Other" readonly> <label
										class="btn btn-outline-primary" for="editOther">Other</label>
								</div>
							</div>

							<!-- Address -->
							<div class="col-12">
								<label class="form-label fw-semibold">Address</label>
								<textarea id="editEmpAddress" name="address"
									class="form-control" rows="3" placeholder="Enter address"></textarea>
							</div>
						</div>

						<!-- Modal Footer -->
						<div class="mt-4 d-flex justify-content-end">
							<button type="button" class="btn btn-outline-secondary me-2"
								data-bs-dismiss="modal">
								<i class="fas fa-times me-1"></i> Cancel
							</button>
							<button type="submit" class="btn btn-success">
								<i class="fas fa-save me-1"></i> Save Changes
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content rounded-4 shadow-lg border-0">
				<div class="modal-header bg-success text-white">
					<h5 class="modal-title">
						<i class="fas fa-check-circle me-2"></i>Success
					</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">Employee details updated successfully!
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						data-bs-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS + Icons -->
	<script src="https://kit.fontawesome.com/a076d05399.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
function openDeleteModal(email) {
    document.getElementById('employeeEmail').innerText = email;
    var encodedEmail = encodeURIComponent(email);
    document.getElementById('confirmDeleteBtn').href = 'deleteEmployee?email=' + encodedEmail;
    var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    deleteModal.show();
}

function openEditModal(id, name, role, email, phone, password = "", age = "", gender = "", address = "") {
    document.getElementById("editEmpId").value = id;
    document.getElementById("editEmpName").value = name;
    document.getElementById("editEmpRole").value = role;
    document.getElementById("editEmpEmail").value = email;
    document.getElementById("editEmpPhone").value = phone;
    document.getElementById("editEmpPassword").value = password;
    document.getElementById("editEmpAge").value = age;
    document.getElementById("editEmpAddress").value = address;

    if (gender) {
        const genderRadio = document.querySelector(`input[name="gender"][value="${gender}"]`);
        if (genderRadio) genderRadio.checked = true;
    }

    const modal = new bootstrap.Modal(document.getElementById("editModal"));
    modal.show();
}

// Show success modal if update was successful
window.addEventListener("DOMContentLoaded", function () {
    const success = "${success}";
    if (success === "true") {
        const successModal = new bootstrap.Modal(document.getElementById("successModal"));
        successModal.show();
    }
});
</script>
</body>
</html>
