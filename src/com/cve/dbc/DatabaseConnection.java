package com.cve.dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    
    private static String className = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/cve_db?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
    private static String user = "root";
    private static String password = "123456";
    private Connection conn = null;
     
    public DatabaseConnection() throws Exception{
        
        try{
            Class.forName(className);
            this.conn = DriverManager.getConnection(url, user, password);
        }catch(ClassNotFoundException e){
            throw e;
        }
    }
    
    public Connection getConnection(){
        return this.conn;
    }
    
    public void close() throws Exception{
        if( this.conn != null ){
            try{
                this.conn.close();
            }catch (SQLException e){
                throw e;
            }
        }
    }
}
