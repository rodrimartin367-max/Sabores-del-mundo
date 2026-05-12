package controller;
import java.io.BufferedReader;
import java.io.PrintWriter;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ActualizarUsuarioModel;
import model.Usuario;

@WebServlet("/api/actualizar")
public class ActualizarUsuarioController extends HttpServlet {
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Usuario datos = gson.fromJson(reader, Usuario.class);
            ActualizarUsuarioModel modelo = new ActualizarUsuarioModel();
            boolean exito = modelo.actualizarPassword(datos.getEmail(), datos.getPassword());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if (exito) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("{\"mensaje\":\"Contraseña actualizada\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\":\"Fallo al actualizar\"}");
            }
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}