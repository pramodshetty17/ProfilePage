package com.profile;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

String id=request.getParameter("id");

try{

Connection con=DBConnection.getConnection();

PreparedStatement ps=con.prepareStatement(
"delete from profiledatabase where id=?");

ps.setInt(1,Integer.parseInt(id));

ps.executeUpdate();

response.sendRedirect("viewProfiles");

}catch(Exception e){
e.printStackTrace();
}

}
}
