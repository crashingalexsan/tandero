package com.iteso.sweng.Profile;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class DeleteProfileServlet extends HttpServlet {

    String contextPath;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        this.contextPath=req.getContextPath();
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        HttpSession respuesta = req.getSession(true);

        DeleteProfile a = new DeleteProfile();

            try {
                a.conectar();
                if (a.confirmPass(email,pass)) {

                  if( a.deleteContact(email, pass)){
                       response(resp, "account deleted");
                    }
                    else{
                       response(resp, "cannot delete  account participating on an active Tanda");
                    }

                } else {
                    response(resp, "invalid account");
                }

                a.desconectar();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response(resp, "exception");
            }





    }

    private void response(HttpServletResponse resp, String msg)
            throws IOException {

        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("<t1>" + msg + "</t1>");
        out.println("<br><a href='index.jsp'> return home </a>");
        out.println("</body>");
        out.println("</html>");


    }
}



