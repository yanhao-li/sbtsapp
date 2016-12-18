/******************************************************************************************

    Actor: Technician
    Context: When technican viewing his task list, he could select one task to edit, one he click the select button, the form will post the index of the row he selected to this servlet.
    Purpose: Using the taskID to Retrive the detail of this task, and store it into bean
    Invoked by: ViewTechTaskList.jsp
    Dispatch to: EditTask.jsp

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

public class EditTask extends maxapp.Control{

//Enables the client to send data/information to the web server
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Ensures that the current session is still valid.
        HttpSession session = request.getSession(true);
        //Gets the bean from session and retrieves shared data
        maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");


        //Variable SelectedBook is a matrix that holds values from getShepherdBookList method
        String [][] TechTaskList = bean.getTechTaskList();
        int RowIndex = Integer.parseInt(request.getParameter("RowIndex"));
        //get the ID of the task selected
        String TaskID = TechTaskList[RowIndex][0];
        String BookID = TechTaskList[RowIndex][3];
        bean.setTaskID(TaskID);
        bean.setBookID(BookID);

        getTaskDetail(bean, TaskID);
        gotoPage("/EditTask.jsp", request, response);

    }

    private void getTaskDetail(maxapp.Shared bean, String TaskID) throws ServletException, IOException{
        String[] taskdetail;
        maxapp.DBI dbi = null;
        try{
            dbi = new maxapp.DBI();
            if(dbi.connect()){
                taskdetail = dbi.getTaskDetail(TaskID);
                bean.setTaskDetail(taskdetail);
            }
        }
        catch(Exception e){
            e.printStackTrace();
            bean.setError("Servlet Exception error" +e);
        }
        finally{
              dbi.close();// close connection to the databse
        }
    }

}//End of Class
