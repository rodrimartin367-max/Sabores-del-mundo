package model;
import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class BorrarReservaModel {
    public boolean eliminarReserva(int id) throws Exception {
        String sql = "DELETE FROM reservas WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}