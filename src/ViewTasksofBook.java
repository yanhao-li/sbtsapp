/******************************************************************************************

    Actor: Shepherd
    Context: Shepherd check the list of book he was assigned, and select one of them to see the detail task of it. This servet accept the rowIndex selected from ViewShepherdBookRecord.jsp and use that index get the bookID of the select book, so that got all the task and details the book has.
    Invoked by: ViewShepherdBookRecord.jsp
    Dispatch to: ViewTasksofBook.jsp

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

public class ViewTasksofBook extends maxapp.Control{

//Enables the client to send data/information to the web server
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
 //Ensures that the current session is still valid.
    HttpSession session = request.getSession(true);
 //Gets the bean from session and retrieves shared data
    maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
 //Variable SelectedBook is a matrix that holds values from getShepherdBookList method
    String [][] SelectedBook = bean.getShepherdBookList();

    int RowIndex = Integer.parseInt(request.getParameter("RowIndex"));
    String setbookID = SelectedBook[RowIndex][0];

    bean.setBookID(setbookID);

//calls the method getTasksofBook with the parameters of bean, and set book ID
    getTasksofBook(bean, setbookID);
    gotoPage("/ViewTasksofBook.jsp", request, response);

    }

    private void getTasksofBook(maxapp.Shared bean, String BookID) throws ServletException, IOException{

        String[][] tasksofbook;

        maxapp.DBI dbi = null;
        try{

            //Checks if there is a database connection.
            dbi = new maxapp.DBI();
            // After the method is invoked, it then goes to a new jsp page with the request and the response.
                if(dbi.connect()){
                tasksofbook = dbi.getTasksofBook(BookID);
                bean.setTasksofBook(tasksofbook);
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
