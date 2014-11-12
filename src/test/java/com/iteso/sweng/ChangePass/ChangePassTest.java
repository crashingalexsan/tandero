package com.iteso.sweng.ChangePass;

/**
 * Created by Daniel on 10/11/14.
 */


import static org.junit.Assert.assertNotEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iteso.sweng.Profile.BDProfile;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;


@RunWith(MockitoJUnitRunner.class)
public class ChangePassTest  {

    private ChangePass servlet = new ChangePass();

    @Mock private HttpServletRequest request;
    @Mock private HttpServletResponse response;
    @Mock private HttpSession session;
    @Mock private RequestDispatcher rd;
    //@Mock private BDProfile a;


    @Before
    public void setUp() throws ServletException, IOException {

        when(request.getSession(true)).thenReturn(session); //Requerido before
        when(session.getAttribute("email")).thenReturn("email@something.com"); //Requerido before
        PrintWriter writer = new PrintWriter("somefile.txt"); //extra
        when(response.getWriter()).thenReturn(writer); //extra
        when(request.getRequestDispatcher("Account/ChangePass/change.jsp")).thenReturn(rd); //Requerido para continuar
    }

    @Test //Contraseñas iguales, manda mensaje satisfactorio
    public void ChangePassOk() throws ServletException, IOException, SQLException, ClassNotFoundException {
        when(request.getParameter("password")).thenReturn("secret");
        when(request.getParameter("password2")).thenReturn("secret");
        assertEquals(request.getParameter("password"), request.getParameter("password2"));

        /* perform action */
        servlet.doGet(request, response);
        servlet.doPost(request, response);
        servlet.processRequest(request, response);


    }

    @Test //Contraseñas Diferentes, manda mensaje de error
    public void PassNoEquals() throws ServletException, IOException {
        when(request.getParameter("password")).thenReturn("secret");
        when(request.getParameter("password2")).thenReturn("secret2");
        assertNotEquals(request.getParameter("password"), request.getParameter("password2"));


        /* perform action */
        servlet.doGet(request, response);
        servlet.doPost(request, response);
        servlet.processRequest(request, response);



    }
}