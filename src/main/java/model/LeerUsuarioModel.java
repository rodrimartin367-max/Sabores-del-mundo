package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUtil;

public class LeerUsuarioModel {
    public Usuario autenticarUsuario(String email, String password) throws Exception {
        String sql = "SELECT id, nombre, email, visitas, rol FROM usuarios WHERE email=? AND password=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setVisitas(rs.getInt("visitas"));
                u.setRol(rs.getString("rol"));
                return u;
            }
        }
        return null;
    }
}