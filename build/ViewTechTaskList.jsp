<!-- ViewTechTaskList servlet dispatches to this jsp -->
<!-- This file displays the list of tasks that belong to a tech-->
<!DOCTYPE HTML>
<html>
<head>
    <jsp:useBean id="shared" scope="session" class="sbtsapp.Shared" />
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
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>
        <h4 align="center" style="color: #9E9E9E; padding: 30px 0; padding-top: 80px;">Select a Task to Edit</h4>

        <%
        //Get the list of tasks that were set in the bean
        String [][] tasks = shared.getTechTaskList();
        // if the tasks list is not empty
        if(  tasks != null && tasks.length != 0 ){
        %>

        <!-- Table labels used to display the task information-->
        <table class="table table-hover">
            <thead>
                <tr>
                    <!-- Table headers-->
                     <th>Book Title</th>
                     <th>Task Type</th>
                     <th>Task Status</th>
                     <th>Start Date</th>
                     <th>Edit</th>
                </tr>
            </thead>
            <%
            int count = 0;
            //Create an array for the tasks
            for(String[] task : tasks){
            %>
            <tr>
                <!-- Display data fields from task array that correlates to the columns used in the query -->
                <td name="Book Title" align="center"><%=task[8]%></td>
                <td name="Task Type" align="center"><%=task[4]%></td>
                <td name="Task Status" align="center"><%=task[6]%></td>
                <td name="Start Date" align="center"><%=task[1]%></td>
                <td name = "Task ID" align="center">
            		<form id="selectTask<%=count%>" method="POST" action="SelectTask"> <!-- each task has its own form -->
                		<input type="submit" name="Submit" value="Select" class="btn btn-outline-primary btn-sm"/> <!-- submit Task selected to ViewTaskDetails servlet-->
                		<input type="hidden" name="RowIndex" value="<%=count%>" /> <!--Use hidden field in each row and check for the submitted value, send row index of the selected Task -->
            		</form>
                </td>
            </tr>
            <%
            count++; // next row
            }//end of for loop
            %>
        </table>
        <%
        } //end of if
        else // the Task list matrix was empty
        {
        %>
        <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          There are no new tasks available.
        </div>
        <%
        } //end of else
        %>

    </div>
</body>
</html>
