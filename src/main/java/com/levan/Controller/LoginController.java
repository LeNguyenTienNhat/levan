
package com.levan.Controller;

import com.levan.User.UserDAO;
import com.levan.User.UserDTO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
            response.setContentType("text/html; charset=UTF-8");
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null)  session.invalidate();  
            }  
            else  {
                UserDAO userDAO = new UserDAO();
                UserDTO userDTO = userDAO.login(username, password);           
                if (userDTO != null) {                        
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usersession", userDTO);     
                    if (userDTO.getRole().equalsIgnoreCase("AD")) response.sendRedirect("dashboard");
                    else response.sendRedirect("userpage.html");
                } else {      
                    request.setAttribute("error", "Wrong username or password");            
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }              
            }
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
