/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.conn;
import java.sql.*;
import java.util.*;
import javax.swing.JOptionPane;

/**
 *
 * @author wwwsh
 */
public class JavaConnect {
    
    public static Connection Conpro(){
        Connection con = null;
        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:D:\\Java-Programming\\Netbeans\\ParkingSystem\\oncs.sqlite");
            System.out.println(con);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            e.printStackTrace();
        }
        return con;
    }
}
