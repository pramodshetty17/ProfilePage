<%@ page import="java.sql.*" %>
<%@ page import="com.profile.DBConnection" %>

<html>
<head>
<title>Profile List</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
text-align:center;
}

table{
width:80%;
margin:auto;
border-collapse:collapse;
background:white;
}

th{
background:#4CAF50;
color:white;
padding:10px;
}

td{
padding:8px;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f1f1f1;
}

button{
padding:8px 15px;
margin:10px;
background:green;
color:white;
border:none;
cursor:pointer;
}

</style>

</head>

<body>

<h2>Profile List</h2>

<button onclick="location.href='addProfile.jsp'">Add Profile</button>

<table>

<tr>
<th>Select</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>City</th>
<th>Action</th>
</tr>

<%
try{

Connection con = DBConnection.getConnection();

Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from profiledatabase");

while(rs.next()){
%>

<tr>

<td>
<input type="checkbox" value="<%=rs.getInt("id")%>">
</td>

<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("phone")%></td>
<td><%=rs.getString("city")%></td>

<td>
<a href="editProfile.jsp?id=<%=rs.getInt("id")%>">Edit</a>
|
<a href="deleteProfile?id=<%=rs.getInt("id")%>">Delete</a>
</td>

</tr>

<%
}

}catch(Exception e){
out.println(e);
}
%>

</table>

</body>
</html>