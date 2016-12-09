<!-- This is the jsp file for confirm the tasks which has been assigned to a tech -->
<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <title>Task Update Confirm Page</title>
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
          <a class="btn btn-secondary btn-sm" href="ViewTechTaskList.jsp">Back to Task List</a>
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>
        <div class="alert alert-success" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          Task has been updated!
        </div>
        <%
        // Conditional that checks for taskdetails for a book.
        String [] TaskDetail = shared.getTaskDetail();
        %>

        <!-- A table is created for the task details. -->
        <table class="table table-hover">
            <thead>
                <tr>
                <!-- Table headers-->
                     <th>Book Title</th>
                     <th>Task Type</th>
                     <th>Task Status</th>
                     <th>Start Date</th>
                </tr>
            </thead>
            <tr>
                <!-- for each records in the database, insert a row into the table  -->
                <td name="booktitle" align="center"><%=TaskDetail[3]%></td>
                <td name="tasktype" align="center"><%=TaskDetail[1]%></td>
                <td name="taskstatus" align="center"><%=TaskDetail[4]%></td>
                <td name="startdate" align="center"><%=TaskDetail[0]%></td>
            </tr>

        </table>
    </div>
</body>
<html>
