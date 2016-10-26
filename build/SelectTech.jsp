<!-- ViewTaskDetails dispatches to this jsp -->
<!-- This file displays the list of Technicians and their task count, and gives the user the option to select a Tech to assign to a task-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
     <!-- Insert maxapp Logo-->
    <h1 align = "center"><img  align = "center" src= "images/booklogo.png" alt = "Book Logo" style= "width: 270px; height: 150px"></h1>
</head>
<body bgcolor = "#00BFFF">
                        <jsp:getProperty name="shared" property="message"/>  <!--retrieves the error message from the shared bean -->
                        <jsp:getProperty name="shared" property="error"/>  <!--retrieves the error data from the shared bean -->
                        <jsp:setProperty name="shared" property="message" value=""/><!-- empty error message from the shared bean -->
                        <jsp:setProperty name="shared" property="error" value=""/> <!-- empty error data from the shared bean -->

<p>Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p> <!-- retrieves the first name of Login user from the shared bean -->

<!--  A button is accessible for users that will take them back to the main page or View task details page. -->

<a href="ViewTaskDetails.jsp"><button type="button" style="float:right;">Back to Assign Task</button></a>
<a href="MainPage.jsp"><button type="button" style="float:left;">Main Page</button></a>
<%
////Get the designers, editors, admins, status values that were set in the bean from the SelectTech
String [][] designers = shared.getDesigners();
String [][] editors = shared.getEditors();
String [][] admins = shared.getAdmins();
String status = shared.getChooseTaskStatus();

//if the task status is "Design a Cover" or "Design a Promotion", show the list of designers.
if(status.equals("Design a Cover") || status.equals("Design a Promotion")){
%>
<h2 align="center">Designers</h2>

<%
if(designers != null && designers.length != 0){
%>
<!--  Show the table of Designers -->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- The header of table -->
     <th>Employee ID</th>
     <th>Designer First Name</th>
     <th>Designer Last Name</th>
	 <th>Number of Tasks Assigned to</th>
     <th>Select</th>
<tr>
<%
int count =0;
//For every employees exist in designers array, reassign it to a new value called design
for(String[] design : designers){
%>
<tr>
<!-- retrieve the employee's info and put it into the table  -->
<td name="designerID" align="center"><%=design[0]%></td>
<td name="firstname" align="center"><%=design[2]%></td>
<td name="lastname" align="center"><%=design[1]%></td>
<td name="designcount" align="center"><%=design[3]%></td>
<td name = "TechID" align="center">
					<form id="TechID<%=count%>" method="POST" action="ConfirmTech"> <!-- The form used to post information to ConfirmTech.java  -->
					       <input type="submit" name="Submit" value="Select"/> <!-- The button to select tech -->
					       <input type="hidden" name="TechID" value="<%=count%>" /> <!-- a hidden field to record the TECHID, useless in this case -->
						   </form>
</td>
</tr>
<%
count++;
}//end of for loop
%>
</table>
<%
}//End of inner if statement
else
{
%>
<p>There are no Designers</p>
<%
}//end of else
}//End of outer if statement

//If the task is related to Gallery, do the following statement
else if(status.equals("Galley 1") || status.equals("Galley 2") || status.equals("Galley 3")){
%>

<h2 align="center">Editors</h2>
<%
if(editors != null && editors.length != 0){
%>
<!--  Shows the table of all editors -->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- the header of table  -->
     <th>Employee ID</th>
     <th>Editor First Name</th>
     <th>Editor Last Name</th>
	 <th>Number of Tasks Assigned to</th>
     <th>Select</th>
<tr>
<%
int count =0;
//For every editors in the list
for(String[] edit : editors){
%>
<tr>
<!-- retrieve every employee's info and put into the table  -->
<td name="editorID" align="center"><%=edit[0]%></td>
<td name="firstname" align="center"><%=edit[2]%></td>
<td name="lastname" align="center"><%=edit[1]%></td>
<td name="editcount" align="center"><%=edit[3]%></td>
<td name = "TechID" align="center">
					<form id="TecID<%=count%>" method="POST" action="ConfirmTech"> <!-- The form execute POST operation to ConfirmTech.java  -->
					       <input type="submit" name="Submit" value="Select"/> <!-- The select button to submit the form -->
					       <input type="hidden" name="TechID" value="<%=count%>" /> <!-- A hidden field to record the TechID -->
						   </form>
</td>
</tr>
<%
count++;
}//end of for loop
%>
</table>
<%
}//end of inner if statement
else
{
%>
<p>There are no Editors</p>
<%
} //end of else
}//end of outer else if statement

//If the status of task is "Scanning" or "ISBN" or "Publish"
else if(status.equals("Scanning") || status.equals("ISBN") || status.equals("Publish")){
%>


<h2 align="center">Admins</h2>
<%
if(admins != null && admins.length != 0){
%>
<!-- Shows the table of all admins in Database -->
<table align = "center" border = "2"  bgcolor="#F0F8FF" >
<tr>
<!-- The header of the table  -->
     <th>Employee ID</th>
     <th>Administrator First Name</th>
     <th>Administrator Last Name</th>
	 <th>Number of Tasks Assigned to</th>
     <th>Select</th>
<tr>
<%
int count =0;
//For every admins exists there, assign every individual employee to a new var called admin
for(String[] admin : admins){
%>
<tr>
<!-- retrieve the info of the employee  -->
<td name="adminID" align="center"><%=admin[0]%></td>
<td name="firstname" align="center"><%=admin[2]%></td>
<td name="lastname" align="center"><%=admin[1]%></td>
<td name="admincount" align="center"><%=admin[3]%></td>
<td name = "TechID" align="center">
					<form id="TechID<%=count%>" method="POST" action="ConfirmTech"> <!-- same as above, form to do POST to ConfirmTech.java -->
					       <input type="submit" name="Submit" value="Select"/> <!-- button to sumit the form -->
					       <input type="hidden" name="TechID" value="<%=count%>" /> <!-- record the TechID  -->
						   </form>
</td>
</tr>
<%
count++;
}//end of for loop
%>
</table>
<%
} //end of inner if statement
else
{
%>
<p>There are no Admins</p>
<%
}//end of else
}//end of outer else if statement
%>

</body>


</html>
