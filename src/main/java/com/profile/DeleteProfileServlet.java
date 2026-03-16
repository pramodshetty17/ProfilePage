package com.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

String ids=request.getParameter("ids");

try{

Connection con=DBConnection.getConnection();

Statement st=con.createStatement();

String sql="delete from profiledatabase where id in("+ids+")";

st.executeUpdate(sql);

response.sendRedirect("index.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}