package model;

public class Plato {
    private int id;
    private String pais;
    private String tipoMenu;
    private String categoria;
    private String diaSemana;
    private String nombre;
    private String descripcion;
    private String precio;
    private String imagen;

    public Plato() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public String getTipoMenu() { return tipoMenu; }
    public void setTipoMenu(String tipoMenu) { this.tipoMenu = tipoMenu; }
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
    public String getDiaSemana() { return diaSemana; }
    public void setDiaSemana(String diaSemana) { this.diaSemana = diaSemana; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getPrecio() { return precio; }
    public void setPrecio(String precio) { this.precio = precio; }
    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }
}