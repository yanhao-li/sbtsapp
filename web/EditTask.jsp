<!-- ViewTasksofBook.java dispatches to this jsp -->
<!DOCTYPE HTML>
<html>
<head>
    <jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <title>Edit Task</title>
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
            <a class="btn btn-secondary btn-sm" href="ViewTechTaskList.jsp">Back to task list</a>
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>

        <h4 align="center" style="color: #9E9E9E; padding-bottom: 30px; clear: both">Task Information</h4>

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

        <h4 align="center" style="color: #9E9E9E; padding-top: 30px; clear: both">Previous Task Note</h4>
        <div class="previous-task-note" style="background-color: #E0E0E0; margin-bottom: 40px">
            <div style="display: inline-block; text-align: left">
                <%=TaskDetail[2]%>
            </div>
        </div>

        <div class="task-note-edit">
            <form action="EditTaskConfirm" method="post">
                <div class="col-xs-8 form-group">
                    <label for="EditTaskNote">Edit Task</label>
                    <textarea name="EditTaskNote" class="form-control" rows="3"></textarea>
                </div>
                <div class="col-xs-3 offset-xs-1 form-group">
                    <select name ="TaskOption" class="form-control form-control-sm" style="margin: 30px 0 16px 0">
                        <option value="Task On Hold">Task On Hold</option>
                        <option value="Task Problem">Task Problem</option>
                        <option value="Task Complete">Task Complete</option>
                    </select>
                    <input type="submit" value="Submit" class="btn btn-primary btn-sm" style="width: 100%">
                </div>
            </form>
        </div>
        </div>
    </div>
</body>
</html>
