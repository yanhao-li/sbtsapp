<!-- AssignShepherd dispatches to this jsp -->
<!-- This file displays the shepherd that was just assigned to a book-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <title>Assign Shepherd Result</title>
</head>
<body>
    <div class="container">
        <div class="text-xs-center logo">
            <img  align = "center" class = "rounded" src= "resource/images/booklogo.png" alt = "Book Logo" style= "width: 270px; height: 150px">
        </div>
        <div class="message-panel">
            <% if(shared.getMessage() != ""){ %>
            <div class="alert alert-success" role="alert">
              <jsp:getProperty name="shared" property="message"/>
            </div>
            <%}%>

            <% if(shared.getError() != ""){ %>
            <div class="alert alert-warning" role="alert">
              <jsp:getProperty name="shared" property="error"/>
            </div>
            <%}%>

            <jsp:setProperty name="shared" property="message" value=""/><!-- empty error message from the shared bean -->
            <jsp:setProperty name="shared" property="error" value=""/> <!-- empty error data from the shared bean -->
        </div>

        <p class="lead">Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p> <!--Get the firstname of the employee that is logged in and display it-->
        <!-- Buttons redirect user to other pages -->
        <div class="btn-group" role="group" aria-label="Basic example" style="float: right;">
          <a class="btn btn-secondary btn-sm" href="BookList">Back to List of Books</a>
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>
        <div class="alert alert-success" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          Shepherd has been assigned!
        </div>


        <%
        //Get the shepherd that was just assigned to a book
        String [][] confirmshepherd = shared.getConfirmShepherd();
        if(confirmshepherd != null && confirmshepherd.length != 0){
        %>
        <!-- Table used to display the information-->
        <table class="table table-hover" >
        <tr>
        <!-- Table headers-->
             <th>Employee ID</th>
             <th>Shepherd First Name</th>
             <th>Shepherd Last Name</th>
        </tr>
        <%
        int count =0;
        //Create an array for the shepherd
        for(String[] shep : confirmshepherd){

        %>
        <tr>
            <!-- Display information from array that correlates to the columns used in the query -->
            <td name="shepherdID"><%=shep[0]%></td>
            <td name="shepherdfirstname"><%=shep[1]%></td>
            <td name="shepherdlastname"><%=shep[2]%></td>
        </tr>
        <%
        count++;
        }//end of for loop
        %>
        </table>
        <%
        }//end of if
        else
        {
        %>
        <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          There are no shepherds available.
        </div>
        <%
        }//end of else
        %>
    </div>
</body>


</html>
