package com.iteso.sweng.Tanda.Display;

import com.iteso.sweng.Tanda.Organizer;
import com.iteso.sweng.Tanda.Tanda;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Arturo Cabrera on 12/3/2014.
 */
public class MyTandas {
    public MyTandas(){
    }

    private Connection conexion;
    private String userDb = "root";
    private String passDb = "root";
    private String name;
    private int amount;

    private Organizer org;

    public void conectar() throws SQLException,ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conexion= DriverManager.getConnection("jdbc:mysql://localhost:3306/tandero", userDb, passDb);
    }
    //Desconectar a la Base de datos
    public void desconectar() throws SQLException, ClassNotFoundException{
        conexion.close();
    }

    public ArrayList<Tanda> getTandas(String email) throws SQLException{
        String sql = "SELECT * FROM tanda t, user u WHERE email='"+email+"' AND t.organizer = u.iduser";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Tanda> tandas=null;

        if(rs.next()) {
            tandas = new ArrayList<Tanda>();
            rs.previous();
        }
        while(rs.next()){
            name = rs.getString("t.name");
            amount = rs.getInt("t.amount");
            org = new Organizer(rs.getString("u.name"));
            Tanda tanda = new Tanda(name,amount, org);
            tandas.add(tanda);
        }

        return tandas;
    }
}
