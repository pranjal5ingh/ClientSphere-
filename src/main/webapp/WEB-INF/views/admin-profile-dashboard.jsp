<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CRM Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet" type="text/css"
	href="/css/admin-profile-style.css" />

</head>

<body>
<body>
	<jsp:include page="admin-menubar-panel.jsp"></jsp:include>

	<!-- Main Content Wrapper -->
	<main class="content">
		<div class="container-fluid mt-4">

			<!-- Stats -->
			<div class="row g-4 mb-4">
				<div class="col-sm-6 col-md-4">
					<div
						class="custom-card d-flex justify-content-between align-items-center">
						<div>
							<small class="text-muted">Total Products</small>
							<div class="fs-4 fw-bold" id="statProducts">120</div>
						</div>
						<i class="bi bi-box-seam text-primary stat-icon"></i>
					</div>
				</div>

				<div class="col-sm-6 col-md-4">
					<div
						class="custom-card d-flex justify-content-between align-items-center">
						<div>
							<small class="text-muted">Total Employees</small>
							<div class="fs-4 fw-bold" id="statEmployees">0</div>
						</div>
						<i class="bi bi-people-fill text-success stat-icon"></i>
					</div>
				</div>

				<div class="col-sm-12 col-md-4">
					<div
						class="custom-card d-flex justify-content-between align-items-center">
						<div>
							<small class="text-muted">This Week Sales</small>
							<div class="fs-4 fw-bold" id="statSales">$0</div>
						</div>
						<i class="bi bi-currency-dollar text-warning stat-icon"></i>
					</div>
				</div>
			</div>

			<!-- Charts -->
			<div class="row g-4 mb-4">
				<div class="col-md-6">
					<div class="custom-card">
						<h6 class="fw-bold mb-3">Sales Progress (Week)</h6>
						<canvas id="salesChart"></canvas>
					</div>
				</div>
				<div class="col-md-6">
					<div class="custom-card text-center">
						<h6 class="fw-bold mb-3">Customer Engagement & Products
							Growth</h6>
						<div style="max-width: 300px; margin: 0 auto;">
							<canvas id="customerChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			
		</div>
	</main>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    // Sales Progress (Bar Chart)
    new Chart(document.getElementById('salesChart'), {
      type: 'bar',
      data: {
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        datasets: [{
          label: 'Sales ($)',
          data: [1200, 1900, 1500, 2200, 2000, 2500, 2300],
          backgroundColor: 'rgba(78,84,200,0.8)'
        }]
      },
      options: { responsive: true, plugins: { legend: { display: false } } }
    });

    // Customer Engagement & Products Growth (Pie Chart)
    new Chart(document.getElementById('customerChart'), {
      type: 'pie',
      data: {
        labels: ['Active Customers', 'Returning', 'New Signups'],
        datasets: [{
          data: [60, 25, 15],
          backgroundColor: ['#4e54c8', '#10b981', '#f59e0b']
        }]
      },
      options: { responsive: true }
    });
  </script>
</body>

</html>