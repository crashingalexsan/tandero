package com.iteso.sweng.SignIn;

import com.iteso.sweng.Profile.BDProfile;
import com.iteso.sweng.Profile.Profile;

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
public class SigninServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            HttpSession respuesta = request.getSession(true);
            String email = request.getParameter("email");
            BDProfile a = new BDProfile();

            respuesta.setAttribute("error", "");

            //Si la cuenta existe
            try {
                a.conectar();
                if (!a.ifExistAccount(email)) {
                //La cuenta existe
                    String pass = request.getParameter("password");
                    String pass2 = request.getParameter("password2");

                    if(pass.equals(pass2)) {
                        Profile b= new Profile();

                        b.setName(request.getParameter("name"));
                        b.setCountry(request.getParameter("country"));
                        b.setState(request.getParameter("state"));
                        b.setZip(request.getParameter("zip"));
                        b.setCity(request.getParameter("city"));
                        b.setEmail(request.getParameter("email"));
                        b.setLastname(request.getParameter("lastname"));
                        b.setNick(request.getParameter("nick"));
                        b.setPassword(request.getParameter("password"));
                        b.setPhome(request.getParameter("phome"));
                        b.setPmobile(request.getParameter("pmobile"));
                        b.setPoffice(request.getParameter("poffice"));
                        b.setStreet1(request.getParameter("street1"));
                        b.setStreet2(request.getParameter("street2"));
                        b.setStatus(false);

                        a.setContact(b);
                        a.newUser(request.getParameter("email"));
                        respuesta.setAttribute("ok", "Has been sent an email with the information to active your account.");
                    }
                    else
                    {
                        respuesta.setAttribute("error", "The passwords doesn't match.");
                    }

                } else {
                            respuesta.setAttribute("error", "The account(E-mail) exist already.");
                }

                a.desconectar();

            } catch (Exception e) {}



            response.setContentType("text/html");
            RequestDispatcher rd=request.getRequestDispatcher("SignIn/signin.jsp");
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
