package com.profile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection(){

        try{

            if(con == null){

                Properties prop = new Properties();

                InputStream is = DBConnection.class
                        .getClassLoader()
                        .getResourceAsStream("db.properties");

               
                if(is == null){
                    throw new RuntimeException("db.properties FILE NOT FOUND");
                }

                prop.load(is);

                String url = prop.getProperty("db.url");
                String username = prop.getProperty("db.username");
                String password = prop.getProperty("db.password");

                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(url, username, password);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return con;
    }
}