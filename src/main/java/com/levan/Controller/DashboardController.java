
package com.levan.Controller;

import com.levan.Product.ProductDAO;
import com.levan.Product.ProductDTO;
import com.levan.User.UserDAO;
import com.levan.User.UserDTO;
import com.levan.Utils.DBUtils;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DashboardController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        DBUtils util = new DBUtils();
        
        //Session check
        HttpSession session = request.getSession(false); //retrieve current session. If there's no session -> return null
        UserDTO currentUser = null;
        if (session != null) { 
            currentUser = (UserDTO) session.getAttribute("usersession");
         }
         if (currentUser == null) {
            log("Debug: Redirect to login page" + currentUser);            
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
         
         //navigate to dashboard.jsp (main page)
         if (action == null || action.equalsIgnoreCase("main")) {
            UserDAO userDAO = new UserDAO();
            List<UserDTO> userList = userDAO.getUserList();
            int userNum = userList.size();
            int j1 = userDAO.getNumberOfSignup(1, 1);
            int j2 = userDAO.getNumberOfSignup(2, 1);
            int f1 = userDAO.getNumberOfSignup(1, 2);
            int f2 = userDAO.getNumberOfSignup(2, 2);
            int m1 = userDAO.getNumberOfSignup(1, 3);
            int m2 = userDAO.getNumberOfSignup(2, 3);
            int m = m1+m2;
                    
            ProductDAO productDAO = new ProductDAO();
            List<ProductDTO> productList = productDAO.getProductList();
            int productNum = productList.size();

            int[] data = {userNum,productNum,j1,j2,f1,f2,m1,m2,m};
            request.setAttribute("data", data);
            RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);
         }
        
        //Product
         ProductDAO productDAO = new ProductDAO();
            if (action.equals("productlist")) {
                int pageid;
                try {
                    String spageid = request.getParameter("page");  
                    pageid = Integer.parseInt(spageid);  
                } catch (NumberFormatException e) {
                    pageid = 1;
                }
                int skip=0;
                if (pageid!=1) {
                   skip=pageid-1;
                   skip=skip*10;
                }
                List<ProductDTO> list = productDAO.getRecords(skip, 10, "ID");
                request.setAttribute("list",list);
                
                RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("listexport")) {
                String category = request.getParameter("category");  
                List<ProductDTO> list = productDAO.getRecords(0, 0, category); 
                request.setAttribute("list",list);
                RequestDispatcher rd = request.getRequestDispatcher("productExport.jsp");
                rd.forward(request, response);
            }
            
            //Add product
            else if (action.equals("addproduct")) {
                request.setAttribute("action","productcreate");
                RequestDispatcher rd = request.getRequestDispatcher("productCreate.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("productcreate")) {
                List<ProductDTO> list = productDAO.getProductList();
                int ID = list.size();
                String Name = request.getParameter("Name");
                String category_ID = request.getParameter("category_ID");
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                String ImgPath = request.getParameter("ImgPath");
                int Price = Integer.parseInt(request.getParameter("Price"));
                String AddDate = util.getDate();
                String Description = request.getParameter("Description");
                ProductDTO product = new ProductDTO(ID, Name, category_ID, Quantity, ImgPath, Price, AddDate, Description);
                productDAO.insert(product);
                
                List<ProductDTO> plist = productDAO.getRecords(0, 10, "ID");
                request.setAttribute("list", plist);
                RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("productdetails")) {
                int ID = Integer.parseInt(request.getParameter("ID"));      
                ProductDTO product =  productDAO.load(ID);
                request.setAttribute("object", product);
                RequestDispatcher rd = request.getRequestDispatcher("productDetails.jsp");
                rd.forward(request, response);
            }
            
             else if (action.equals("productedit")) {
                int ID = Integer.parseInt(request.getParameter("ID"));      
                ProductDTO product =  productDAO.load(ID);
                request.setAttribute("object",product);
                request.setAttribute("action","productupdate");
                RequestDispatcher rd = request.getRequestDispatcher("productEdit.jsp");
                rd.forward(request, response);
            }
            
            else if (action.equals("productupdate")) {
                ProductDTO Product = new ProductDTO();
                Product.setID(Integer.parseInt(request.getParameter("ID")));
                Product.setName(request.getParameter("Name"));
                Product.setCategory_ID(request.getParameter("category_ID"));
                Product.setQuantity(Integer.parseInt(request.getParameter("Quantity")));
                Product.setImgPath(request.getParameter("ImgPath"));
                Product.setPrice(Integer.parseInt(request.getParameter("Price")));
                Product.setDescription(request.getParameter("Description"));
                productDAO.update(Product);
                
                request.setAttribute("action","productdetails");
                request.setAttribute("object", Product);
                request.getRequestDispatcher("productDetails.jsp").forward(request, response);
            }
            else if (action.equals("productdelete")) {
                int ID = Integer.parseInt(request.getParameter("ID"));  
                productDAO.delete(ID);
                
                List<ProductDTO> plist = productDAO.getRecords(0, 10, "ID");
                request.setAttribute(action, ID);
                request.setAttribute("list", plist);
                RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");
                rd.forward(request, response);
            }
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
