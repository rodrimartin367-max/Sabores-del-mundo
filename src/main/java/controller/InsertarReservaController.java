package controller;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.InsertarReservaModel;

@WebServlet("/api/reservar")
public class InsertarReservaController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            
            Type mapType = new TypeToken<Map<String, Object>>(){}.getType();
            Map<String, Object> map = gson.fromJson(reader, mapType);
            
            String email = (String) map.get("email");
            String restaurante = (String) map.get("restaurante");
            int comensales = ((Double) map.get("comensales")).intValue();
            String fechaHora = (String) map.get("fecha_hora");

            InsertarReservaModel model = new InsertarReservaModel();
            if (model.insertarReserva(email, restaurante, comensales, fechaHora)) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("{\"mensaje\":\"Reserva guardada con exito\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\":\"Usuario no registrado\"}");
            }
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}