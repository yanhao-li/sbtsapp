<!-- AssignShepherd dispatches to this jsp -->
<!-- This file displays the list of Shepherds and their book count, and gives the user the option to select a shepherd to assign to a book-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
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
        <h4 align="center" style="color: #9E9E9E; padding: 30px 0; padding-top: 80px;">Select a Shepherd</h4>

        <%
        //Get the list of shepherds that were set in the bean
        String [][] shepherds = shared.getShepherds();
        if(shepherds != null && shepherds.length != 0){
        %>
        <!-- Table used to display the information-->
        <table class="table table-hover">
            <thead>
                <tr>
                <!-- Table headers -->
                <th>Employee ID</th>
                <th>Shepherd First Name</th>
                <th>Shepherd Last Name</th>
                <th>Number of Books Assigned</th>
                <th>Assign Book</th>
                </tr>
            </thead>
            <%
            int count =0;

            //Create an array for the shepherds
            for(String[] shep : shepherds){

            %>
            <tr>
            <!-- Display information from array that correlates to the columns used in the query -->
            <td name="shepherdID"><%=shep[0]%></td>
            <td name="shepherdfirstname"><%=shep[1]%></td>
            <td name="shepherdlastname"><%=shep[2]%></td>
            <td name="shepherdcount"><%=shep[3]%></td>
            <td name = "ShepherdID">
                <form id="ShepherdID<%=count%>" method="POST" action="ShepherdConfirmation"> <!-- each shepherd has its own form -->
                       <input type="submit" name="Submit" value="Select" class="btn btn-outline-primary btn-sm"/> <!-- submit shepherd selected to Shepherd Confirmation servlet-->
                       <input type="hidden" name="ShepherdID" value="<%=count%>" /> <!-- send row index of the selected shepherd -->
                </form>
            </td>
            </tr>
            <%
            count++;
            }//end of for loop
            %>
        </table>
        <%
        } //End of if
        else
        {
        %>
        <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          There are no new shepherds available.
        </div>
        <%
        } //End of else
        %>
    </div>
</body>
</html>
