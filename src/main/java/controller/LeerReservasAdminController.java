package controller;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LeerReservaModel;
import model.Reserva;

@WebServlet("/api/reservas/usuario")
public class LeerReservasAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            String idUsuario = request.getParameter("id");
            if (idUsuario == null || idUsuario.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("[]");
                return;
            }
            LeerReservaModel model = new LeerReservaModel();
            List<Reserva> reservas = model.obtenerReservas(Integer.parseInt(idUsuario));
            Gson gson = new Gson();
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(reservas));
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}