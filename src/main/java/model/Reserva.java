package model;

public class Reserva {
    private int id;
    private int idUsuario;
    private String restaurante;
    private int comensales;
    private String fechaHora;

    public Reserva() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }
    public String getRestaurante() { return restaurante; }
    public void setRestaurante(String restaurante) { this.restaurante = restaurante; }
    public int getComensales() { return comensales; }
    public void setComensales(int comensales) { this.comensales = comensales; }
    public String getFechaHora() { return fechaHora; }
    public void setFechaHora(String fechaHora) { this.fechaHora = fechaHora; }
}