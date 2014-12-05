package com.iteso.sweng.Profile;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Daniel on 12/11/14.
 */
public class EditProfile extends BDProfile{

    public void updateContact(Profile pro, String email) throws SQLException {
        String sql = "UPDATE user" + " SET phome ='"+pro.getPhome()+"', poffice ='"+pro.getPoffice()+"', " +
                "pmobile ='"+pro.getPmobile()+"', nick ='"+pro.getNick()+"', street1 ='"+pro.getStreet1()+"', " +
                "street2 ='"+pro.getStreet2()+"', city ='"+pro.getCity()+"', zip ='"+pro.getZip()+"', " +
                "state ='"+pro.getState()+"', country ='"+pro.getCountry()+"', " + "image ='"+pro.getImage()+"'"
                + "WHERE email = '" +email+"'";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ps.executeUpdate();
    }

}
