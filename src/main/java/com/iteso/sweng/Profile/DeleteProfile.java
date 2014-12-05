package com.iteso.sweng.Profile;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DeleteProfile extends BDProfile{

    public Boolean confirmPass(String email,String pass) throws SQLException{
        String sql = "SELECT * FROM user WHERE email='"+email+"' AND password='"+pass+"'";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            return true;
        }
        return false;
    }

    public boolean deleteContact (String email, String pass) throws SQLException {


        String sql2="SELECT t.id FROM tandapartakers AS ui, "+
                 " tanda as t, user as u  WHERE  ui.user=u.iduser AND  t.id=ui.tanda"+
                   " AND t.state=1   AND  u.email = '" +email+"' AND u.password ='"+pass+"'";

        PreparedStatement ps2 = conexion.prepareStatement(sql2);
        ResultSet isActive = ps2.executeQuery();


        if(!isActive.next()){
                 String sql = "DELETE FROM user WHERE email= '" +email+"'";
                 PreparedStatement ps = conexion.prepareStatement(sql);
                 ps.executeUpdate();
            return true;
        }
        else{
            return false;
        }



    }
}
