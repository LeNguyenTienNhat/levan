
package com.levan.Product;
import com.levan.Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    //search feature
//    public List<ProductDTO> list(String keyword, String city) {
//        ArrayList<ProductDTO> list = new ArrayList<>();
//        String sql = "select id, firstname, lastname from Product ";
//        String whereJoinWord = " where ";     
//        
//        if (keyword != null && !keyword.trim().isEmpty()) {
//            sql += whereJoinWord;
//            sql += " (firstname  like  ? OR lastname like ? )";
//            whereJoinWord = " and ";  
//        }
//        if (city != null && !city.trim().isEmpty()) {
//            sql += whereJoinWord;
//            sql += " city  LIKE ? ";
//        }
//        
//        try {
//            //connect to database (SQL Server)
//            Connection conn = DBUtils.getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql);
//            
//            int index = 1;
//            if (keyword != null && !keyword.trim().isEmpty()){
//                ps.setString(index, keyword);
//                index ++;
//                ps.setString(index, keyword);
//                index ++;
//            }
//            if (city != null && !city.trim().isEmpty()){
//                ps.setString(index, city);
//                index ++;
//            }
//            
//            ResultSet rs = ps.executeQuery(sql);
//            while (rs.next()){
//                    list.add(new ProductDTO (
//                                    rs.getLong("id"),
//                                    rs.getString("firstname"),
//                                    rs.getString("lastname")));
//            }
//            return list;
//        }
//        catch (SQLException ex) {
//            System.out.println("Query Product error!" + ex.getMessage());
//        }
//        return list;	
//    }
    
    
    public List<ProductDTO> getProductList() throws ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();        
        String sql = "select * from Product"; 
        try {
            //connect to database (SQL Server)
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setID(rs.getInt("ID"));
                product.setName(rs.getString("Name"));
                product.setCategory_ID(rs.getString("cat_ID"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setImgPath(rs.getString("ImgPath"));
                product.setPrice(rs.getInt("Price"));
                product.setAddDate(rs.getString("Adddate"));
                product.setDescription(rs.getString("Describe"));
                list.add(product);
            }
            return list;
        }
        catch (SQLException ex) {
            System.out.println("Query user error!" + ex.getMessage());
        }
        return list;	
    }
    
    
    
    
    //CRUD: CREATE
    public Long insert(ProductDTO Product) throws ClassNotFoundException  {
        String sql = "INSERT INTO Product"               
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";    
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql); 
            ps.setInt(1, Product.getID());
            ps.setString(2, Product.getName());
            ps.setString(3, Product.getCategory_ID());
            ps.setInt(4, Product.getQuantity());
            ps.setString(5, Product.getImgPath());
            ps.setInt(6, Product.getPrice());
            ps.setDate(7, java.sql.Date.valueOf(java.time.LocalDate.now()));
            ps.setString(8, Product.getDescription());
            ps.executeUpdate();
        }
        catch (SQLException ex) {
            System.out.println("Product insertion failed due to internal error :(" + ex.getMessage());
        }
        return null;
    }

     //CRUD: READ
    public ProductDTO load(int id) throws ClassNotFoundException {
        String sql = "select * from Product where ID = ?";
        try {
            Connection conn = DBUtils.getConnection();      //connect to SQL
            PreparedStatement ps = conn.prepareStatement(sql);      //convert the string "sql" to an SQL statement                       
            ps.setInt(1, id);      //parse value of "id" to the "?" placeholder at the SQL statement   
            ResultSet rs = ps.executeQuery();       //execute the SQL statement   
            if (rs.next()){     //rs.next() read data in the table row by row
//                This method returns a boolean value specifying whether the ResultSet object contains more rows. 
//                If there are no rows next to its current position this method returns false, else returns true
                int ID = rs.getInt("ID");
                String Name = rs.getString("Name");
                String cat_ID = rs.getString("cat_ID");
                int Quantity = rs.getInt("Quantity");
                String ImgPath =rs.getString("ImgPath");
                int Price = rs.getInt("Price");
                String Adddate = rs.getString("AddDate");
                String Description = rs.getString("Describe");
                
                return new ProductDTO(ID, Name, cat_ID, Quantity, ImgPath, Price, Adddate, Description);
               }
        }
        catch (SQLException ex) {
            System.out.println("Failed to load product's detail due to internal error :(" + ex.getMessage());
        }
        return null;
    }
    
    //CRUD: UPDATE
    public boolean update(ProductDTO Product) throws ClassNotFoundException{
        String sql = "UPDATE Product SET Name = ?, cat_ID = ?, Quantity = ?, ImgPath = ?, Price = ?, Describe = ? "
                + "WHERE ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Product.getName());
            ps.setString(2, Product.getCategory_ID());
            ps.setInt(3, Product.getQuantity());
            ps.setString(4, Product.getImgPath());
            ps.setInt(5, Product.getPrice());
            ps.setString(6, Product.getDescription());
            ps.setInt(7, Product.getID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Failed to update product's detail due to internal error :(" + ex.getMessage());
        }
        return false;
    }
     
    //CRUD: DELETE
    public boolean delete(int ID) throws ClassNotFoundException{
        String sql = "DELETE FROM Product WHERE ID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Deletion fail due to internal error :(" + ex.getMessage());
        }
        return false;
    }
           
    public boolean checkIdDuplication (int id) throws ClassNotFoundException  {
        List<ProductDTO> list = getProductList();
        for (int i=0; i<list.size(); i++) {
            if (list.get(i).getID()==id) return true;
        }
        return false;
    }
    
     public List<ProductDTO> getRecords(int skip, int numOfRow, String category) throws ClassNotFoundException {  
        List<ProductDTO> list = new ArrayList<>();        
        String sql = "SELECT * FROM Product ORDER BY "+category+ " DESC"; 
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps;
            if (numOfRow==10) {
                sql+=" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                ps = conn.prepareStatement(sql);     
                ps.setInt(1, skip);
                ps.setInt(2, numOfRow);
            }
            else {
                ps = conn.prepareStatement(sql);
            }     
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setID(rs.getInt("ID"));
                product.setName(rs.getString("Name"));
                product.setCategory_ID(rs.getString("cat_ID"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setImgPath(rs.getString("ImgPath"));
                product.setPrice(rs.getInt("Price"));
                product.setAddDate(rs.getString("Adddate"));
                product.setDescription(rs.getString("Describe"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("Query user error!" + ex.getMessage());
        }
        return list;	 
    }    

}
