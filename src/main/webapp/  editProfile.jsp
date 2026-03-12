<%@ page import="java.sql.*" %>
<%@ page import="com.profile.DBConnection" %>

<html>
<head>

<title>Edit Profile</title>
<style>

body{
    font-family: Arial;
    background:#f4f6f9;
    text-align:center;
}

h2{
    margin-top:20px;
}

form{
    width:400px;
    margin:auto;
    background:white;
    padding:20px;
    box-shadow:0 0 10px gray;
    border-radius:5px;
}

input,select{
    width:100%;
    padding:8px;
    margin:5px 0 10px 0;
}

button,input[type=submit]{
    padding:8px 15px;
    background:green;
    color:white;
    border:none;
    cursor:pointer;
}

button:hover,input[type=submit]:hover{
    background:red;
}

</style>
</head>

<body>

<h2>Edit Profile</h2>

<%

String id=request.getParameter("id");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"select * from profiledatabase where id=?");

ps.setInt(1,Integer.parseInt(id));

ResultSet rs = ps.executeQuery();

if(rs.next()){
%>

<form action="updateProfile" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

Name
<input type="text" name="name" value="<%=rs.getString("name")%>"><br>

Email
<input type="email" name="email" value="<%=rs.getString("email")%>"><br>

Phone
<input type="text" name="phone" value="<%=rs.getString("phone")%>"><br>

Age
<input type="number" name="age" value="<%=rs.getInt("age")%>"><br>

City
<input type="text" name="city" value="<%=rs.getString("city")%>"><br>

<br>

<input type="submit" value="Update">

</form>

<%
}
%>

</body>
</html>