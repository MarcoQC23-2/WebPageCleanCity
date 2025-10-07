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
import java.time.LocalDate;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EnviarSolicitudVentaServlet")
public class EnviarSolicitudVentaServlet extends HttpServlet {

    private static final String ARCHIVO = "solicitudes.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String usuario = (String) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String direccion = request.getParameter("direccion");
        String distrito = request.getParameter("distrito");
        String material = request.getParameter("material");
        String cantidad = request.getParameter("cantidad");

        // Agregamos la fecha actual
        String fecha = LocalDate.now().toString();

        String rutaArchivo = getServletContext().getRealPath("/") + ARCHIVO;

        try (FileWriter fw = new FileWriter(rutaArchivo, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter pw = new PrintWriter(bw)) {

            // Guardamos también la fecha al final
            pw.println(usuario + "," + direccion + "," + distrito + "," + material + "," + cantidad + "," + fecha);
        }

        // Conservamos la redirección al inicio
        response.sendRedirect("index.jsp");
    }
}


