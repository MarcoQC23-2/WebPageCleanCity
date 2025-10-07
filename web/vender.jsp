<%-- 
    Document   : vender
    Created on : 25 set. 2025, 11:31:23 a. m.
    Author     : mco_a
--%>

<%@ page session="true" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp"); // Redirige si no está logueado
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Vender Material Reciclable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
    <div class="container">
        <h2>🗑️ Vender Material Reciclable</h2>
        
        <!-- FORMULARIO CORREGIDO -->
        <form action="${pageContext.request.contextPath}/EnviarSolicitudVentaServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Dirección</label>
                <input type="text" name="direccion" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Distrito</label>
                <input type="text" name="distrito" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tipo de Material</label>
                <select name="material" class="form-select" required>
                    <option value="Plástico">Plástico</option>
                    <option value="Papel">Papel</option>
                    <option value="Cartón">Cartón</option>
                    <option value="Vidrio">Vidrio</option>
                    <option value="Metal">Metal</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Cantidad (kg)</label>
                <input type="number" name="cantidad" class="form-control" min="1" required>
            </div>
            <button type="submit" class="btn btn-success">Enviar Solicitud</button>
            <a href="index.jsp" class="btn btn-secondary ms-2">⬅ Volver al Inicio</a>
        </form>
    </div>
</body>
</html>


