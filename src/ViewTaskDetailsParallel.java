/******************************************************************************************

ViewTaskDetailsParallel.java

The purpose of this book is to provide information of the tasks and its details./

   + This servlet is invoked by MainPage.jsp
   + This servlet dispatches to ViewTaskDetails.jsp

******************************************************************************************/

package sbtsapp;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import sbtsapp.DBI;
import sbtsapp.Control;
import sbtsapp.Shared;


//ViewTaskDetailsParralel inherits methods from sbtsapp.Control through extends

public class ViewTaskDetailsParallel extends sbtsapp.Control{

    //information is posted via the doPost method
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    sbtsapp.Shared bean = (sbtsapp.Shared)session.getAttribute("shared");
    //variable SelectedBook is assigned via the getShepherdBookList method in Shared.java
    //The same applies to BookId
    String [][] SelectedBook = bean.getShepherdBookList();
    String bookID = bean.getBookID();
    //   The current bookID is now assigned through setBookID
    bean.setBookID(bookID);
    //   getTaskDetails method is called with bean and bookID as parameters.
    getTaskDetails(bean, bookID);
    //After the method, the page is redirected, and the new task details are displayed.
    gotoPage("/ViewTaskDetails.jsp", request, response); //

    }

    //Method: getTaskDetails
private void getTaskDetails(sbtsapp.Shared bean, String BookID) throws ServletException, IOException{
        String[][] taskdetails;
        sbtsapp.DBI dbi = null;
try{
    dbi = new sbtsapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
	// acquire the new task details with the bookID that is passed, and set the variable taskdetails to the bean.
        taskdetails = dbi.getTaskDetails(BookID);
        bean.setTaskDetails(taskdetails);
        }
}

//Used to show if there is an error.

catch(Exception e){
    e.printStackTrace();
    bean.setError("Servlet Exception error" +e);
}

finally{
      dbi.close();//Close connection to database
}
}
}//End of Class
