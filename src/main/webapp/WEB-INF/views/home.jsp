<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Application</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom Styling -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body> 
    
   <jsp:include page="header-crm.jsp"></jsp:include>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>Welcome to CRM Application</h1>
            <p>Manage customers, grow business, and streamline operations with ease.</p>
            <a href="#" class="btn btn-light btn-lg">Get Started</a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
                            <img src="https://img.icons8.com/color/96/000000/dashboard-layout.png" alt="Dashboard">
                            <h5>Smart Dashboard</h5>
                            <p>Track all your activities and insights in one place with real-time analytics.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
                            <img src="https://img.icons8.com/color/96/000000/handshake.png" alt="Clients">
                            <h5>Client Management</h5>
                            <p>Manage your clients effectively with automated reminders and tracking.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
                            <img src="https://img.icons8.com/color/96/000000/commercial.png" alt="Growth">
                            <h5>Business Growth</h5>
                            <p>Boost your growth with AI-driven insights and customer engagement tools.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- More Section -->
    <section class="py-5 bg-light" id="more">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">More Options</h2>
                <p class="text-muted">Explore additional features and services of our CRM Application.</p>
            </div>

            <div class="row g-4">
                <!-- Services -->
                <div class="col-md-3">
                    <div class="card shadow-sm h-100 text-center border-0">
                        <div class="card-body">
                            <i class="bi bi-briefcase-fill text-warning display-4 mb-3"></i>
                            <h5 class="fw-semibold">Services</h5>
                            <p class="text-muted">Get tailored services to manage clients and grow your business.</p>
                            <a href="#" class="btn btn-outline-warning btn-sm">Learn More</a>
                        </div>
                    </div>
                </div>

                <!-- Support -->
                <div class="col-md-3">
                    <div class="card shadow-sm h-100 text-center border-0">
                        <div class="card-body">
                            <i class="bi bi-headset text-danger display-4 mb-3"></i>
                            <h5 class="fw-semibold">Support</h5>
                            <p class="text-muted">We provide 24/7 customer support to assist you anytime.</p>
                            <a href="#" class="btn btn-outline-danger btn-sm">Contact Support</a>
                        </div>
                    </div>
                </div>

                <!-- Login -->
                <div class="col-md-3">
                    <div class="card shadow-sm h-100 text-center border-0">
                        <div class="card-body">
                            <i class="bi bi-box-arrow-in-right text-primary display-4 mb-3"></i>
                            <h5 class="fw-semibold">Login</h5>
                            <p class="text-muted">Already a user? Login to access your dashboard quickly.</p>
                            <a href="reglogin.html" class="btn btn-outline-primary btn-sm">Login</a>
                        </div>
                    </div>
                </div>

                <!-- Register -->
                <div class="col-md-3">
                    <div class="card shadow-sm h-100 text-center border-0">
                        <div class="card-body">
                            <i class="bi bi-person-plus-fill text-success display-4 mb-3"></i>
                            <h5 class="fw-semibold">Register</h5>
                            <p class="text-muted">New here? Register and start managing your customers today.</p>
                            <a href="reglogin.html" class="btn btn-outline-success btn-sm">Register</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-light pt-5 pb-3 mt-5">
        <div class="container">
            <div class="row">

                <!-- Brand / About -->
                <div class="col-md-4 mb-4">
                    <h5 class="fw-bold"><i class="bi bi-building-fill me-2"></i> CRM App</h5>
                    <p class="text-muted">
                        A simple yet powerful CRM solution to manage customers, track growth, and streamline operations.
                    </p>
                </div>

                <!-- Quick Links -->
                <div class="col-md-4 mb-4">
                    <h5 class="fw-bold">Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none"><i
                                    class="bi bi-house-door-fill me-2"></i> Home</a></li>
                        <li><a href="#" class="text-light text-decoration-none"><i
                                    class="bi bi-info-circle-fill me-2"></i> About</a></li>
                        <li><a href="#" class="text-light text-decoration-none"><i class="bi bi-envelope-fill me-2"></i>
                                Contact</a></li>
                        <li><a href="#more" class="text-light text-decoration-none"><i
                                    class="bi bi-grid-3x3-gap-fill me-2"></i> More</a></li>
                    </ul>
                </div>

                <!-- Social / Contact -->
                <div class="col-md-4 mb-4">
                    <h5 class="fw-bold">Connect With Us</h5>
                    <div class="d-flex gap-3 mb-3">
                        <a href="#" class="text-light fs-4"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="text-light fs-4"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="text-light fs-4"><i class="bi bi-linkedin"></i></a>
                        <a href="#" class="text-light fs-4"><i class="bi bi-instagram"></i></a>
                    </div>
                    <p class="mb-1"><i class="bi bi-telephone-fill me-2"></i> +91 98765 43210</p>
                    <p class="mb-0"><i class="bi bi-envelope-fill me-2"></i> support@crmapp.com</p>
                </div>

            </div>

            <hr class="border-light">

            <!-- Bottom -->
            <div class="text-center">
                <p class="mb-0">&copy; 2025 CRM App. All Rights Reserved.</p>
            </div>
        </div>
    </footer>




    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</body>

</html>