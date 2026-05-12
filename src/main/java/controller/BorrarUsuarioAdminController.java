package controller;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BorrarUsuarioAdminModel;

@WebServlet("/api/admin/borrar-usuario")
public class BorrarUsuarioAdminController extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            String email = request.getParameter("email");
            if (email == null || email.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{\"error\":\"Email no proporcionado\"}");
                return;
            }
            BorrarUsuarioAdminModel model = new BorrarUsuarioAdminModel();
            if (model.eliminarUsuarioYReservas(email)) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().print("{\"mensaje\":\"Usuario borrado\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{\"error\":\"No se encontro el usuario\"}");
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}