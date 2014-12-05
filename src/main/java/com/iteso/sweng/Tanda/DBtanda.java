package com.iteso.sweng.Tanda;

import com.iteso.sweng.RecoveryPass.SendEmail;
import com.iteso.sweng.SignIn.SignInEmail;
import java.sql.*;

/**
 * Created by Daniel on 12/10/14.
 */
public class DBtanda {

    public Connection conexion;
    public String userDb = "root";
    public String passDb = "root";

    public void conectar() throws SQLException,ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/tandero",userDb, passDb);
    }
    //Desconectar a la Base de datos
    public void desconectar() throws SQLException, ClassNotFoundException{
        conexion.close();
    }
	ResultSet rs;
    public void loadTandas() throws SQLException{
        String sql = "SELECT * FROM tanda";
        PreparedStatement ps = conexion.prepareStatement(sql);
        rs = ps.executeQuery();
	}
	//getNextTanda return containter tandal
	public iTanda getNextTanda() throws SQLException
	{
		if(rs==null)return null;
		iTanda n=null;
		if(rs.next()){
		n=new iTanda();
		n.tandaId=rs.getInt("id");
		n.name = rs.getString("Name");
		n.state = rs.getInt("state");
		n.userId=rs.getInt("organizer");
		
		//Get oranizer name
		String sql = "SELECT * FROM User WHERE iduser = "+n.userId ;
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet userSet = ps.executeQuery();
		if(userSet.next())
			n.userName=userSet.getString("name");
		
		}
		return n;
	}
	public void getUserIntoTanda(int userId, int tandaId) throws SQLException
	{
		String sql = "INSERT INTO tandapartakers VALUES(?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);
		ps.setString(1, Integer.toString( userId ) );
		ps.setString(2, Integer.toString( tandaId ) );
		
        ps.executeUpdate();
		
	}
}