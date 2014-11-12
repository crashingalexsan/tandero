package com.iteso.sweng.ChangePass;

import com.iteso.sweng.Profile.BDProfile;
import com.iteso.sweng.Profile.Profile;
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
public class ConfirmServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            HttpSession respuesta = request.getSession(true);
            String email = respuesta.getAttribute("email").toString();
            String password = request.getParameter("password");
            BDProfile a = new BDProfile();

            respuesta.setAttribute("error", "");

            //Si la cuenta existe
            try {
                a.conectar();
                if (a.ifExistAccount(email)) {

                    if(LoginDao.validate(email, password)){
                        response.setContentType("text/html");
                        RequestDispatcher rd=request.getRequestDispatcher("Account/ChangePass/change.jsp");
                        rd.forward(request, response);
                    }
                    else
                        respuesta.setAttribute("error", "The password is invalid.");

                } else {
                    respuesta.setAttribute("error", "Invalid session.");
                }

                a.desconectar();

            } catch (Exception e) {}



            response.setContentType("text/html");
            RequestDispatcher rd=request.getRequestDispatcher("Account/ChangePass/index.jsp");
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
