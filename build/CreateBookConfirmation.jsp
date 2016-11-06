<!-- CreateBook dispatches to this jsp -->
<!-- This file displays the l book count that was just created by the manager-->
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
          <a class="btn btn-secondary btn-sm" href="ViewContracts">Back to List of Contracts</a>
          <a class="btn btn-secondary btn-sm" href="BookList">Go to List of Books</a>
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>

        <div class="alert alert-success" role="alert" style="clear: both; margin: 80px 0 30px 0;">
          Book record has been created!
        </div>

        <%
        //Get the book that was just createrd and set in the bean
        String [][] confirmbook = shared.getConfirmBook();
        if(confirmbook != null && confirmbook.length != 0){
        %>
        <!-- Table used to display the information-->
        <table class="table table-hover">
            <thead>
                <tr>
                     <th>Book ID</th>
                     <th>Title</th>
                     <th>Start Date</th>
                </tr>
            </thead>
        <%
        int count = 0;
        //Create an array for the book
        for(String[] book : confirmbook){
        %>
        <tr>
            <!-- Display information from array that correlates to the columns used in the query -->
            <td name="bookID" align="center"><%=book[0]%></td>
            <td name="title" align="center"><%=book[1]%></td>
            <td name="startdate" align="center"><%=book[2]%></td>
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
        <p>There are no new books available.</p>
        <%
        } //End of else
        %>
    </div>
</body>
</html>
