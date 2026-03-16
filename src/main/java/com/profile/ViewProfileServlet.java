package com.profile;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/viewProfiles")
public class ViewProfileServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();

out.println("<html>");
out.println("<head>");
out.println("<title>Profile List</title>");
out.println("<link rel='stylesheet' href='/ProfilePage/css/style.css'>");
out.println("</head>");
out.println("<body>");

out.println("<h2>Profile List</h2>");

out.println("<button onclick=\"location.href='addProfile.jsp'\">Add</button>");

out.println("<table>");

out.println("<tr>");
out.println("<th>Select</th>");
out.println("<th>Name</th>");
out.println("<th>Email</th>");
out.println("<th>Phone</th>");
out.println("<th>City</th>");
out.println("<th>Action</th>");
out.println("</tr>");

try {

Connection con = DBConnection.getConnection();
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from profiledatabase");

while(rs.next()){

out.println("<tr>");

out.println("<td><input type='checkbox'></td>");

out.println("<td>"+rs.getString("name")+"</td>");
out.println("<td>"+rs.getString("email")+"</td>");
out.println("<td>"+rs.getString("phone")+"</td>");
out.println("<td>"+rs.getString("city")+"</td>");


out.println("</tr>");

}

} catch(Exception e){
out.println(e);
}

out.println("</table>");
out.println("</body>");
out.println("</html>");

}
}
