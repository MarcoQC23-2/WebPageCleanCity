<%-- 
    Document   : solicitudes
    Created on : 25 set. 2025, 12:56:17 p. m.
    Author     : mco_a
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Solicitudes de Venta</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4">Solicitudes de Venta</h2>

    <a href="../index.jsp" class="btn btn-secondary me-3">⬅ Volver al Inicio</a>
    <a href="estadisticas.jsp" class="btn btn-primary mb-3">📊 Ver Estadísticas</a>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Usuario</th>
                <th>Dirección</th>
                <th>Distrito</th>
                <th>Material</th>
                <th>Cantidad</th>
                <th>Fecha</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            String archivo = application.getRealPath("/") + "solicitudes.txt";
            File f = new File(archivo);
            if (f.exists()) {
                BufferedReader br = new BufferedReader(new FileReader(f));
                String linea;
                while ((linea = br.readLine()) != null) {
                    String[] v = linea.split(",");
                    if (v.length >= 6) { // validar que existan todos los campos
        %>
            <tr>
                <td><%= v[0] %></td>
                <td><%= v[1] %></td>
                <td><%= v[2] %></td>
                <td><%= v[3] %></td>
                <td><%= v[4] %></td>
                <td><%= v[5] %></td>
                <td>
                    <!-- Ver -->
                    <a href="verSolicitud.jsp?usuario=<%= v[0] %>&direccion=<%= v[1] %>&distrito=<%= v[2] %>&material=<%= v[3] %>&cantidad=<%= v[4] %>&fecha=<%= v[5] %>"
                       class="btn btn-info btn-sm">Ver</a>

                    <!-- Aceptar -->
                    <form action="../GestionSolicitudServlet" method="post" style="display:inline;">
                        <input type="hidden" name="usuario" value="<%= v[0] %>">
                        <input type="hidden" name="direccion" value="<%= v[1] %>">
                        <input type="hidden" name="distrito" value="<%= v[2] %>">
                        <input type="hidden" name="material" value="<%= v[3] %>">
                        <input type="hidden" name="cantidad" value="<%= v[4] %>">
                        <input type="hidden" name="fecha" value="<%= v[5] %>">
                        <input type="hidden" name="accion" value="aceptar">
                        <button type="submit" class="btn btn-success btn-sm">Aceptar</button>
                    </form>

                    <!-- Rechazar -->
                    <form action="../GestionSolicitudServlet" method="post" style="display:inline;">
                        <input type="hidden" name="usuario" value="<%= v[0] %>">
                        <input type="hidden" name="direccion" value="<%= v[1] %>">
                        <input type="hidden" name="distrito" value="<%= v[2] %>">
                        <input type="hidden" name="material" value="<%= v[3] %>">
                        <input type="hidden" name="cantidad" value="<%= v[4] %>">
                        <input type="hidden" name="fecha" value="<%= v[5] %>">
                        <input type="hidden" name="accion" value="rechazar">
                        <button type="submit" class="btn btn-danger btn-sm">Rechazar</button>
                    </form>
                </td>
            </tr>
        <%
                    }
                }
                br.close();
            } else {
        %>
            <tr>
                <td colspan="7" class="text-center">No hay solicitudes registradas.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>



