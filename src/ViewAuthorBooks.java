/******************************************************************************************

Actor: Author
Context: Author wants to check their status, on ViewAuthorBooks.jsp Page, input their eamil, the request include data in that form will be send to this servlet.
Purpose: Use the email address query from database, return all books info that belons to him
Invoked by: ViewAuthorBooks.jsp
Dispatch to: ViewAuthorBooks.jsp

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

public class ViewAuthorBooks extends maxapp.Control{
    protected DBI dbi;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Get the current HTTP session from Tomcat
        HttpSession session = request.getSession(true);
        //Gets the bean from session and retrieves shared data
        maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
        //Get the status/type from the drop down list in ViewTaskDetails.jsp request
        String NewTaskNote = "";
        String AuthorEmail = "";

        //get the new task note input
        if(request.getParameter("email") != null){
            AuthorEmail = request.getParameter("email");
        }

        QueryAuthorBooks(bean, AuthorEmail);
        gotoPage("/ViewAuthorBooks.jsp", request, response);
    }

    private void QueryAuthorBooks(maxapp.Shared bean, String AuthorEmail) throws ServletException, IOException{

        maxapp.DBI dbi = null;
        try{
            dbi = new maxapp.DBI();
                //Check if there is a database connection to Tomcat
                if(dbi.connect()){
                    bean.setAuthorBooks(dbi.getAuthorBooks(AuthorEmail));
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

}
