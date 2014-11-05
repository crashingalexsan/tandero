package com.iteso.sweng.Servlets;

/**
 * Created by Alejandro on 15/10/2014.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.iteso.sweng.dao.LoginDao;


public class ProfileServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String n=request.getParameter("email");
        String p=request.getParameter("password");
        HttpSession session = request.getSession(false);

        if(session!=null)
        if(LoginDao.validate(n, p)){
            RequestDispatcher rd=request.getRequestDispatcher("index2.jsp");
            request.setAttribute("email", n);
            request.setAttribute("password", p);
            session.setAttribute("email", n);
            session.setAttribute("password", p);


            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
            rd.include(request,response);
        }
        out.close();
    }
}
