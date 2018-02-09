package com.login;

import java.sql.*;

public class OracleDb {

    public static Connection con;
    public static Statement st;
    
    public static Statement getConnected() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "stark", "stark");
            st = con.createStatement();
        } catch (Exception e) {
            System.out.println(e);
        }
        return st;
    }
}
