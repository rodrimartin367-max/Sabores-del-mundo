package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class LeerReservaModel {
    public List<Reserva> obtenerReservas(int idUsuario) throws Exception {
        List<Reserva> lista = new ArrayList<>();
        String sql = "SELECT id, restaurante, comensales, fecha_hora FROM reservas WHERE id_usuario = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Reserva r = new Reserva();
                r.setId(rs.getInt("id"));
                r.setRestaurante(rs.getString("restaurante"));
                r.setComensales(rs.getInt("comensales"));
                if (rs.getTimestamp("fecha_hora") != null) {
                    r.setFechaHora(rs.getTimestamp("fecha_hora").toString());
                }
                lista.add(r);
            }
        }
        return lista;
    }
}