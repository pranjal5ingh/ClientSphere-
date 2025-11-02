<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Profile | Company Portal</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Feather Icons -->
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #eef2ff 100%);
        }
        .card {
            @apply bg-white rounded-2xl shadow-xl p-8 hover:shadow-2xl transition-shadow duration-300;
        }
    </style>
</head>

<body class="text-gray-800">

<!-- NAVBAR -->
<header class="bg-indigo-600 text-white sticky top-0 z-50 shadow-md">
    <div class="max-w-7xl mx-auto px-6 flex justify-between items-center h-16">
        <div class="flex items-center gap-2">
            <i data-feather="briefcase" class="w-5 h-5"></i>
            <span class="font-bold text-xl tracking-tight">Customer Profile </span>
        </div>

        <div class="flex items-center gap-4">
            <div class="hidden sm:block text-right">
                <p class="font-semibold">${session_employee.getName()}</p>
                <p class="text-xs text-indigo-200">${session_employee.getRole()}</p>
            </div>
            <img src="https://placehold.co/100x100/ffffff/3b82f6?text=PS" 
                 alt="avatar" 
                 class="h-10 w-10 rounded-full ring-2 ring-white shadow-md">
            <a href="logout" class="p-2 rounded-full bg-indigo-500 hover:bg-red-500 transition">
                <i data-feather="log-out" class="w-4 h-4"></i>
            </a>
        </div>
    </div>
</header>

<!-- MAIN -->
<main class="max-w-5xl mx-auto px-6 py-10 space-y-10">

    <!-- Profile Section -->
    <div class="card flex flex-col sm:flex-row items-center sm:items-start sm:gap-8">
        <img class="w-32 h-32 rounded-full object-cover ring-4 ring-indigo-100 shadow-md" 
             src="https://placehold.co/200x200/6366f1/ffffff?text=${session_employee.getName().charAt(0)}" 
             alt="Profile Picture">
        <div class="mt-6 sm:mt-0 text-center sm:text-left space-y-3">
            <h1 class="text-3xl font-extrabold text-gray-900">${session_employee.getName()}</h1>
            <p class="text-indigo-600 font-medium">${session_employee.getRole()}</p>
            <div class="flex justify-center sm:justify-start gap-3 mt-4">
                <button class="bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2 rounded-lg font-semibold flex items-center gap-2">
                    <i data-feather="send" class="w-4 h-4"></i> Message
                </button>
                <button class="border border-gray-200 hover:bg-gray-100 text-gray-700 px-5 py-2 rounded-lg font-semibold flex items-center gap-2">
                    <i data-feather="user-plus" class="w-4 h-4"></i> Add Friend
                </button>
            </div>
        </div>
    </div>

    <!-- About Me -->
    <div class="card">
        <h2 class="text-2xl font-bold text-gray-900 mb-3">About Me</h2>
        <p class="text-gray-600 leading-relaxed">
            As a Senior Product Manager with over 8 years of experience, I specialize in bringing innovative digital products from concept to launch. 
            My passion lies in understanding user needs and translating them into market-leading solutions.
        </p>
    </div>

    <!-- Skills -->
    <div class="card">
        <h2 class="text-2xl font-bold text-gray-900 mb-3">Skills</h2>
        <div class="flex flex-wrap gap-3 mt-3">
            <span class="bg-indigo-100 text-indigo-700 text-sm font-semibold px-4 py-2 rounded-full">Product Strategy</span>
            <span class="bg-indigo-100 text-indigo-700 text-sm font-semibold px-4 py-2 rounded-full">Agile Methodologies</span>
            <span class="bg-indigo-100 text-indigo-700 text-sm font-semibold px-4 py-2 rounded-full">UX/UI Design</span>
            <span class="bg-indigo-100 text-indigo-700 text-sm font-semibold px-4 py-2 rounded-full">Market Research</span>
            <span class="bg-indigo-100 text-indigo-700 text-sm font-semibold px-4 py-2 rounded-full">JIRA</span>
        </div>
    </div>

    <!-- Contact Info -->
    <div class="card">
        <h2 class="text-2xl font-bold text-gray-900 mb-3">Contact Information</h2>
        <ul class="space-y-3 text-gray-700">
            <li class="flex items-center gap-3">
                <i data-feather="mail" class="w-5 h-5 text-indigo-500"></i>
                <span>${session_employee.getEmail()}</span>
            </li>
            <li class="flex items-center gap-3">
                <i data-feather="phone" class="w-5 h-5 text-indigo-500"></i>
                <span>${session_employee.getPhone()}</span>
            </li>
            <li class="flex items-center gap-3">
                <i data-feather="map-pin" class="w-5 h-5 text-indigo-500"></i>
                <span>${session_employee.getAddress()}</span>
            </li>
        </ul>
    </div>

</main>

<!-- FOOTER -->
<footer class="bg-gray-100 border-t border-gray-200 py-6 text-center text-gray-500 text-sm">
    <p>&copy; 2025 Company Portal. Crafted with ❤️ by the Dev Team.</p>
</footer>

<script>
    feather.replace();
</script>

</body>
</html>
