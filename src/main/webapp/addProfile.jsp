<html>
<head>

<title>Add Profile</title>

<link rel="stylesheet" href="css/editstyle.css">

<script>
function closePage(){
    window.location="index.jsp";
}

function validateEmail(){
    let email = document.getElementById("email").value;

    let pattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

    if(!pattern.test(email)){
        alert("Enter valid Gmail (example@gmail.com)");
        return false;
    }
    return true;
}
</script>

</head>

<body>

<div class="modal">

<div class="modal-content">

<span class="close-btn" onclick="closePage()">&times;</span>

<h2>Add Profile</h2>


<form action="addProfile" method="post" onsubmit="return validateEmail()">

<label>Name</label>
<input type="text" name="name" required>

<label>Email</label>
<input type="email" id="email" name="email"
pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$"
title="Enter valid Gmail (example@gmail.com)"
required>

<label>Phone</label>
<input type="text" name="phone" required maxlength="10">

<label>Age</label>
<input type="number" name="age" required min="1" max="100">

<label>Gender</label>

<div class="radio-group">
<input type="radio" name="gender" value="Male" required> Male
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
<option>Chennai</option>
</select>

<input type="submit" value="Save Profile">

</form>

</div>

</div>

</body>
</html>