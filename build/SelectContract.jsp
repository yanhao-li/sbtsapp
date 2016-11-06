<!-- SelectContract dispatches to this jsp -->
<!-- This file displays the contract that was selected and a form that enables the creation of a new book record-->
<!DOCTYPE HTML>
<html>
    <head>
    <jsp:useBean id="shared" scope="session" class="sbtsapp.Shared" />
        <link rel="stylesheet" href="resource/css/bootstrap.min.css">
        <link rel="stylesheet" href="resource/css/main.css">
         <!-- Insert sbtsapp Logo-->
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
              <a class="btn btn-secondary btn-sm" href="ViewContracts.jsp" onclick="email()">Send back to Salesman</a>
              <a class="btn btn-secondary btn-sm" href="ViewContracts.jsp">Back to List of Contracts</a>
              <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
            </div>
            <h4 align="center" style="color: #9E9E9E; padding: 30px 0; padding-top: 80px;">Contract Information</h4>

            <%
            //Get the contract that was selected and set in the bean
            String [][] selectedContract = shared.getSelectedContract();
            if(selectedContract != null && selectedContract.length != 0){
            %>
            <!-- Table used to display the information-->
            <table class="table table-hover">
                <thead>
                    <tr>
                        <!-- Table headers -->
                        <th>Author First Name</th>
                        <th>Author Last Name</th>
                        <th>Salesman First Name</th>
                        <th>Salesman Last Name</th>
                        <th>Initial Title</th>
                        <th>Book Doctor</th>
                        <th>Promotion Weeks</th>
                        <th>Contract Date</th>
                        <th>Contract Status</th>
                    </tr>
                </thead>
                <%
                int count =0;
                //Create an array for the contract
                for(String[] con : selectedContract){
                %>
                <tr>
                <!-- Display information from array that correlates to the columns used in the query -->
                    <td name="authorfirstname" align="center"><%=con[3]%></td>
                    <td name="authorlastname" align="center"><%=con[4]%></td>
                    <td name="empfirstname" align="center"><%=con[5]%></td>
                    <td name="emplastname" align="center"><%=con[6]%></td>
                    <td name="initialtitle" align="center"><%=con[7]%></td>
                    <td name="bookdoctor" align="center"><%=con[10]%></td>
                    <td name="promotionweeks" align="center"><%=con[11]%></td>
                    <td name="contractdate" align="center"><%=con[12]%></td>
                    <td name="contractstatus" align="center"><%=con[13]%></td>
                </tr>
                <%
                count++;
                %>
                <%
                }//end of for loop
                %>
            </table>
            <!-- Form to create a new book and send info to CreateBook servlet -->
            <h4 align="center" style="color: #9E9E9E; padding: 30px 0;">Contract Information</h4>
            <form method = "POST" name= "bookinfo" action = "CreateBook" class="form-inline row">
                <div class="form-group col-xs-3">
                    Title: <input type="text" id= "Title" name="Title" required="required" value="Book Title" class="form-control form-control-sm"> <!-- Preset the text with information from database -->
                </div>
                <div class="form-group col-xs-4">
                    Start Date: <input type="date" id= "Date" name="Date" required="required" class="form-control form-control-sm">
                </div>
                <div class="form-group col-xs-3">
                    Book Format:
                    <select id ="BookFormat" name ="BookFormat" class="form-control form-control-sm">
                        <option value="Email Attachment" id="Email Attachment">Email Attachment</option>
                        <option value="CD ROM" id="CD ROM">CD ROM</option>
                        <option value="Flash Drive" id="Flash Drive">Flash Drive</option>
                        <option value="Paper" id="Paper">Paper</option>
                    </select>
                </div>
                <input type="submit" name="Submit" value="Submit" class="btn btn-outline-primary btn-sm col-xs-1">
            </form>
            <%
            } //end of if
            else
            {
            %>
            <p>There are no contracts available.</p>
            <%
            } //end of else
            %>
        </div>

        <!-- Script is used to bring up an alert when the the Send back to salesman button is clicked -->
        <script>
        function email(){
        alert("Contract sent back to Salesman");
        }
        </script>
    </body>
</html>
