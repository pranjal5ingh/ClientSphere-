<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Product List</title>

<!-- Tailwind -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- AlpineJS -->
<script src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"/>

<!-- Tailwind Custom Config -->
<script>
tailwind.config = {
  theme: {
    extend: {
      colors: {
        primary: "#2563EB",
        secondary: "#1E293B",
        accent: "#3B82F6",
      },
      boxShadow: {
        glow: "0 4px 20px rgba(37, 99, 235, 0.2)",
      },
    },
  },
};
</script>

</head>

<body class="bg-gradient-to-br from-gray-100 via-gray-50 to-white font-sans min-h-screen">

	<!-- ✅ NAVBAR (Perfectly Centered + Polished) -->
<nav class="bg-gradient-to-r from-blue-700 to-blue-600 text-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-6 flex justify-between items-left h-16">

    <!-- LEFT: Brand -->
    <a href="#" class="text-2xl font-bold tracking-wide hover:opacity-90 transition flex items-center space-x-2">
      <i class="bi bi-lightning-charge-fill text-yellow-300"></i>
      <span>CRM Admin</span>
    </a>

    <!-- CENTER: Menu (Desktop) -->
    <ul class="hidden md:flex items-center space-x-8 text-sm font-medium">
      <li>
        <a href="/admindashboard" class="flex items-center space-x-2 hover:text-blue-200 transition">
          <i class="bi bi-speedometer2"></i><span>Dashboard</span>
        </a>
      </li>

      <!-- Product Dropdown -->
      <li class="relative" x-data="{ open: false }" @click.outside="open = false">
        <a href="#" @click.prevent="open = !open"
           class="flex items-center space-x-2 hover:text-blue-200 transition">
          <i class="bi bi-box-seam"></i><span>Products</span>
          <i class="bi bi-chevron-down text-xs"></i>
        </a>
        <ul x-show="open" style="display:none"
          class="absolute left-0 mt-3 bg-white text-gray-700 rounded-lg shadow-lg overflow-hidden z-50 w-44">
          <li><a href="/productList" class="block px-4 py-2 hover:bg-gray-100">Product List</a></li>
          <li><a href="/productAdd" class="block px-4 py-2 hover:bg-gray-100">Add Product</a></li>
        </ul>
      </li>

      <!-- Employees Dropdown -->
      <li class="relative" x-data="{ open: false }" @click.outside="open = false">
        <a href="#" @click.prevent="open = !open"
           class="flex items-center space-x-2 hover:text-blue-200 transition">
          <i class="bi bi-people-fill"></i><span>Employees</span>
          <i class="bi bi-chevron-down text-xs"></i>
        </a>
        <ul x-show="open" style="display:none"
          class="absolute left-0 mt-3 bg-white text-gray-700 rounded-lg shadow-lg overflow-hidden z-50 w-44">
          <li><a href="/empManager" class="block px-4 py-2 hover:bg-gray-100">All Employees</a></li>
          <li><a href="/empAdd" class="block px-4 py-2 hover:bg-gray-100">Add Employee</a></li>
        </ul>
      </li>

      <li><a href="#" class="flex items-center space-x-2 hover:text-blue-200 transition"><i class="bi bi-graph-up"></i><span>Sales</span></a></li>
      <li><a href="#" class="flex items-center space-x-2 hover:text-blue-200 transition"><i class="bi bi-gear"></i><span>Settings</span></a></li>
    </ul>

    <!-- RIGHT: Profile -->
    <div class="hidden md:flex items-center space-x-4">
      <div class="text-right">
        <div class="font-semibold text-sm">Pranjal Singh</div>
        <small class="text-blue-200 text-xs">Administrator</small>
      </div>
      <img src="https://i.pravatar.cc/150?img=12"
           class="w-10 h-10 rounded-full border-2 border-white shadow">
      <a href="logout"
         class="bg-red-600 hover:bg-red-700 px-3 py-1.5 rounded-md flex items-center space-x-2 transition shadow text-sm font-medium">
         <i class="bi bi-box-arrow-right"></i><span>Logout</span>
      </a>
    </div>

    <!-- Mobile Menu Button -->
    <button class="md:hidden text-white text-3xl focus:outline-none">
      <i class="bi bi-list"></i>
    </button>

  </div>
</nav>



<!-- MAIN CONTENT -->
<section class="max-w-7xl mx-auto py-12 px-6">
    <h2 class="text-4xl font-extrabold text-center text-gray-800 mb-10 tracking-tight">
        <span class="text-blue-600">Product</span> Inventory
    </h2>

    <!-- ✅ Category Filter (stays same) -->
    <form action="/productList" method="get" class="flex justify-center mb-10">
        <select name="category"
                onchange="this.form.submit()"
                class="border border-gray-300 bg-white rounded-lg px-4 py-2 text-gray-700 focus:ring-2 focus:ring-blue-500 focus:outline-none shadow-sm w-60 text-sm font-medium">
            <option value="all" ${selectedCategory == 'all' ? 'selected' : ''}>All Categories</option>
            <c:forEach var="cat" items="${categories}">
                <option value="${cat}" ${selectedCategory == cat ? 'selected' : ''}>${cat}</option>
            </c:forEach>
        </select>
    </form>

  <div x-data="productModal(${fn:length(model_products_list)})" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
    <template x-for="(p, index) in products" :key="index">
        <div class="relative">

            <!-- ✅ Product Card -->
            <div class="bg-white/80 backdrop-blur-md rounded-2xl shadow-md border border-gray-100 hover:border-blue-400 transition-transform transform hover:-translate-y-2 hover:shadow-lg">
                <img :src="p.image" :alt="p.name" class="rounded-t-2xl w-full h-48 object-cover">
                <div class="p-5 text-center">
                    <h3 class="font-semibold text-gray-900 text-lg mb-1" x-text="p.name"></h3>
                    <p class="text-green-600 font-bold text-md mb-2">₹<span x-text="p.price"></span></p>
                    <p class="text-gray-500 text-sm italic mb-3" x-text="p.category"></p>
                    <button @click="openModal(index)"
                        class="w-full bg-gradient-to-r from-blue-600 to-blue-500 hover:from-blue-700 hover:to-blue-600 
                               text-white py-2 rounded-lg font-medium transition-all duration-200 transform hover:scale-105">
                        <i class="bi bi-eye mr-1"></i> Full Details
                    </button>
                </div>
            </div>
        </div>
    </template>

    <!-- ✅ Popup Modal -->
    <div x-show="open"
         x-transition
         @keydown.window.arrow-right.prevent="next()"
         @keydown.window.arrow-left.prevent="prev()"
         class="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-md p-4">

        <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-4xl mx-auto overflow-hidden"
             x-transition:enter="ease-out duration-300"
             x-transition:enter-start="opacity-0 scale-90"
             x-transition:enter-end="opacity-100 scale-100"
             x-transition:leave="ease-in duration-200"
             x-transition:leave-start="opacity-100 scale-100"
             x-transition:leave-end="opacity-0 scale-90">

            <!-- Header -->
            <div class="flex justify-between items-center bg-blue-600 text-white px-6 py-4">
                <h3 class="text-2xl font-semibold" x-text="current.name"></h3>
                <button @click="closeModal()" class="text-white hover:text-gray-300">
                    <i class="bi bi-x-lg text-xl"></i>
                </button>
            </div>

            <!-- Body -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 p-6">
                <!-- Image -->
                <div class="flex justify-center">
                    <img :src="current.image" :alt="current.name"
                         class="rounded-xl shadow-md object-cover w-full max-w-sm h-[350px] border border-gray-200">
                </div>

                <!-- Product Info -->
                <div class="space-y-4">
                    <p class="text-sm text-gray-500 uppercase tracking-wide" x-text="current.category"></p>
                    <p class="text-green-600 font-extrabold text-3xl">₹<span x-text="current.price"></span></p>
                    <p class="text-gray-700 leading-relaxed" x-text="current.description"> </p>

                    <div class="pt-4 flex space-x-4">
                        <button class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg text-sm font-medium transition">
                            <i class="bi bi-pencil-square mr-1"></i> Edit Product
                        </button>
                        <button class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded-lg text-sm font-medium transition">
                            <i class="bi bi-cart3 mr-1"></i> Add to Cart
                        </button>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="bg-gray-50 px-6 py-4 border-t flex justify-between items-center">
                <button @click="prev()" class="flex items-center bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-md text-sm font-medium transition">
                    <i class="bi bi-arrow-left-short mr-1"></i> Previous
                </button>

                <button @click="closeModal()" class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded-md text-sm font-medium transition">
                    Close
                </button>

                <button @click="next()" class="flex items-center bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm font-medium transition">
                    Next <i class="bi bi-arrow-right-short ml-1"></i>
                </button>
            </div>
        </div>
    </div>
</div>


    <!-- No Products Message -->
    <c:if test="${empty model_products_list}">
        <div class="text-center mt-12 text-gray-500 font-medium text-lg">
            No products found for this category.
        </div>
    </c:if>
</section>


	<!-- FOOTER -->
	<footer class="text-center py-6 text-sm text-gray-500 border-t mt-10">
		Made with ❤️ by <span class="font-semibold text-blue-600">Pranjal Singh</span> | © 2025 CRM Admin Panel
	</footer>

</body>
<!-- ✅ AlpineJS Component -->
<script>
function productModal(total) {
    return {
        open: false,
        index: 0,
        products: [
            // Dynamically generated via JSP
            <c:forEach var="p" items="${model_products_list}" varStatus="loop">
                {
                    id: ${p.id},
                    name: '${p.productname}',
                    price: ${p.price},
                    category: '${p.category}',
                    image: '${p.productimage}'
                }${!loop.last ? ',' : ''}
            </c:forEach>
        ],
        get current() { return this.products[this.index]; },
        openModal(i) { this.index = i; this.open = true; },
        closeModal() { this.open = false; },
        next() { this.index = (this.index + 1) % this.products.length; },
        prev() { this.index = (this.index - 1 + this.products.length) % this.products.length; }
    };
}
</script>
</html>
