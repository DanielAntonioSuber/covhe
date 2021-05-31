package Controlador;

public class Usuario {

    private int id;
    private String nomUsuario;
    private String nombre;
    private String apellidos;
    private String correo;
    private String contrasennia;
    private int nivel;
    private String fecha;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the idTipo
     */
    public int getNivel() {
        return this.nivel;
    }

    /**
     * @param nivel the idTipo to set
     */
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    /**
     * @return the nomUsuario
     */
    public String getNomUsuario() {
        return nomUsuario;
    }

    /**
     * @param nomUsuario the nomUsuario to set
     */
    public void setNomUsuario(String nomUsuario) {
        this.nomUsuario = nomUsuario;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the contrasennia
     */
    public String getContrasennia() {
        return contrasennia;
    }

    /**
     * @param contrasennia the contrasennia to set
     */
    public void setContrasennia(String contrasennia) {
        this.contrasennia = contrasennia;
    }

    public boolean esCorrecto() {
        return nomUsuario != null
                && nombre != null
                && apellidos != null
                && contrasennia != null
                && correo != null;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
