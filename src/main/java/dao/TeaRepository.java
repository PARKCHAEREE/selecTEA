package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Tea;

public class TeaRepository {
    
  
    private static TeaRepository instance = new TeaRepository();
    public static TeaRepository getInstance() { return instance; }

    
    private String user = "root"; 
    private String password = "1234"; 
    private String url = "jdbc:mysql://localhost:3307/selecteaDB?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=utf8";
    
   
    public TeaRepository() { }

    
    public ArrayList<Tea> getAllTeas() {
        ArrayList<Tea> listOfTeas = new ArrayList<Tea>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            
            String sql = "SELECT * FROM tea";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Tea t = new Tea();
                t.setTeaId(rs.getString("t_id"));
                t.setName(rs.getString("t_name"));
                t.setUnitPrice(rs.getInt("t_unitPrice"));
                t.setDescription(rs.getString("t_description"));
                t.setCountry(rs.getString("t_country"));
                t.setCategory(rs.getString("t_category"));
                t.setPackaging(rs.getString("t_packaging"));
                t.setUnitsInStock(rs.getLong("t_unitsInStock"));
                t.setFilename(rs.getString("t_fileName"));
                listOfTeas.add(t);
            }
        } catch (Exception e) {
            System.out.println("getAllTeas() 에러: " + e.getMessage());
            e.printStackTrace();
        } finally {
           
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception ex) { ex.printStackTrace(); }
        }
        return listOfTeas;
    }

   
    public Tea getTeaById(String teaId) {
        Tea tea = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            
            String sql = "SELECT * FROM tea WHERE t_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, teaId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                tea = new Tea();
                tea.setTeaId(rs.getString("t_id"));
                tea.setName(rs.getString("t_name"));
                tea.setUnitPrice(rs.getInt("t_unitPrice"));
                tea.setDescription(rs.getString("t_description"));
                tea.setCountry(rs.getString("t_country"));
                tea.setCategory(rs.getString("t_category"));
                tea.setPackaging(rs.getString("t_packaging"));
                tea.setUnitsInStock(rs.getLong("t_unitsInStock"));
                tea.setFilename(rs.getString("t_fileName"));
            }
        } catch (Exception e) {
            System.out.println("getTeaById() 에러: " + e.getMessage());
            e.printStackTrace();
        } finally {
          
             try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception ex) { ex.printStackTrace(); }
        }
        return tea;
    }

  
    public void addTea(Tea tea) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO tea VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, tea.getTeaId());
            pstmt.setString(2, tea.getName());
            pstmt.setInt(3, tea.getUnitPrice());
            pstmt.setString(4, tea.getDescription());
            pstmt.setString(5, tea.getCountry());
            pstmt.setString(6, tea.getCategory());
            pstmt.setString(7, tea.getPackaging());
            pstmt.setLong(8, tea.getUnitsInStock());
            pstmt.setString(9, tea.getFilename());

            pstmt.executeUpdate(); 
            
        } catch (Exception e) {
            System.out.println("addTea() 에러: " + e.getMessage());
            e.printStackTrace();
        } finally {
            
             try {
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch(Exception ex) { ex.printStackTrace(); }
        }
    }
    
    
    
}