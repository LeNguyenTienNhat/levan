package com.levan.User;

import com.levan.Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {    
    //return UserDTO with given UserID and passwords as parameter
    public UserDTO login(String UserID, String passwords) throws ClassNotFoundException {
        String sql = "select * from Users "
                + "where UserID = ? and passwords = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, UserID);
            ps.setString(2, passwords);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO userDTO =  new UserDTO();
                userDTO.setFullName(rs.getString("FullName"));
                userDTO.setRole(rs.getString("Role"));
                return userDTO;
            }
        }
        catch (SQLException ex) {
            System.out.println("Query user error!" + ex.getMessage());
        }
        return null;
    }
    
    //get a list of users
    public List<UserDTO> getUserList() throws ClassNotFoundException {
        List<UserDTO> list = new ArrayList<>();
        String sql = "select * from Users"; 
        try {
            //connect to database (SQL Server)
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String UserID = rs.getString("UserID");
                String Role = rs.getString("Role");
                String Password = rs.getString("passwords");
                String FullName = rs.getString("FullName");
                String Phone =  rs.getString("Phone");
                String Address = rs.getString("Address");
                String City = rs.getString("City");
                int Point = rs.getInt("Point");
                String RegisterDate = rs.getString("RegisterDate");
                
                UserDTO user =  new UserDTO(UserID, Role, Password,  FullName,  Phone, Address,  City,  Point,  RegisterDate);
                list.add(user);
            }
            return list;
        }
        catch (SQLException ex) {
            System.out.println("Query user error!" + ex.getMessage());
        }
        return list;	
    }
    
         public int getNumberOfSignup(int half, int month) throws ClassNotFoundException {
         List<UserDTO> list = getUserList(); 
         int count=0;
         for (int i=0; i<list.size(); i++) {
             String a = list.get(i).getRegisterDate();
             String[] arrOfStr = a.split("-");
             int m = Integer.parseInt(arrOfStr[1]);
             int day = Integer.parseInt(arrOfStr[2].substring(0, 2));
             if (half==1) {
                  if (m==month&&day>=1&&day<15) count++;
             }
             else if (m==month&&day>=15&&day<=28) count++;
         }
         return count;
     }
}
