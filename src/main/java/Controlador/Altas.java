package Controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Altas extends Conexion {

    public boolean registrarUsuario(Usuario usuario) {

        PreparedStatement pst = null;

        try {
            String sql = "insert into usuarios"
                    + "(nombre, apellidos, nomUsuario, correo, contrasennia, nivel, fechaCreacion) "
                    + "values(?,?,?,?,?,2,CURRENT_TIMESTAMP());";

            pst = getConnection().prepareStatement(sql);

            pst.setString(1, usuario.getNombre());
            pst.setString(2, usuario.getApellidos());
            pst.setString(3, usuario.getNomUsuario());
            pst.setString(4, usuario.getCorreo());
            pst.setString(5, usuario.getContrasennia());

            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }

        return false;
    }
        public boolean registrarSintomas(int idUsuario, int id, int Idr) {

        PreparedStatement pst = null;

        try {
            String sql = "insert into sintomasUsuario"
                    + "(, idUsuario, idopc, fecha) "
                    + "values(?,?,CURRENT_TIMESTAMP());";

            pst = getConnection().prepareStatement(sql);

            pst.setInt(1, idUsuario);
            pst.setInt(2, Idr);
            pst.execute();
        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }
        return false;
    }
    
    public void publicar(int idUsuario, String title, String content) {
        PreparedStatement pst = null;
        try {
            
            String sql = "insert into publicaciones(idUsuario, titulo, contenido, fecha) values(?,?,?,CURRENT_TIMESTAMP()) ";
            
            pst = getConnection().prepareStatement(sql);
            
            pst.setInt(1, idUsuario);
            pst.setString(2, title);
            pst.setString(3, content);
            pst.execute();
        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }
    }
    
    public void comentar(int idUsuario ,int idPublicacion, String contenido) {
        PreparedStatement pst = null;
        try {
            
            String sql = "insert into comentarios(idUsuario, idPublicacion, contenido, fecha) "
              + "values (?,?,?, CURRENT_TIMESTAMP())";
            
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, idUsuario);
            pst.setInt(2, idPublicacion);
            pst.setString(3, contenido);
            
            pst.execute();
        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }
    }
}
