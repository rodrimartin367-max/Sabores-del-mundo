package model;

public class Usuario {
    private int id;
    private String nombre;
    private String email;
    private String password;
    private int visitas;
    private String rol;

    public Usuario() {}

    public Usuario(String nombre, String email, String password) {
        this.nombre = nombre;
        this.email = email;
        this.password = password;
        this.visitas = 0;
        this.rol = "USER";
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public int getVisitas() { return visitas; }
    public void setVisitas(int visitas) { this.visitas = visitas; }
    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }
}