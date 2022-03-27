<!DOCTYPE html>
<html lang="en">
<head>
    <title>@yield('title')</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;1,400&display=swap">
    @stack('styles')
</head>
<body>

<div class="container">
    @yield('content')
</div>

</body>
</html>
