<%@ page import="java.sql.*" %>
<%@ page import="com.profile.DBConnection" %>

<html>
<head>

<title>Add Profile</title>
<style>

body{
    font-family: Arial, sans-serif;
    background-color:#f4f6f9;
    text-align:center;
}

h2{
    margin-top:20px;
}

form{
    width:450px;
    margin:auto;
    background:white;
    padding:25px;
    border-radius:8px;
    box-shadow:0 4px 10px rgba(0,0,0,0.2);
}

label{
    display:block;
    text-align:left;
    margin-top:10px;
    font-weight:bold;
}

input[type=text],
input[type=email],
input[type=number],
input[type=tel],
select{
    width:100%;
    padding:8px;
    margin-top:5px;
    margin-bottom:10px;
}

.radio-group,
.checkbox-group{
    text-align:left;
    margin-bottom:10px;
}

.radio-group input,
.checkbox-group input{
    width:auto;
    margin-right:5px;
}

button,
input[type=submit]{
    width:100%;
    padding:10px;
    background:#4CAF50;
    color:white;
    border:none;
    cursor:pointer;
}

button:hover,
input[type=submit]:hover{
    background:#2e7d32;
}

.close-btn{
    background:red;
    width:120px;
    margin-top:10px;
}

</style>
</head>

<body>

<h2>Add Profile</h2>

<form action="addProfile" method="post">

<label>Name</label>
<input type="text" name="name">

<label>Email</label>
<input type="email" name="email">

<label>Phone</label>
<input type="text" name="phone">

<label>Age</label>
<input type="number" name="age">

<label>Gender</label>
<div class="radio-group">
<input type="radio" name="gender" value="Male"> Male
<input type="radio" name="gender" value="Female"> Female
</div>

<label>Skills</label>
<div class="checkbox-group">
<input type="checkbox" name="skills" value="Java"> Java
<input type="checkbox" name="skills" value="HTML"> HTML
<input type="checkbox" name="skills" value="SQL"> SQL
</div>

<label>City</label>
<select name="city">
<option>Hyderabad</option>
<option>Bangalore</option>
<option>Mumbai</option>
</select>

<br>

<input type="submit" value="Save">

<button type="button" class="close-btn" onclick="history.back()">Close</button>

</form>
</body>
</html>