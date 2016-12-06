<!-- ViewTaskDetails.java dispatches to this jsp -->
<!-- This file ??  -->
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
            <a class="btn btn-secondary btn-sm" href="ViewTechTaskList.jsp">Back to task list</a>
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>

        <h4 align="center" style="color: #9E9E9E; padding-bottom: 30px; clear: both">Task Information</h4>

        <%
        // Conditional that checks for taskdetails for a book.
        String [] TaskInfo = shared.getSingleTaskInfo();
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
                <td name="booktitle" align="center"><%=TaskInfo[8]%></td>
                <td name="tasktype" align="center"><%=TaskInfo[4]%></td>
                <td name="taskstatus" align="center"><%=TaskInfo[6]%></td>
                <td name="startdate" align="center"><%=TaskInfo[1]%></td>
            </tr>

        </table>

        <div class="row">
            <div class="col-xs-5 form-group">
                <label for="exampleInputEmail1">Previous Task Note</label>
                <table class="table table-hover">
                    <tr>
                        <td>exmale</td>
                        <td>exmale</td>
                        <td>exmale</td>
                    </tr>
                    <tr>
                        <td>exmale</td>
                        <td>exmale</td>
                        <td>exmale</td>
                    </tr>
                    <tr>
                        <td>exmale</td>
                        <td>exmale</td>
                        <td>exmale</td>
                    </tr>
                </table>
            </div>
            <form class="" action="ConfirmTask" method="post">
                <div class="col-xs-5 form-group">
                    <label for="edittasknote">Edit Task</label>
                    <textarea id="edittasknote" name="edittasknote" class="form-control" rows="3"></textarea>
                </div>
                <div class="col-xs-2 form-group">
                    <select id = "Status" name ="Status" class="form-control form-control-sm" style="margin: 30px 0 16px 0">
                        <option value="taskonhold">Task On Hold</option>
                        <option value="taskproblem">Task Problem</option>
                        <option value="complete">Task Complete</option>
                    </select>
                    <input type="submit" value="Submit" class="btn btn-primary btn-sm" style="width: 100%">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
