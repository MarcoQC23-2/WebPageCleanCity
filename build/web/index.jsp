<%-- 
    Document   : index
    Created on : 24 set. 2025, 9:52:13 p. m.
    Author     : mco_a
--%>

<%@ page session="true" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Obtener usuario y rol de la sesión
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>EcoLima - Reciclaje Inteligente</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  
</head>
<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand text-success fw-bold" href="index.jsp">EcoLima</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link fw-bold" href="index.jsp">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Mapa</a></li>

                <% if ("admin".equals(rol)) { %>
                    <!-- Solo visible para admin -->
                    <li class="nav-item"><a class="nav-link" href="admin/estadisticas.jsp">Estadísticas</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin/solicitudes.jsp">Solicitudes de Venta</a></li>
                <% } %>

                <% if (usuario == null) { %>
                    <!-- Usuario no logueado -->
                    <li class="nav-item"><a class="btn btn-outline-success" href="login.jsp">Ingresar</a></li>
                    <li class="nav-item"><a class="btn btn-success ms-2" href="registro.jsp">Registrarse</a></li>
                <% } else { %>
                    <!-- Usuario logueado -->
                    <li class="nav-item dropdown">
                        <button class="btn btn-success dropdown-toggle text-white" type="button" id="perfilDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <%= usuario %>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="perfilDropdown">
                            <li><a class="dropdown-item" href="perfil.jsp">Mi Perfil</a></li>
                            <li><a class="dropdown-item" href="LogoutServlet">Cerrar Sesión</a></li>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="text-start py-5 bg-ecolima">
        <div class="container">
            <span class="badge bg-success-subtle text-success mb-3">🌱 Plataforma de Reciclaje Lima</span>
            <h1 class="fw-bold">Reciclemos <span class="text-success">Juntos</span></h1>
            <p class="text-muted">Únete a la red de reciclaje más grande de Lima. Encuentra puntos de reciclaje cerca de ti, registra tus actividades y contribuye a un futuro más sostenible.</p>
            <div class="mt-4">
                <% if (usuario == null) { %>
                    <a href="login.jsp" class="btn btn-success btn-lg">Comenzar Ahora</a>
                <% } else { %>
                    <a href="vender.jsp" class="btn btn-success btn-lg">Comenzar Ahora</a>
                <% } %>
                    <a href="#" class="btn btn-outline-dark btn-lg ms-2">Ver Mapa</a>
            </div>
        </div>
    </section>
                    
    <!-- Carrusel -->
    <div id="carruselEco" class="carousel slide container-fluid p-0" data-bs-ride="carousel" data-bs-interval="10000">
        <div class="carousel-inner rounded shadow">
            <div class="carousel-item active">
                    <img src="images/Types-of-Recycling-Bins.png" class="d-block w-100" alt="Reciclaje 1">
            </div>
                <div class="carousel-item">
                    <img src="images/recycle-and-earn-money.jpg" class="d-block w-100" alt="Reciclaje 2">
            </div>
                <div class="carousel-item">
                    <img src="https://picsum.photos/1200/400?random=3" class="d-block w-100" alt="Reciclaje 3">
            </div>
        </div>

    <!-- Controles -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carruselEco" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carruselEco" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
    
    <section class="py-5">
        <div class="container">
            <h2 class="fw-bold">Beneficios de usar EcoLima</h2>
            <p class="text-muted">Conoce cómo ayudas al planeta al unirte a nuestra red de reciclaje.</p>
        </div>
    </section>

    <footer class="bg-dark text-white text-center py-4">
        <p>&copy; 2025 EcoLima - Todos los derechos reservados.</p>
    </footer>


    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>





