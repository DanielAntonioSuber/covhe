package Controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Cambios extends Conexion {

    public boolean cambiarUsuario(Usuario usuario) {
        PreparedStatement pst = null;
        System.out.println("Cambiando usuario");
        try {
            String sql = "update usuarios "
                    + "set nombre=?, apellidos=?, nomUsuario=?, correo=?, contrasennia=? "
                    + "where id=?";

            pst = getConnection().prepareStatement(sql);

            pst.setString(1, usuario.getNombre());
            pst.setString(2, usuario.getApellidos());
            pst.setString(3, usuario.getNomUsuario());
            pst.setString(4, usuario.getCorreo());
            pst.setString(5, usuario.getContrasennia());
            pst.setInt(6, usuario.getId());
            
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
}
