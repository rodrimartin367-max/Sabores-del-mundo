package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class ListarUsuariosModel {
    public List<Usuario> obtenerTodosLosUsuarios() throws Exception {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT id, nombre, email, rol FROM usuarios";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }
        }
        return lista;
    }
}