<!-- Login dispatches to this jsp -->
<!-- This file displays the different links that are accessible to the manager, shepherd, and tachnician-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="sbtsapp.Shared" />
     <!-- Insert sbtsapp Logo-->
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
</head>
<h1 align = "center"><img  align = "center" src= "resource/images/booklogo.png" alt = "Book Logo"></h1>
<p>Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p> <!--Get the firstname of the employee that is logged in and display it-->
<body>
    <div class="container">
        <%
        //Get the Manager, Shepherd, and Technician values that were set in the bean from the Login
        String Manager = shared.getManager();
        String Shepherd = shared.getShepherd();
        String Technician = shared.getSkill();
        //Assign the positions to an array
        String [] position = {Manager, Shepherd, Technician};
        //If the Shepherd and Technician are null and the Manager = "Yes", load the manager links
        if(position[1] == null && position[2] == null && position[0].equals("Yes")){
        %>
        <jsp:include page="Manager.html" flush = "true"/>
        <%

        }//End of if

        //If the Manager and Technician are null and the Shepherd= "Yes", load the shepherd links
        else if(position[0] == null && position[2] == null && position[1].equals("Yes")){
        %>
        <jsp:include page="Shepherd.html" flush = "true"/>
        <%
        } //End of else if

        //Else, load the technician links
        else {
        %>
        <jsp:include page="Technician.html" flush = "true"/>
        <%
        } //End of else
        %>
    </div>
</body>


</html>
