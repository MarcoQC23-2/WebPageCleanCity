/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    private static final String ARCHIVO = "usuarios.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("clave");

        // Validar datos mínimos
        if (nombre == null || nombre.trim().isEmpty() ||
            correo == null || correo.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {

            out.println(generarPagina("Todos los campos son obligatorios.", "warning", "registro.jsp", "Volver al Registro"));
            return;
        }

        String rutaArchivo = getServletContext().getRealPath("/") + ARCHIVO;
        File archivo = new File(rutaArchivo);

        boolean existe = false;
        if (archivo.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
                String linea;
                while ((linea = br.readLine()) != null) {
                    String[] datos = linea.split(",");
                    if (datos.length >= 2 && datos[1].equalsIgnoreCase(correo)) {
                        existe = true;
                        break;
                    }
                }
            }
        }

        if (existe) {
            out.println(generarPagina("El correo ya está registrado.", "danger", "registro.jsp", "Volver al Registro"));
        } else {
            try (FileWriter fw = new FileWriter(rutaArchivo, true);
                 BufferedWriter bw = new BufferedWriter(fw);
                 PrintWriter pw = new PrintWriter(bw)) {

                // Guardamos el usuario con rol "usuario" automáticamente
                pw.println(nombre + "," + correo + "," + password + ",usuario");

                out.println(generarPagina("Registro exitoso ✅", "success", "index.jsp", "Ir al Inicio"));

            } catch (IOException e) {
                out.println(generarPagina("Error al guardar el usuario: " + e.getMessage(), "danger", "registro.jsp", "Volver al Registro"));
            }
        }
    }

    // Método auxiliar para generar páginas con Bootstrap alerts
    private String generarPagina(String mensaje, String tipo, String link, String textoBoton) {
        return "<!DOCTYPE html>" +
                "<html lang='es'>" +
                "<head>" +
                "<meta charset='UTF-8'>" +
                "<title>Registro</title>" +
                "<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>" +
                "</head>" +
                "<body class='d-flex flex-column justify-content-center align-items-center vh-100'>" +
                "<div class='alert alert-" + tipo + " text-center' style='max-width: 400px; width: 100%;'>" +
                "<h4>" + mensaje + "</h4>" +
                "<a href='" + link + "' class='btn btn-primary mt-3'>" + textoBoton + "</a>" +
                "</div>" +
                "</body>" +
                "</html>";
    }
}


