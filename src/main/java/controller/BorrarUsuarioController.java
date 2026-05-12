package controller;
import java.io.BufferedReader;
import java.io.PrintWriter;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BorrarUsuarioModel;
import model.Usuario;

@WebServlet("/api/borrar")
public class BorrarUsuarioController extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Usuario datos = gson.fromJson(reader, Usuario.class);
            BorrarUsuarioModel modelo = new BorrarUsuarioModel();
            boolean exito = modelo.eliminarUsuario(datos.getEmail());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if (exito) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("{\"mensaje\":\"Usuario borrado\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\":\"Fallo al borrar\"}");
            }
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}