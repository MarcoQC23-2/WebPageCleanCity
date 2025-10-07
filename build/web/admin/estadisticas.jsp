<%-- 
    Document   : estadisticas
    Created on : 25 set. 2025, 8:30:47 a. m.
    Author     : mco_a
--%>

<%@ page session="true" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");

    if (usuario == null || !"admin".equals(rol)) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Estadísticas - EcoLima</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand text-success fw-bold" href="../index.jsp">EcoLima</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link fw-bold" href="../index.jsp">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="estadisticas.jsp">Estadísticas</a></li>
                <li class="nav-item dropdown">
                    <button class="btn btn-success dropdown-toggle text-white" type="button" id="perfilDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <%= usuario %> (Admin)
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="perfilDropdown">
                        <li><a class="dropdown-item" href="../LogoutServlet">Cerrar Sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Contenido -->
    <div class="container mt-5">
        <h2 class="text-success">📊 Estadísticas Generales</h2>
        <div class="row text-center mt-4">
            <div class="col-md-4">
                <h2 class="text-success fw-bold">15,430</h2>
                <p>Usuarios Activos</p>
            </div>
            <div class="col-md-4">
                <h2 class="text-primary fw-bold">2,840</h2>
                <p>Toneladas Recicladas</p>
            </div>
            <div class="col-md-4">
                <h2 class="text-purple fw-bold">126</h2>
                <p>Puntos de Reciclaje</p>
            </div>
        </div>

        <!-- Botón volver -->
        <div class="text-center mt-5">
            <a href="../index.jsp" class="btn btn-outline-success btn-lg">⬅ Volver al Inicio</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



