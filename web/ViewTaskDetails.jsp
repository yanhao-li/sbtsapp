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
        <%
        // Conditional that checks for taskdetails for a book.
        String [][] taskdetails = shared.getTaskDetails();
        if(taskdetails != null && taskdetails.length != 0){
        %>
        <!-- A table is created for the task details. -->
        <table class="table table-hover">
            <thead>
                <tr>
                <!-- Table headers-->
                     <th>Task Type</th>
                     <th>Task Status</th>
                     <th>Start Date</th>
                     <th>End Date</th>
                     <th>Task Notes</th>
                     <th>Technician First Name</th>
                     <th>Technician Last Name</th>
                </tr>
            </thead>
            <%
            int count = 0;
            // A for loop that will keep on going and won't stop until all details and tasks are displayed.
            for(String[] details : taskdetails){
            %>
            <tr>
                <!-- for each records in the database, insert a row into the table  -->
                <td name="tasktype" align="center"><%=details[4]%></td>
                <td name="taskstatus" align="center"><%=details[6]%></td>
                <td name="startdate" align="center"><%=details[1]%></td>
                <td name="enddate" align="center"><%=details[2]%></td>
                <td name="tasknotes" align="center"><%=details[5]%></td>
                <td name="Techfirstname" align="center"><%=details[8]%></td>
                <td name="Techlastname" align="center"><%=details[9]%></td>
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
          There are no tasks available.
        </div>
        <%
        }//end of else
        %>
        <h4 align="center" style="color: #9E9E9E; padding: 30px 0; padding-top: 80px;">Assign a task for the book</h4>

        <!-- The form is used to assign a task for the book that is chosen.  -->
        <form id = "AssignTask" name="AssignTask" method ="Post" action="SelectTech" align = "center">
            <select id = "Status" name ="Status" class="form-control form-control-sm" style="width: 50%; margin: 0 auto 40px auto;">
                <option value="Scanning" id="Scanning">Scanning</option>
                <option value="Galley 1" id="Galley1">Galley 1</option>
                <option value="Galley 2" id="Galley2">Galley 2</option>
                <option value="Galley 3" id="Galley3">Galley 3</option>
                <option value="ISBN" id="ISBN">Create ISBN</option>
                <option value="Design a Cover" id="DesignCover">Design a Cover</option>
                <option value="Design a Promotion" id="DesignPromotion">Design a Promotion</option>
                <option value="Publish" id="Publish">Publish</option>
            </select>
            <input type="submit" name="AssignTask" value="Assign 1 Task" class="btn btn-outline-primary btn-sm"> <!-- Button used to post the form to AssignTask.java -->
            <input type="submit" name="ParallelTask" value="Assign 1 Task and Assign Another" class="btn btn-outline-primary btn-sm"> <!-- Button used to post the form to ParallelTask.java -->
        </form>

        <!-- A script function that will alert the employee once the task has been assigned (form submitted), and that the book has been sent back to the production manager.  -->
        <script>
            function sendback(){
            alert("Book sent back to Production Manager");
            }
        </script>

        <!-- This form is used to send a book back to the production manager.  -->
        <form align="center" method ="POST" name = "SendBookBack" action ="SendBookBack" onsubmit= "sendback();" style="margin-top: 30px;">
            <input type = "submit" name="sendback" value ="Send Book back to Production Manager" class="btn btn-outline-primary btn-sm">
        </form>
    </div>
</body>
</html>
