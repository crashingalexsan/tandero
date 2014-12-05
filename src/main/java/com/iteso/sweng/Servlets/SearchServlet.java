package com.iteso.sweng.Servlets;

import com.iteso.sweng.dao.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Alejandro on 04/12/2014.
 */
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession respuesta = request.getSession();
        response.setContentType("text/html");
        RequestDispatcher rd =request.getRequestDispatcher("result.jsp");
        respuesta.setAttribute("emailBuscar", request.getParameter("emailBuscar"));
        rd.forward(request,response);


    }
}

