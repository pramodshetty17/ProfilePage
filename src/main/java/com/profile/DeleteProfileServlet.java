package com.profile;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

String ids=request.getParameter("ids");

try{
Connection con=DBConnection.getConnection();

CallableStatement cs=con.prepareCall("{call delete_profile(?)}");

cs.setString(1,ids);

cs.execute();

response.sendRedirect("index.jsp");

}catch(Exception e){
e.printStackTrace();
}
}
}