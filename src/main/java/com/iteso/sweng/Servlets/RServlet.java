package com.iteso.sweng.Servlets;

/**
 * Created by Daniel on 30/10/14.
 */
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        RequestDispatcher rd=request.getRequestDispatcher(""+request.getParameter("value"));
        rd.forward(request,response);

    }
}
