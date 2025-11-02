<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>CRM Admin Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
 

    <!-- Custom Styling -->
    <link rel="stylesheet" type="text/css" href="css/admin-profile-style.css">

  
</head>
<body>

   
     <!-- Top Navbar -->
  <nav  class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand text-white" href="#">CRM Admin</a>
      <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarMenu">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" href="/admindashboard"><i class="bi bi-speedometer2 me-1"></i> Dashboard</a>
          </li>
           <li class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="employeeDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-people-fill me-1"></i> Product
             </a>
             <ul class="dropdown-menu" aria-labelledby="employeeDropdown">
                <li><a class="dropdown-item" href="#">Product's List</a></li>
                <li><a class="dropdown-item" href="/productAdd">Add Product's</a></li>
            </ul>
         </li>

         <li class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="employeeDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-people-fill me-1"></i> Employees
             </a>
             <ul class="dropdown-menu" aria-labelledby="employeeDropdown">
                <li><a class="dropdown-item" href="/empManager">All Employees</a></li>
                <li><a class="dropdown-item" href="/empAdd">Add Employee</a></li>
            </ul>
         </li>

          <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-graph-up me-1"></i> Sales</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-gear me-1"></i> Settings</a></li>
        </ul>

        <!-- Right Profile -->
        <div class="d-flex align-items-center gap-3">
          <div class="text-end profile-info d-none d-sm-block">
            <div class="fw-semibold">Pranjal Singh</div>
            <small>Administrator</small>
          </div>
          <img class="avatar" src="https://i.pravatar.cc/150?img=12" alt="avatar">
          <a class="btn btn-sm btn-danger" href="logout">
            <i class="bi bi-box-arrow-right"></i> Logout
          </a>
        </div>
      </div>
    </div>
  </nav>

 <!-- Bootstrap bundle (includes Popper) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  
</body>
</html>