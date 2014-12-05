package com.iteso.sweng.Tanda.Display;
import com.iteso.sweng.Tanda.User;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Arturo Cabrera on 12/4/2014.
 */
public class Partakers {
    private Connection conexion;
    private String userDb = "root";
    private String passDb = "root";
    String name;
    String lastname;

    public Partakers(){
        name="";
        lastname="";
    }

    public void conectar() throws SQLException,ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conexion= DriverManager.getConnection("jdbc:mysql://localhost:3306/tandero", userDb, passDb);
    }
    //Desconectar a la Base de datos
    public void desconectar() throws SQLException, ClassNotFoundException{
        conexion.close();
    }

    public ArrayList<User> getPartakers(int tanda) throws SQLException {
        String sql ="select u.name, u.lastname from tandapartakers tp, user u " +
                "where tanda=1 and tp.user = u.iduser;";

        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<User> u=null;

        if(rs.next()) {
            u = new ArrayList<User>();
            rs.previous();
        }
        while(rs.next()){
            name = rs.getString("u.name");
            lastname = rs.getString("u.lastname");

            User user = new User(name +" "+ lastname);
            u.add(user);
        }

        return u;
    }
}

