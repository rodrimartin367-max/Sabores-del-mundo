package controller;
import java.io.BufferedReader;
import java.io.PrintWriter;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CrearUsuarioModel;
import model.Usuario;

@WebServlet("/api/registro")
public class CrearUsuarioController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Usuario nuevoUsuario = gson.fromJson(reader, Usuario.class);
            CrearUsuarioModel modelo = new CrearUsuarioModel();
            boolean exito = modelo.registrarUsuario(nuevoUsuario);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if (exito) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                out.print("{\"mensaje\":\"Registro exitoso\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\":\"No se pudo registrar en la base de datos\"}");
            }
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}