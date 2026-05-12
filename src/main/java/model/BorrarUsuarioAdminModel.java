package model;
import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class BorrarUsuarioAdminModel {
    public boolean eliminarUsuarioYReservas(String email) throws Exception {
        try (Connection conn = DBUtil.getConnection()) {
            String sqlReservas = "DELETE FROM reservas WHERE id_usuario = (SELECT id FROM usuarios WHERE email = ?)";
            try (PreparedStatement stmt1 = conn.prepareStatement(sqlReservas)) {
                stmt1.setString(1, email);
                stmt1.executeUpdate();
            }
            String sqlUsuario = "DELETE FROM usuarios WHERE email = ?";
            try (PreparedStatement stmt2 = conn.prepareStatement(sqlUsuario)) {
                stmt2.setString(1, email);
                return stmt2.executeUpdate() > 0;
            }
        }
    }
}