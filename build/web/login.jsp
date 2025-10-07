<%-- 
    Document   : login
    Created on : 24 set. 2025, 9:36:54 p. m.
    Author     : mco_a
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ingresar - EcoLima</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #e8f5e9; font-family: Arial, sans-serif; }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background: #000;
            color: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }
        .form-control { border-radius: 10px; }
        .btn-ecolima {
            background: #4caf50;
            color: white;
            font-weight: bold;
            border-radius: 10px;
            width: 100%;
            transition: 0.3s;
        }
        .btn-ecolima:hover { background: #388e3c; color: white; }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="text-center mb-4">
            <img src="images/logo.png" alt="EcoLima" width="60">
            <h2>Ingresar</h2>
        </div>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Correo Electrónico</label>
                <input type="email" name="correo" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <input type="password" name="clave" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-ecolima">Ingresar</button>
        </form>

        <div class="mt-3 text-center">
            <a href="registro.jsp" class="text-success">¿No tienes cuenta? Regístrate</a>
        </div>
    </div>
</body>
</html>

