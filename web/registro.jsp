<%-- 
    Document   : Registro
    Created on : 24 set. 2025, 7:53:44 p. m.
    Author     : mco_a
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - EcoLima</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #e8f5e9; /* verde suave */
            font-family: Arial, sans-serif;
        }
        .register-container {
            max-width: 600px;
            margin: 50px auto;
            background: #000;
            color: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }
        .register-container h2 {
            margin-bottom: 10px;
        }
        .form-control, .form-select {
            border-radius: 10px;
        }
        .btn-ecolima {
            background: #4caf50;
            color: white;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .btn-ecolima:hover {
            background: #388e3c;
            color: white;
        }
        /* Botón estilo EcoLima outline para regresar */
        .btn-ecolima-outline {
            background: transparent;
            color: #4caf50;
            font-weight: bold;
            border: 2px solid #4caf50;
            border-radius: 10px;
            transition: all 0.3s ease;
            display: inline-block;
            text-align: center;
        }
        .btn-ecolima-outline:hover {
            background: #4caf50;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="text-center mb-4">
            <img src="images/logo.png" alt="EcoLima" width="60">
            <h2>Crear Cuenta</h2>
            <p>Únete a la comunidad de reciclaje de Lima</p>
        </div>

        <!-- FORMULARIO -->
        <form action="RegistroServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Nombre Completo</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Correo Electrónico</label>
                <input type="email" name="correo" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <input type="password" name="clave" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Teléfono</label>
                <input type="text" name="telefono" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Distrito</label>
                <select name="distrito" class="form-select">
                    <option value="">Selecciona tu distrito</option>
                    <option>Ancón</option>
                    <option>Ate</option>
                    <option>Barranco</option>
                    <option>Breña</option>
                    <option>Carabayllo</option>
                    <option>Cercado de Lima</option>
                    <option>Chaclacayo</option>
                    <option>Chorrillos</option>
                    <option>Cieneguilla</option>
                    <option>Comas</option>
                    <option>El Agustino</option>
                    <option>Independencia</option>
                    <option>Jesús María</option>
                    <option>La Molina</option>
                    <option>La Victoria</option>
                    <option>Lince</option>
                    <option>Los Olivos</option>
                    <option>Lurigancho-Chosica</option>
                    <option>Lurín</option>
                    <option>Magdalena del Mar</option>
                    <option>Miraflores</option>
                    <option>Pachacámac</option>
                    <option>Pucusana</option>
                    <option>Pueblo Libre</option>
                    <option>Puente Piedra</option>
                    <option>Punta Hermosa</option>
                    <option>Punta Negra</option>
                    <option>Rímac</option>
                    <option>San Bartolo</option>
                    <option>San Borja</option>
                    <option>San Isidro</option>
                    <option>San Juan de Lurigancho</option>
                    <option>San Juan de Miraflores</option>
                    <option>San Luis</option>
                    <option>San Martín de Porres</option>
                    <option>San Miguel</option>
                    <option>Santa Anita</option>
                    <option>Santa María del Mar</option>
                    <option>Santa Rosa</option>
                    <option>Santiago de Surco</option>
                    <option>Surquillo</option>
                    <option>Villa El Salvador</option>
                    <option>Villa María del Triunfo</option>
                </select>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" required>
                <label class="form-check-label">Acepto los términos y condiciones</label>
            </div>

            <!-- BOTONES -->
            <button type="submit" class="btn btn-ecolima w-100 mb-2">
                Crear Cuenta
            </button>

            <a href="index.jsp" class="btn btn-ecolima-outline w-100">
                🌱 Regresar al Inicio
            </a>
        </form>
    </div>
</body>
</html>


