package controller;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ListarUsuariosModel;
import model.Usuario;

@WebServlet("/api/usuarios/todos")
public class ListarUsuariosController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            ListarUsuariosModel model = new ListarUsuariosModel();
            List<Usuario> usuarios = model.obtenerTodosLosUsuarios();
            Gson gson = new Gson();
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(usuarios));
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}