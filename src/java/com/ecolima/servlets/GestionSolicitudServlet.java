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
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/GestionSolicitudServlet")
public class GestionSolicitudServlet extends HttpServlet {

    private static final String ARCHIVO_PENDIENTES = "solicitudes.txt";
    private static final String ARCHIVO_ACEPTADAS = "ventas_aceptadas.txt";
    private static final String ARCHIVO_RECHAZADAS = "ventas_rechazadas.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String direccion = request.getParameter("direccion");
        String distrito = request.getParameter("distrito");
        String material = request.getParameter("material");
        String cantidad = request.getParameter("cantidad");
        String accion = request.getParameter("accion"); // aceptar o rechazar

        String solicitud = String.join(",", usuario, direccion, distrito, material, cantidad);

        // Rutas de archivos
        String rutaBase = getServletContext().getRealPath("/");
        File archivoPendientes = new File(rutaBase + ARCHIVO_PENDIENTES);
        File archivoDestino;

        if ("aceptar".equals(accion)) {
            archivoDestino = new File(rutaBase + ARCHIVO_ACEPTADAS);
        } else {
            archivoDestino = new File(rutaBase + ARCHIVO_RECHAZADAS);
        }

        // Guardar en aceptadas o rechazadas
        try (FileWriter fw = new FileWriter(archivoDestino, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter pw = new PrintWriter(bw)) {
            pw.println(solicitud);
        }

        // Eliminar de ventas.txt
        if (archivoPendientes.exists()) {
            List<String> lineas = new ArrayList<>();
            try (BufferedReader br = new BufferedReader(new FileReader(archivoPendientes))) {
                String linea;
                while ((linea = br.readLine()) != null) {
                    if (!linea.equals(solicitud)) {
                        lineas.add(linea);
                    }
                }
            }

            try (PrintWriter pw = new PrintWriter(new FileWriter(archivoPendientes, false))) {
                for (String l : lineas) {
                    pw.println(l);
                }
            }
        }

        // Redirigir de nuevo a solicitudes.jsp
        response.sendRedirect("admin/solicitudes.jsp");
    }
}

