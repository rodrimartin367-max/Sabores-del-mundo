package model;
import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class ActualizarUsuarioModel {
    public boolean actualizarPassword(String email, String nuevaPassword) throws Exception {
        String sql = "UPDATE usuarios SET password=? WHERE email=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nuevaPassword);
            stmt.setString(2, email);
            return stmt.executeUpdate() > 0;
        }
    }
}