package kz.bitlab.techorda.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kz.bitlab.techorda.db.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String redirect = "/login?error";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = DBConnection.getUser(email);
        if(user!=null){
            if(user.getPassword().equals(password)){
                redirect = "/profile";
                request.getSession().setAttribute("currentUser", user);
            }
        }
        response.sendRedirect(redirect);
    }
}
