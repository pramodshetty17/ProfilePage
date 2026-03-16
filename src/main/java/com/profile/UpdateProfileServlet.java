package com.profile;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

int id=Integer.parseInt(request.getParameter("id"));
int age=Integer.parseInt(request.getParameter("age"));
String gender=request.getParameter("gender");
String city=request.getParameter("city");

try{

Connection con=DBConnection.getConnection();

PreparedStatement ps=con.prepareStatement(
"update profiledatabase set age=?,gender=?,city=? where id=?");

ps.setInt(1,age);
ps.setString(2,gender);
ps.setString(3,city);
ps.setInt(4,id);

ps.executeUpdate();

response.sendRedirect("index.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}