package com.iteso.sweng.SignIn;

import com.iteso.sweng.Profile.BDProfile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Daniel on 03/11/14.
 */
public class ResendCodeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession respuesta = request.getSession(true);
            String email = respuesta.getAttribute("email").toString();
            BDProfile a = new BDProfile();

            respuesta.setAttribute("error", "");

                try {
                    a.conectar();
                    if (a.resendCode(email))
                        respuesta.setAttribute("ok", "Check your email now.");
                    else
                        respuesta.setAttribute("error", "ERROR: Your account is active already.");
                    a.desconectar();

                } catch (Exception e) {}



            response.setContentType("text/html");
            RequestDispatcher rd=request.getRequestDispatcher("SignIn/activate.jsp");
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
