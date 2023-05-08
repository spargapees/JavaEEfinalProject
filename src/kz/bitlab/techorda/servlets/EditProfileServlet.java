package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.*;

import java.io.IOException;

@WebServlet(value = "/edit-profile")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("user_id"));
        User user = DBConnection.getUser(Math.toIntExact((id)));
        req.setAttribute("user", user);
        req.getRequestDispatcher("/editprofile.jsp").forward(req, resp);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("user_id"));
        User user = DBConnection.getUser(Math.toIntExact((id)));
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        System.out.println(fullName + " " + password);
        user.setPassword(password);
        user.setFullName(fullName);
        DBConnection.saveUser(user);
        request.getSession().removeAttribute("currentUser");
        request.getSession().setAttribute("currentUser", user);
        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }
}
