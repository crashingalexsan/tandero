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
public class ActivateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession respuesta = request.getSession(true);
            String email = respuesta.getAttribute("email").toString();
            String code = request.getParameter("code");
            BDProfile a = new BDProfile();

            respuesta.setAttribute("error", "");

            //Si E-mail vacio
            out.println(email);
            if (email.isEmpty() || code.isEmpty()) {
                respuesta.setAttribute("error", "You need to put your E-mail & the Code.");

            } else {
                    try {
                        a.conectar();
                            if (a.ifCodeIsCorrect2(code, email))
                                respuesta.setAttribute("ok", "Done, your account is active now!");
                            else
                                respuesta.setAttribute("error", "The code is wrong.");
                        a.desconectar();

                    } catch (Exception e) {}

            }

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
