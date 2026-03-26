<%@ page import="java.sql.*" %>
<%@ page import="com.profile.DBConnection" %>

<html>
<head>
<title>Profile List</title>
<link rel="stylesheet" href="css/style.css">

<script>

let deleteIds=[];


function openAdd(){
    window.location="addProfile.jsp";
}


function showMessage(msg){
    document.getElementById("messageText").innerText=msg;
    document.getElementById("messageModal").style.display="flex";
}

function closeMessage(){
    document.getElementById("messageModal").style.display="none";
}


function editProfile(){
    let selected=document.querySelectorAll('input[name="selectProfile"]:checked');

    if(selected.length==0){
        showMessage("Please select one record to edit");
        return;
    }

    if(selected.length>1){
        showMessage("You can edit only one record");
        return;
    }

    window.location="editProfile.jsp?id="+selected[0].value;
}


function openDelete(){
    let selected=document.querySelectorAll('input[name="selectProfile"]:checked');

    if(selected.length==0){
        showMessage("Please select record to delete");
        return;
    }

    deleteIds=[];

    selected.forEach(function(item){
        deleteIds.push(item.value);
    });

    document.getElementById("deleteModal").style.display="flex";
}

function confirmDelete(){
    window.location="deleteProfile?ids="+deleteIds.join(",");
}

function closeDelete(){
    document.getElementById("deleteModal").style.display="none";
}


function selectAllRows(source){
    let checkboxes=document.getElementsByName("selectProfile");

    for(let i=0;i<checkboxes.length;i++){
        checkboxes[i].checked=source.checked;
    }

    updateRowHighlight();
}


function updateSelectAll(){
    let all=document.getElementsByName("selectProfile");
    let header=document.getElementById("selectAll");

    let allChecked=true;

    for(let i=0;i<all.length;i++){
        if(!all[i].checked){
            allChecked=false;
        }
    }

    header.checked=allChecked;

    updateRowHighlight();
}


function updateRowHighlight(){
    let all=document.getElementsByName("selectProfile");

    for(let i=0;i<all.length;i++){
        if(all[i].checked){
            all[i].closest("tr").classList.add("selected");
        }else{
            all[i].closest("tr").classList.remove("selected");
        }
    }
}

</script>

</head>

<body>

<h2>Profile List</h2>

<table>

<tr>
<th><input type="checkbox" id="selectAll" onclick="selectAllRows(this)"></th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Age</th>
<th>Gender</th>
<th>Skills</th>
<th>City</th>
</tr>

<%
try{
Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from profiledatabase");

while(rs.next()){
%>

<tr>

<td>
<input type="checkbox" name="selectProfile"
value="<%=rs.getInt("id")%>" onclick="updateSelectAll()">
</td>

<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("phone")%></td>
<td><%=rs.getInt("age")%></td>
<td><%=rs.getString("gender")%></td>
<td><%=rs.getString("skills")%></td>
<td><%=rs.getString("city")%></td>

</tr>

<%
}

}catch(Exception e){
out.println(e);
}
%>

</table>

<div class="button-container">
<button onclick="openAdd()">Add</button>
<button onclick="editProfile()">Edit</button>
<button class="deleteBtn" onclick="openDelete()">Delete</button>
</div>



<div id="deleteModal" class="modal">
<div class="modal-content smallBox">
<h3>Are you sure you want to delete?</h3>
<br>
<button onclick="confirmDelete()">Yes</button>
<button onclick="closeDelete()">Cancel</button>
</div>
</div>



<div id="messageModal" class="modal">
<div class="modal-content smallBox">
<span class="close-btn" onclick="closeMessage()">&times;</span>
<h3 id="messageText"></h3>
<br>
<button onclick="closeMessage()">OK</button>
</div>
</div>

</body>
</html>