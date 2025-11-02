<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css"
	href="css/admin-profile-style.css">
<script defer
	src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<script defer
	src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>

<body class="bg-gray-100 font-sans">

	<!-- Main container for vertical layout -->
	<div class="flex flex-col min-h-screen">

		<!-- Top Navbar (Rebuilt with Tailwind) -->
		<nav class=" navbar text-white shadow-md">
			<div
				class="container mx-auto px-4 flex justify-between items-center h-16">
				<!-- Wrapper for Brand and Links -->
				<div class="flex items-center space-x-10">
					<!-- Brand -->
					<a class="text-2xl font-bold" href="#">CRM Admin</a>

					<!-- Menu Items (Desktop) -->
					<ul class="hidden md:flex items-center space-x-6">
						<li><a
							class="hover:text-blue-300 transition duration-200 flex items-center space-x-1.5"
							href="/admindashboard"> <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
						</a></li>

						<!-- Product Dropdown -->
						<li class="relative group" x-data="{ open: false }"
							@click.outside="open = false"><a href="#"
							class="hover:text-blue-300 transition duration-200 flex items-center space-x-1.5"
							@click.prevent="open = !open"> <i class="bi bi-box-seam"></i>
								<span>Product</span> <i class="bi bi-chevron-down text-xs ml-1"></i>
						</a>

							<ul
								class="absolute left-0 mt-2 w-48 bg-white text-gray-800 rounded-md shadow-lg py-1 z-50"
								x-show="open" style="display: none;">
								<li><a href="#"
									class="block px-4 py-2 text-sm hover:bg-gray-100">Product's
										List</a></li>
								<li><a href="/productAdd"
									class="block px-4 py-2 text-sm hover:bg-gray-100">Add
										Product</a></li>
							</ul></li>

						<!-- Employees Dropdown -->
						<li class="relative" x-data="{ open: false }"
							@click.outside="open = false"><a href="#"
							class="hover:text-blue-300 transition duration-200 flex items-center space-x-1.5"
							@click.prevent="open = !open"> <i class="bi bi-people-fill"></i>
								<span>Employees</span> <i
								class="bi bi-chevron-down text-xs ml-1"></i>
						</a>
							<ul
								class="absolute left-0 mt-2 w-48 bg-white text-gray-800 rounded-md shadow-lg py-1 z-50"
								x-show="open" style="display: none;">

								<li><a href="/empManager"
									class="block px-4 py-2 text-sm hover:bg-gray-100">All
										Employees</a></li>
								<li><a href="/empAdd"
									class="block px-4 py-2 text-sm hover:bg-gray-100">Add
										Employee</a></li>
							</ul></li>

						<li><a
							class="hover:text-blue-300 transition duration-200 flex items-center space-x-1.5"
							href="#"> <i class="bi bi-graph-up"></i> <span>Sales</span>
						</a></li>
						<li><a
							class="hover:text-blue-300 transition duration-200 flex items-center space-x-1.5"
							href="#"> <i class="bi bi-gear"></i> <span>Settings</span>
						</a></li>
					</ul>
				</div>

				<!-- Mobile Menu Button -->
				<button id="mobileMenuButton"
					class="md:hidden text-white focus:outline-none"
					aria-label="Toggle menu" aria-expanded="false"
					aria-controls="navbarMenu">
					<i class="bi bi-list text-3xl"></i>
				</button>

				<!-- Menu Items (Desktop) -->
				<div class="hidden md:flex items-center">
					<!-- Right Profile Section -->
					<div
						class="flex items-center space-x-4 pl-6 border-l border-gray-700">
						<div class="text-right hidden sm:block">
							<div class="font-semibold text-sm">Pranjal Singh</div>
							<small class="text-gray-300 text-xs">Administrator</small>
						</div>
						<img class="w-10 h-10 rounded-full"
							src="https://i.pravatar.cc/150?img=12" alt="avatar"> <a
							class="bg-red-600 hover:bg-red-700 text-white px-3 py-1.5 rounded-md text-sm font-medium transition duration-200 flex items-center space-x-1.5"
							href="logout"> <i class="bi bi-box-arrow-right"></i> <span
							class="hidden lg:inline">Logout</span>
						</a>
					</div>
				</div>
			</div>

			<!-- Mobile Menu (Collapsible) -->
			<div id="navbarMenu"
				class="md:hidden hidden px-4 pt-2 pb-4 space-y-2">
				<a class="block py-2 px-2 rounded-md hover:bg-gray-700 transition"
					href="/admindashboard"><i class="bi bi-speedometer2 me-2"></i>
					Dashboard</a>

				<!-- Mobile Product Dropdown -->
				<div>
					<a href="#"
						class="block py-2 px-2 rounded-md hover:bg-gray-700 transition"><i
						class="bi bi-box-seam me-2"></i> Product</a>
					<ul class="pl-6 mt-1 space-y-1">
						<li><a href="#"
							class="block py-1 text-sm text-gray-300 hover:text-white">Product's
								List</a></li>
						<li><a href="/productAdd"
							class="block py-1 text-sm text-gray-300 hover:text-white">Add
								Product</a></li>
					</ul>
				</div>

				<!-- Mobile Employees Dropdown -->
				<div>
					<a href="#"
						class="block py-2 px-2 rounded-md hover:bg-gray-700 transition"><i
						class="bi bi-people-fill me-2"></i> Employees</a>
					<ul class="pl-6 mt-1 space-y-1">
						<li><a href="/empManager"
							class="block py-1 text-sm text-gray-300 hover:text-white">All
								Employees</a></li>
						<li><a href="/empAdd"
							class="block py-1 text-sm text-gray-300 hover:text-white">Add
								Employee</a></li>
					</ul>
				</div>

				<a class="block py-2 px-2 rounded-md hover:bg-gray-700 transition"
					href="#"><i class="bi bi-graph-up me-2"></i> Sales</a> <a
					class="block py-2 px-2 rounded-md hover:bg-gray-700 transition"
					href="#"><i class="bi bi-gear me-2"></i> Settings</a>

				<!-- Mobile Profile Section -->
				<div class="border-t border-gray-700 pt-4 space-y-3">
					<div class="flex items-center space-x-3 px-2">
						<img class="w-10 h-10 rounded-full"
							src="https://i.pravatar.cc/150?img=12" alt="avatar">
						<div>
							<div class="font-semibold text-sm">Pranjal Singh</div>
							<small class="text-gray-300 text-xs">Administrator</small>
						</div>
					</div>
					<a
						class="bg-red-600 hover:bg-red-700 text-white px-3 py-2 rounded-md text-sm font-medium transition flex items-center justify-center space-x-1.5 w-full"
						href="logout"> <i class="bi bi-box-arrow-right"></i> <span>Logout</span>
					</a>
				</div>
			</div>
		</nav>

		<!-- Main Content Area -->
		<main class="flex-grow flex items-center justify-center p-6">

			<!-- Add Product Form Card -->
			<div class="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md">
				<h2 class="text-2xl font-bold text-center mb-6 text-gray-800">Add
					New Product</h2>

				<!-- Product Form -->
				<form action="addProductForm" method="post"
					enctype="multipart/form-data" class="space-y-5" method="post"
					modelAttribute="productAttr">

					<!-- Product Name -->
					<div>
						<label for="name"
							class="block text-sm font-medium text-gray-700 mb-1">Product
							Name</label> <input type="text" id="productname" name="productname"
							required
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
					</div>

					<!-- Product Description -->
					<div>
						<label for="description"
							class="block text-sm font-medium text-gray-700 mb-1">Description</label>
						<textarea id="description" name="description" rows="3" required
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition"></textarea>
					</div>

					<!-- Product Price -->
					<div>
						<label for="price"
							class="block text-sm font-medium text-gray-700 mb-1">Price
							(₹)</label> <input type="number" id="price" name="price" step="0.01"
							required
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
					</div>

					<!-- Product Category -->
					<div>
						<label for="category"
							class="block text-sm font-medium text-gray-700 mb-1">Category</label>
						<select id="category" name="category"
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition bg-white">
							<option value="">Select Category</option>
							<option value="Electronics">Electronics</option>
							<option value="Clothing">Clothing</option>
							<option value="Accessories">Accessories</option>
							<option value="Home Decor">Home Decor</option>
						</select>
					</div>

					<!-- Product Image -->
					<div>
						<label for="image"
							class="block text-sm font-medium text-gray-700 mb-1">Product
							Image</label> <input type="file" id="productimage" name="productimage"
							class="w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 transition">
					</div>

					<!-- Submit Button -->
					<div class="text-center pt-2">
						<button type="submit"
							class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-2.5 rounded-lg shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50 transition w-full sm:w-auto">
							Add Product</button>
					</div>
				</form>
			</div>
		</main>
	</div>

	<!-- Simple JS for Mobile Menu Toggle -->
	<script>
        document.getElementById('mobileMenuButton').addEventListener('click', function() {
            var menu = document.getElementById('navbarMenu');
            var isExpanded = this.getAttribute('aria-expanded') === 'true';
            menu.classList.toggle('hidden');
            this.setAttribute('aria-expanded', !isExpanded);
        });
    </script>

</body>
</html>

