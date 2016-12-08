/******************************************************************************************

Actor:
Context:
Invoked by:
Dispatch to:

SendBookBack.java

The purpose of this servlet is to enable the shepherd to send a book back to the manager if they cannot work on it.

   + This servlet is invoked by ViewTaskDetails.jsp
   + This servlet dispatches to MainPage.jsp

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

public class SendBookBack extends maxapp.Control{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
    //Get the ID of the book that was selected from the bean
    String bookID = bean.getBookID();
    //Call the methods to change the book status and reset the shepherd ID
    EscalateBook(bean, bookID);
    SendBookBack(bean, bookID);
    gotoPage("/MainPage.jsp", request, response);

    }

   //Method to change the status of the book to 'Escalated'
private void EscalateBook(maxapp.Shared bean, String BookID) throws ServletException, IOException{
        maxapp.DBI dbi = null;
try{
    dbi = new maxapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        dbi.EscalateBook(BookID);
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

//Method to reset the ShepherdID of the Book selected
private void SendBookBack(maxapp.Shared bean, String BookID) throws ServletException, IOException{
        maxapp.DBI dbi = null;
try{
    dbi = new maxapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        dbi.SendBookBack(BookID);
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
