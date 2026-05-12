package controller;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LeerPlatosModel;
import model.Plato;

@WebServlet("/api/platos")
public class LeerPlatosController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            String pais = request.getParameter("pais");
            String tipo = request.getParameter("tipo");
            String dia = request.getParameter("dia");
            LeerPlatosModel model = new LeerPlatosModel();
            List<Plato> platos = model.obtenerPlatos(pais, tipo, dia);
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(platos));
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}