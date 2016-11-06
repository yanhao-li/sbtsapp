<!-- ViewContracts dispatches to this jsp -->
<!-- This file displays the list of contracts that do not have a book record-->
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
              <jsp:getProperty name="shared" property="message"/><!--retrieves the error message from the shared bean -->
            </div>
            <%}%>

            <% if(shared.getError() != ""){ %>
            <div class="alert alert-warning" role="alert">
              <jsp:getProperty name="shared" property="error"/><!--retrieves the error data from the shared bean -->
            </div>
            <%}%>

            <jsp:setProperty name="shared" property="message" value=""/><!-- empty error message from the shared bean -->
            <jsp:setProperty name="shared" property="error" value=""/> <!-- empty error data from the shared bean -->
        </div>

        <p class="lead">Hello <jsp:getProperty name="shared" property="empFirstName"/>!</p> <!--Get the firstname of the employee that is logged in and display it-->

        <!-- Buttons to redirect to other pages -->
        <div class="btn-group" role="group" aria-label="Basic example" style="float: right">
          <a class="btn btn-secondary btn-sm" href="MainPage.jsp">Main Page</a>
        </div>

        <h4 align="center" style="color: #9E9E9E; padding-bottom: 30px;">Select a Contract to Assign a Book Record to</h4>
        <%
        //Get the list of contracts that were set in the bean
        String [][] newContracts = shared.getNewContracts();
        if(newContracts != null && newContracts.length != 0){
        %>
        <!-- Table used to display the information-->
        <table class="table table-hover">
            <thead>
                <tr>
                <!-- Table headers-->
                <th>Author First Name</th>
                <th>Author Last Name</th>
                <th>Salesman First Name</th>
                <th>Salesman Last Name</th>
                <th>Initial Title</th>
                <th>Contract Status</th>
                <th>Select Contract</th>
                </tr>
            </thead>
            <%
            int count =0;
            //Create an array for the contracts
            for(String[] con : newContracts){
            %>
            <tr>
            <!-- Display information from array that correlates to the columns used in the query -->
            <td name="authorfirstname" align="center"><%=con[2]%></td>
            <td name="authorlastname" align="center"><%=con[3]%></td>
            <td name="salesmanfirstname" align="center"><%=con[5]%></td>
            <td name="salesmanlastname" align="center"><%=con[6]%></td>
            <td name="initialtitle" align="center"><%=con[7]%></td>
            <td name="contractstatus" align="center"><%=con[8]%></td>
            <td name = "ContractID" align="center">
            <form id="selectContract<%=count%>" method="POST" action="SelectContract"> <!-- each contract has its own form -->
               <input type="submit" name="Submit" class="btn btn-outline-primary btn-sm" value="Select"/> <!-- submit contract selected to Select Contract servlet-->
               <input type="hidden" name="ContractID" value="<%=count%>" /> <!-- send row index of the selected contract -->
            </form>
            </td>
            </tr>
            <%
            count++;
            }//end of for loop
            %>
        </table>
        <%
        } //end of if
        else
        {
        %>
        <p>There are no new contracts available.</p>
        <%
        } //end of else
        %>
    </div>
</body>
</html>
