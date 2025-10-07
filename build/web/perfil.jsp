<%-- 
    Document   : perfil
    Created on : 25 set. 2025, 12:38:19 p. m.
    Author     : mco_a
--%>

<%@ page session="true" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String rutaArchivo = application.getRealPath("/") + "solicitudes.txt";
    List<String[]> ventasUsuario = new ArrayList<>();

    File archivo = new File(rutaArchivo);
    if (archivo.exists()) {
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] datos = linea.split(",");
                if (datos.length == 6 && datos[0].equals(usuario)) {
                    ventasUsuario.add(datos);
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Perfil - EcoLima</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand text-success fw-bold" href="index.jsp">EcoLima</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link fw-bold" href="index.jsp">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Mapa</a></li>
                <li class="nav-item dropdown">
                    <button class="btn btn-success dropdown-toggle text-white" type="button" id="perfilDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <%= usuario %>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="perfilDropdown">
                        <li><a class="dropdown-item" href="perfil.jsp">Mi Perfil</a></li>
                        <li><a class="dropdown-item" href="LogoutServlet">Cerrar Sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Perfil -->
    <div class="container mt-5">
        <h2 class="text-success">📋 Mis Solicitudes de Venta</h2>
        <p class="text-muted">Aquí puedes ver todas tus solicitudes registradas.</p>

        <% if (ventasUsuario.isEmpty()) { %>
            <div class="alert alert-warning">No tienes solicitudes de venta registradas.</div>
        <% } else { %>
            <table class="table table-bordered table-striped">
                <thead class="table-success">
                    <tr>
                        <th>Dirección</th>
                        <th>Distrito</th>
                        <th>Material</th>
                        <th>Cantidad</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (String[] venta : ventasUsuario) { %>
                        <tr>
                            <td><%= venta[1] %></td>
                            <td><%= venta[2] %></td>
                            <td><%= venta[3] %></td>
                            <td><%= venta[4] %></td>
                            <td><%= venta[5] %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

