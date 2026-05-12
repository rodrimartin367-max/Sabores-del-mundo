package controller;
import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BorrarReservaModel;

@WebServlet("/api/reservas/borrar")
public class BorrarReservaController extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().print("{\"error\":\"ID no proporcionado\"}");
            return;
        }
        try {
            BorrarReservaModel model = new BorrarReservaModel();
            if (model.eliminarReserva(Integer.parseInt(idParam))) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().print("{\"mensaje\":\"Reserva borrada\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{\"error\":\"No se encontro la reserva\"}");
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}