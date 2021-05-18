package com.banking.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
    public static Connection connection;
    
    public DAO(){
        if(connection==null) {
            String dburl = "jdbc:mysql://localhost:3306/sqa?autoReconnnect=true&allowPublicKeyRetrieval=true&useSSL=false";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try{
                Class.forName(dbClass);
                connection = DriverManager.getConnection(dburl, "root", "1999");
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        DAO c = new DAO();
        System.out.println(connection);
    }
}

