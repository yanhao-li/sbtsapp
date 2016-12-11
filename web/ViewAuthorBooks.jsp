<!DOCTYPE HTML>
<html>
<head>
<jsp:useBean id="shared" scope="session" class="maxapp.Shared" />
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/css/main.css">
    <title>My Books Status</title>
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

        <p class="lead">Hello Author!</p> <!--Get the firstname of the employee that is logged in and display it-->
        <!-- Buttons redirect user to other pages -->
        <div class="btn-group" role="group" aria-label="Basic example" style="float: right;">
          <a class="btn btn-secondary btn-sm" href="Login.jsp">Home Page</a>
        </div>

        <h4 align="center" style="color: #9E9E9E; padding: 30px 0; padding-top: 80px;">Assign a Task to a Book</h4>

        <form method="post" class="form-inline" action="ViewAuthorBooks">
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" class="form-control" id="email" name="authoremail" placeholder="example@kean.edu">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>

        <%
        //Get the list of books that were set in the bean
        String [][] books = shared.getAuthorBooks();
        // if the books list is not empty
        if(  books != null && books.length != 0 ){
        %>

        <!-- Table labels used to display the book information-->
        <table class="table table-hover">
            <thead>
                <tr>
                    <!-- Table headers-->
                     <th>Title</th>
                     <th>Book Status</th>
                     <th>Start Date</th>
                     <th>Published Date</th>
                </tr>
            </thead>
            <%
            //Create an array for the books
            for(String[] book : books){
            %>
            <tr>
                <!-- Display data fields from book array that correlates to the columns used in the query -->
                <td name="Title" align="center"><%=book[0]%></td>
                <td name="BookStatus" align="center"><%=book[1]%></td>
                <td name="StartDate" align="center"><%=book[2]%></td>
                <td name="PublishedDate" align="center"><%=book[3]%></td>
            </tr>
            <%
            }
            %>
        </table>

        <%
            } //end of if
            else // the books list matrix was empty
            {
        %>
            <div class="alert alert-warning" role="alert" style="clear: both; margin: 80px 0 30px 0;">
              Didn't find information about your book, check your input and try again
            </div>
        <%
            } //end of else
        %>

    </div>
</body>
<html>
