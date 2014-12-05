package com.iteso.sweng.Profile;

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
public class EditProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            HttpSession respuesta = request.getSession(true);
            String email = respuesta.getAttribute("email").toString();
            EditProfile a = new EditProfile();

            respuesta.setAttribute("error", "");

            //Si la cuenta existe
            try {
                a.conectar();
                if (a.ifExistAccount(email)) {
                    //La cuenta existe

                    if(respuesta.getAttribute("ok")!=null) {
                        Profile b= new Profile();

                        b.setCountry(request.getParameter("country"));
                        b.setState(request.getParameter("state"));
                        b.setZip(request.getParameter("zip"));
                        b.setCity(request.getParameter("city"));
                        b.setNick(request.getParameter("nick"));
                        b.setPhome(request.getParameter("phome"));
                        b.setPmobile(request.getParameter("pmobile"));
                        b.setPoffice(request.getParameter("poffice"));
                        b.setStreet1(request.getParameter("street1"));
                        b.setStreet2(request.getParameter("street2"));
                        b.setImage(request.getParameter("image"));
                        a.updateContact(b, email);
                        respuesta.setAttribute("ok", null);
                        respuesta.setAttribute("ok2", "You information has been update.");
                    }
                    else
                    {
                        respuesta.setAttribute("country",request.getParameter("country2"));
                        respuesta.setAttribute("state",request.getParameter("state2"));
                        respuesta.setAttribute("zip",request.getParameter("zip2"));
                        respuesta.setAttribute("city",request.getParameter("city2"));
                        respuesta.setAttribute("nick",request.getParameter("nick2"));
                        respuesta.setAttribute("phome",request.getParameter("phome2"));
                        respuesta.setAttribute("pmobile",request.getParameter("pmobile2"));
                        respuesta.setAttribute("poffice",request.getParameter("poffice2"));
                        respuesta.setAttribute("street1",request.getParameter("street12"));
                        respuesta.setAttribute("street2",request.getParameter("street22"));
                        respuesta.setAttribute("image",request.getParameter("image"));

                        respuesta.setAttribute("ok", "Do you want to apply the changes?");
                    }

                } else {
                    respuesta.setAttribute("error", "Session Invalid.");
                }

                a.desconectar();

            } catch (Exception e) {}



            response.setContentType("text/html");
            RequestDispatcher rd=request.getRequestDispatcher("Profile/editprofile.jsp");
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
