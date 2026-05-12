package model;
import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class BorrarUsuarioModel {
    public boolean eliminarUsuario(String email) throws Exception {
        String sql = "DELETE FROM usuarios WHERE email=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            return stmt.executeUpdate() > 0;
        }
    }
}