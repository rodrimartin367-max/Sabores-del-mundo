package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUtil;

public class InsertarReservaModel {
    public boolean insertarReserva(String email, String restaurante, int comensales, String fechaHora) throws Exception {
        try (Connection conn = DBUtil.getConnection()) {
            String sqlId = "SELECT id FROM usuarios WHERE email = ?";
            int idUsuario = -1;
            try (PreparedStatement stmtId = conn.prepareStatement(sqlId)) {
                stmtId.setString(1, email);
                ResultSet rsId = stmtId.executeQuery();
                if (rsId.next()) {
                    idUsuario = rsId.getInt("id");
                }
            }
            if (idUsuario == -1) return false;

            String sqlReserva = "INSERT INTO reservas (id_usuario, restaurante, comensales, fecha_hora) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmtReserva = conn.prepareStatement(sqlReserva)) {
                stmtReserva.setInt(1, idUsuario);
                stmtReserva.setString(2, restaurante);
                stmtReserva.setInt(3, comensales);
                stmtReserva.setString(4, fechaHora);
                return stmtReserva.executeUpdate() > 0;
            }
        }
    }
}