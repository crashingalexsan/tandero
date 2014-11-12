package com.iteso.sweng.ChangePass;

/**
 * Created by Daniel on 10/11/14.
 */


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.mockito.Mockito.when;


@RunWith(MockitoJUnitRunner.class)
public class ConfirmServletTest {

    private ConfirmServlet servlet = new ConfirmServlet();

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

    @Test
    public void ChangePassOk() throws ServletException, IOException, SQLException, ClassNotFoundException {
        when(request.getParameter("password")).thenReturn("secret");

        /* perform action */
        servlet.doGet(request, response);
        servlet.doPost(request, response);
        servlet.processRequest(request, response);


    }

    @Test
    public void PassNoEquals() throws ServletException, IOException {
        when(request.getParameter("password")).thenReturn("secret");


        /* perform action */
        servlet.doGet(request, response);
        servlet.doPost(request, response);
        servlet.processRequest(request, response);



    }
}