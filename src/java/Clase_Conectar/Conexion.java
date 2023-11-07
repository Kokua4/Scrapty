/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clase_Conectar;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DIEGO MENDOZA MONTES
 */
public class Conexion {
    Connection cnx = null;
    public Connection conectar(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                    + "kokua?autoReconnect=true&useSSL=false","root","n0m3l0");
        }
        catch(ClassNotFoundException | SQLException error){
            out.print(error.toString());
        }
        return cnx;
        
    }
    
}
