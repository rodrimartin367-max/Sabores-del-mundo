package model;
import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class CrearUsuarioModel {
    public boolean registrarUsuario(Usuario u) throws Exception {
        String sql = "INSERT INTO usuarios (nombre, email, password, visitas) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, u.getNombre());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getPassword());
            stmt.setInt(4, 0);
            return stmt.executeUpdate() > 0;
        }
    }
}