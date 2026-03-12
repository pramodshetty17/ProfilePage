package com.profile;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

String id=request.getParameter("id");
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String age=request.getParameter("age");
String city=request.getParameter("city");

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"update profile set name=?,email=?,phone=?,age=?,city=? where id=?");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,age);
ps.setString(5,city);
ps.setInt(6,Integer.parseInt(id));

ps.executeUpdate();

response.sendRedirect("viewProfiles");

}catch(Exception e){
e.printStackTrace();
}

}
}