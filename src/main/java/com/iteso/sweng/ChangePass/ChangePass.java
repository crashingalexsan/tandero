package com.iteso.sweng.ChangePass;

import com.iteso.sweng.Profile.BDProfile;
import com.iteso.sweng.Profile.Profile;
import com.iteso.sweng.Servlets.RServlet;
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
 * Created by Daniel on 13/10/14.
 */
public class ChangePass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            HttpSession respuesta = request.getSession(true);
            String email = respuesta.getAttribute("email").toString();
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");
            BDProfile a = new BDProfile();

            respuesta.setAttribute("error", "");

            //Si la cuenta existe
            try {
                a.conectar();
                if (password.equals(password2)) {

                    a.changePass(email,password,0);
                    respuesta.setAttribute("ok", "The password changed correctly.");

                } else {
                    respuesta.setAttribute("error", "The passwords don't match.");
                }

                a.desconectar();

            } catch (Exception e) {}



            response.setContentType("text/html");
            RequestDispatcher rd=request.getRequestDispatcher("Account/ChangePass/change.jsp");
            rd.forward(request, response);

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
