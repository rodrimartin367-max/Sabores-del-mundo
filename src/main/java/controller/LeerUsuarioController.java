package controller;
import java.io.BufferedReader;
import java.io.PrintWriter;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LeerUsuarioModel;
import model.Usuario;

@WebServlet("/api/login")
public class LeerUsuarioController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Usuario credenciales = gson.fromJson(reader, Usuario.class);
            LeerUsuarioModel modelo = new LeerUsuarioModel();
            Usuario usuarioAutenticado = modelo.autenticarUsuario(credenciales.getEmail(), credenciales.getPassword());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if (usuarioAutenticado != null) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.print(gson.toJson(usuarioAutenticado));
            } else {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.print("{\"error\":\"Credenciales incorrectas\"}");
            }
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}