package com.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addProfile")
public class AddProfileServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String city = request.getParameter("city");

String[] skills = request.getParameterValues("skills");

String skillData = "";

if(skills != null){
for(String s : skills){
skillData += s + " ";
}
}

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"insert into profiledatabase(name,email,phone,age,gender,skills,city) values(?,?,?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,email);
ps.setString(3,phone);
ps.setInt(4,Integer.parseInt(age));
ps.setString(5,gender);
ps.setString(6,skillData);
ps.setString(7,city);

int i = ps.executeUpdate();

if(i>0){
response.sendRedirect("index.jsp");
}

}catch(Exception e){
e.printStackTrace();
}

}
}