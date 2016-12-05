/******************************************************************************************

ViewTaskDetails.java

The purpose of this servlet is to get the tasks that is assigned to a specific book.

   + This servlet is invoked by MainPage.jsp
   + This servlet dispatches to ViewTaskDetails.jsp

******************************************************************************************/

package maxapp;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import maxapp.DBI;
import maxapp.Control;
import maxapp.Shared;

//ViewTaskDetails inherits methods and classes from maxapp.Control

public class ViewTaskDetails extends maxapp.Control{

//Enables the client to send data/information to the web server
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
 //Ensures that the current session is still valid.
    HttpSession session = request.getSession(true);
 //Gets the bean from session and retrieves shared data
    maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
 //Variable SelectedBook is a matrix that holds values from getShepherdBookList method
    String [][] SelectedBook = bean.getShepherdBookList();

    int BookID = Integer.parseInt(request.getParameter("BookID"));
    String setbookID = SelectedBook[BookID][0];

    bean.setBookID(setbookID);

//calls the method GetTaskDetails with the parameters of bean, and set book ID
    getTaskDetails(bean, setbookID);
    gotoPage("/ViewTaskDetails.jsp", request, response);

    }

private void getTaskDetails(maxapp.Shared bean, String BookID) throws ServletException, IOException{

//taskdetails is a String matrix.
        String[][] taskdetails;


        maxapp.DBI dbi = null;
try{

    //Checks if there is a database connection.
    dbi = new maxapp.DBI();
       //If a database connection is succcessful, display the task details
       //sadas
        // The task details are obtained via getTaskDetails method with the bookID as the parameter.
        //The bean's values are changed then with the current task details.
    // After the method is invoked, it then goes to a new jsp page with the request and the response.
        if(dbi.connect()){
        taskdetails = dbi.getTaskDetails(BookID);
        bean.setTaskDetails(taskdetails);
        }
}

//If there is an error, this will be displayed.
catch(Exception e){
    e.printStackTrace();
    bean.setError("Servlet Exception error" +e);
}

finally{
      dbi.close();// close connection to the databse
}
}
}//End of Class
