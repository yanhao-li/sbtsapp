<!-- This is the jsp file for confirm the tasks which has been assigned to a tech -->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <title>Task Assign Confirmation</title>
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
          <a class="btn btn-secondary btn-sm" href="ViewShepherdBookRecords">Back to Shepherd Book List</a>
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>
        <div class="alert alert-success" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          Task has been assigned!
        </div>

        <%
        //retrieves the task confirmed array from the shared bean
        String [][] confirmtask = shared.getConfirmTask();
        if(confirmtask != null && confirmtask.length != 0){
        %>
        <!-- this is the table of detail of all tasks and the tech assigned -->
        <table class="table table-hover">
            <thead>
                <tr>
                <!-- header cell of the table -->
                     <th>Task ID</th>
                     <th>Task Type</th>
                     <th>Task Status</th>
                     <th>Start Date</th>
                     <th>Technician First Name</th>
                     <th>Technician Last Name</th>
                </tr>
            </thead>
            <%
            int count = 0;
            //create the table row for all tasks
            for(String[] details : confirmtask){
            %>
            <tr>
                <!-- The table content  -->
                <td name="taskID" align="center"><%=details[0]%></td>
                <td name="tasktype" align="center"><%=details[4]%></td>
                <td name="taskstatus" align="center"><%=details[6]%></td>
                <td name="startdate" align="center"><%=details[1]%></td>
                <td name="Techfirstname" align="center"><%=details[8]%></td>
                <td name="Techlastname" align="center"><%=details[9]%></td>
            </tr>
            <%
            count++;
            }//end of for loop
            %>
        </table>
        <%
        } // End of if
        else
        {
        %>
        <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          There are no tasks available.
        </div>
        <%
        } //End of else
        %>
    </div>
</body>
<html>
