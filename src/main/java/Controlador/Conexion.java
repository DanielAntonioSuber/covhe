package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    String USERNAME = "root";
    String PASSWORD = "n0m310";
    String HOST = "localhost";
    String PORT = "3306";
    String DATABASE = "covhe";
    String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE+"?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    Connection conn;

    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException error) {
            System.err.println(error);
        } 
        
    }

    public Connection getConnection() {
        return conn;
    }
}
