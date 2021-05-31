/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author danie
 */
public class Bajas extends Conexion {

    public boolean elminarUsuario(int id) {
        PreparedStatement pst = null;

        try {
            String sql = "delete from usuarios where id=?";

            pst = getConnection().prepareStatement(sql);

            pst.setInt(1, id);

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

    public boolean elminarPublicacion(int id) {
        PreparedStatement pst = null;

        try {
            String sql = "delete from publicaciones where id=?";

            pst = getConnection().prepareStatement(sql);

            pst.setInt(1, id);

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

    public boolean eliminarComentario(int id) {
        PreparedStatement pst = null;

        try {
            String sql = "delete from comentarios where id=?";

            pst = getConnection().prepareStatement(sql);

            pst.setInt(1, id);

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
    
     public boolean eliminarComentarios(int idPublicacion) {
        PreparedStatement pst = null;

        try {
            String sql = "delete from comentarios where idPublicacion=?";

            pst = getConnection().prepareStatement(sql);

            pst.setInt(1, idPublicacion);

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
