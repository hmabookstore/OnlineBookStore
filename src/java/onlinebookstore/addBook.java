package onlinebookstore;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class addBook extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            //String savePath="C:\\Users\\HP\\Documents\\NetBeansProjects\\OnlineBookStore\\web\\images";
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select max(bookid) from books;");
            ResultSet rs=ps.executeQuery();
            rs.next();
            int bookid=rs.getInt(1)+1;
            String bookname=request.getParameter("bookname");
            String author=request.getParameter("author");
            String description=request.getParameter("description");
            int price=Integer.parseInt(request.getParameter("price"));
            int discount=Integer.parseInt(request.getParameter("discount"));
            String genre=request.getParameter("genre");
            PreparedStatement ps2=con.prepareStatement("insert into books values(?,?,?,?,?,?,?);");
            ps2.setInt(1,bookid);
            ps2.setString(2,bookname);
            ps2.setString(3,author);
            ps2.setString(4,description);
            ps2.setInt(5,price);
            ps2.setInt(6,discount);
            ps2.setString(7,genre);
            ps2.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Book Added Successfully!');");
                out.println("location='addBook.jsp';");
                out.println("</script>");
        } catch (SQLException ex) {
            Logger.getLogger(addBook.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
