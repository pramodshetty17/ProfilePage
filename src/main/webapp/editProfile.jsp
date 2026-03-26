<%@ page import="java.sql.*" %>
<%@ page import="com.profile.DBConnection" %>

<html>

<head>

<title>Edit Profile</title>

<link rel="stylesheet" href="css/editstyle.css">

<script>
function closePage(){
window.location="index.jsp";
}
</script>

</head>

<body>

<div class="modal">

<div class="modal-content">

<span class="close-btn" onclick="closePage()">&times;</span>

<h2>Edit Profile</h2>

<%

String id=request.getParameter("id");

Connection con=DBConnection.getConnection();

PreparedStatement ps=con.prepareStatement(
"select * from profiledatabase where id=?");

ps.setInt(1,Integer.parseInt(id));

ResultSet rs=ps.executeQuery();

if(rs.next()){
%>

<form action="updateProfile" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<label>Name</label>
<input type="text" name="name" value="<%=rs.getString("name")%>" readonly>

<label>Email</label>
<input type="email" name="email" value="<%=rs.getString("email")%>" readonly>

<label>Phone</label>
<input type="text" name="phone" value="<%=rs.getString("phone")%>" readonly>

<label>Age</label>
<input type="number" name="age" value="<%=rs.getInt("age")%>" required>

<label>Gender</label>

<div class="radio-group">
<label>
<input type="radio" name="gender" value="Male"
<%= "Male".equals(rs.getString("gender")) ? "checked" : "" %>> Male
</label>

<label>
<input type="radio" name="gender" value="Female"
<%= "Female".equals(rs.getString("gender")) ? "checked" : "" %>> Female
</label>
</div>


<label>Skills</label>

<%
String skillData = rs.getString("skills");
String[] skillArray = skillData != null ? skillData.split(",") : new String[0];
java.util.List skillList = java.util.Arrays.asList(skillArray);
%>

<div class="checkbox-group">

<label>
<input type="checkbox" name="skills" value="Java"
<%= skillList.contains("Java") ? "checked" : "" %>> Java
</label>

<label>
<input type="checkbox" name="skills" value="HTML"
<%= skillList.contains("HTML") ? "checked" : "" %>> HTML
</label>

<label>
<input type="checkbox" name="skills" value="SQL"
<%= skillList.contains("SQL") ? "checked" : "" %>> SQL
</label>

</div>


<label>City</label>
<input type="text" name="city" value="<%=rs.getString("city")%>">

<input type="submit" value="Update Profile">

</form>

<% } %>

</div>

</div>

</body>

</html>