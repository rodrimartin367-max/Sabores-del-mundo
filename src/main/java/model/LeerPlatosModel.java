package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class LeerPlatosModel {
    public List<Plato> obtenerPlatos(String pais, String tipo, String dia) throws Exception {
        List<Plato> lista = new ArrayList<>();
        String sql = "SELECT categoria, nombre, descripcion, precio, imagen FROM platos " +
                     "WHERE pais=? AND (tipo_menu=? OR tipo_menu='infantil' OR tipo_menu='bebida') " +
                     "AND (dia_semana=? OR dia_semana='Todos')";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, pais);
            stmt.setString(2, tipo);
            stmt.setString(3, dia);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Plato p = new Plato();
                p.setCategoria(rs.getString("categoria"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getString("precio"));
                p.setImagen(rs.getString("imagen"));
                lista.add(p);
            }
        }
        return lista;
    }
}