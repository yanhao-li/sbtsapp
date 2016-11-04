/******************************************************************************************

ViewShepherdBookRecords.java

The purpose of this servlet is to get the list of books from the database that belong to a shepherd and need their help.

   + This servlet is invoked by MainPage.jsp
   + This servlet dispatches to ViewShepherdBookRecords.jsp

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

public class ViewShepherdBookRecords extends sbtsapp.Control{
    protected DBI dbi;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    sbtsapp.Shared bean = (sbtsapp.Shared)session.getAttribute("shared");
    //Get the id of the employee who is logged in

   //Call the method that gets the lists of the books belonging to the shepherd

    gotoPage("/ViewShepherdBookRecords.jsp", request, response); //Dispatch to ViewShepherdBookRecords.jsp to show the book list

    }

    //Method to get the list of books belonging to a shepherd
private void getShepherdBookList(sbtsapp.Shared bean, int empid) throws ServletException, IOException{
	// create a DBI shell
        sbtsapp.DBI dbi = null;
	// make a matrix to hold the book list of data
try{
    // create an instance of the DBI
    dbi = new sbtsapp.DBI();
    //Check if there is a database connection to Tomcat
    if(dbi.connect()){
        shepherdBookList = dbi.getShepherdBookList(empid);
        bean.setShepherdBookList(shepherdBookList);

    // Get the list of books from the DB for this shepherd that needs the shepherd and hold them in a matrix

	// save this list of books in the bean
    }
        }
catch(Exception e){
    e.printStackTrace();
    bean.setError("Servlet Exception error" +e);
}

finally{
      dbi.close();//Close connection to database
}
}
}//End of Class
