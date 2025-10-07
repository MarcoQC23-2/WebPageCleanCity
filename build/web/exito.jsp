<%-- 
    Document   : exito
    Created on : 24 set. 2025, 8:47:44 p. m.
    Author     : mco_a
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Exitoso - EcoLima</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #e8f5e9;
            font-family: Arial, sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<div class="container d-flex align-items-center justify-content-center vh-100">
    <div class="card p-5 text-center">
        <h2 class="text-success">🎉 ¡Registro Exitoso!</h2>
        <p class="mt-3">${mensaje}</p>
        <a href="index.jsp" class="btn btn-success mt-4">Ir al Inicio</a>
    </div>
</div>
</body>
</html>

