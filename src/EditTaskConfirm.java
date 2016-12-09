/******************************************************************************************

Actor: Technician
Context: After Tech finish editing task, click submit button. The data in the input form will be transfered to this servlet to be handled with.
Purpose: Retrive the data from resquest and based on that update the data in database. Show the succes or failed message on interface.
Invoked by: EditTask.jsp
Dispatch to: EditTaskConfirm.java

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

public class EditTaskConfirm extends maxapp.Control{
    protected DBI dbi;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Get the current HTTP session from Tomcat
        HttpSession session = request.getSession(true);
        //Gets the bean from session and retrieves shared data
        maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
        //Get the status/type from the drop down list in ViewTaskDetails.jsp request
        bean.setTaskOption(request.getParameter("TaskOption"));
        String TaskNote = "";

        //get the new task note input
        if(request.getParameter("EditTaskNote") != null){
            TaskNote = request.getParameter("EditTaskNote");
        }
        UpdateTask(bean, TaskNote);
    }

    private void UpdateTask(maxapp.Shared bean, String TaskNote) throws ServletException, IOException{
        String TaskOption = bean.getTaskOption();
        String TaskID = bean.getTaskID();
        maxapp.DBI dbi = null;
        try{
            dbi = new maxapp.DBI();
                //Check if there is a database connection to Tomcat
                if(dbi.connect()){
                    dbi.EditTask(TaskID, TaskNote);
                    dbi.TaskChangeStatus(TaskID, TaskOption);
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
