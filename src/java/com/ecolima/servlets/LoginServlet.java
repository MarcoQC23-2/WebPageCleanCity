/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecolima.servlets;

/**
 *
 * @author mco_a
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String ARCHIVO = "usuarios.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String password = request.getParameter("clave");

        String rutaArchivo = getServletContext().getRealPath("/") + ARCHIVO;
        File archivo = new File(rutaArchivo);

        boolean loginExitoso = false;
        String nombreUsuario = "";
        String rol = "";

        if (archivo.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
                String linea;
                while ((linea = br.readLine()) != null) {
                    String[] datos = linea.split(",");
                    if (datos.length >= 4 && datos[1].equalsIgnoreCase(correo) && datos[2].equals(password)) {
                        loginExitoso = true;
                        nombreUsuario = datos[0];
                        rol = datos[3]; // Guardamos el rol
                        break;
                    }
                }
            }
        }

        if (loginExitoso) {
            // Crear sesión y guardar el nombre del usuario y el rol
            HttpSession session = request.getSession();
            session.setAttribute("usuario", nombreUsuario);
            session.setAttribute("rol", rol);

            // Redirigir al index.jsp
            response.sendRedirect("index.jsp");

        } else {
            // Si el login falla, enviar mensaje de error a login.jsp
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}


