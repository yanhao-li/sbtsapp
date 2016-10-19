/******************************************************************************************

ConfirmTech.java

The purpose of this servlet is to process the confirm the tech


   + This servlet is invoked by 
   + This servlet dispatches to
******************************************************************************************/

package SBTS;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import SBTS.DBI;
import SBTS.Control;
import SBTS.Shared;

public class ConfirmTech extends SBTS.Control{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the shared bean from session
    SBTS.Shared bean = (SBTS.Shared)session.getAttribute("shared");
     //Get the roles from bean
     String [][] designers = bean.getDesigners();
     String [][] editors = bean.getEditors();
     String [][] admins = bean.getAdmins();
     //get TechID from request, and pass it to variable tech
    int tech = Integer.parseInt(request.getParameter("TechID"));
    //get Task status from bean, and pass to status
    String status = bean.getChooseTaskStatus();

    //when the status is "Design a cover" or "Design a promotion", do the following
    if(status.equals("Design a Cover") || status.equals("Design a Promotion")){
    //assign this task to a designer
    String settechID = designers[tech][0];
    bean.setTechID(settechID);
    //Get the bookID and tasktype for this task from the bean
    String bookID = bean.getBookID();
    String tasktype = bean.getChooseTaskStatus();
    String taskstatus = tasktype + " Started";
    //using AssignTask to link the settech with the task and book
    AssignTask(bean, bookID, tasktype, taskstatus,settechID);
    TaskAssigned(bean, bookID);
    getConfirmTask(bean);
    }

        //If the status of task is galley
    else if (status.equals("Galley 1") || status.equals("Galley 2") || status.equals("Galley 3")){
    String settechID = editors[tech][0];
    bean.setTechID(settechID);
    String bookID = bean.getBookID();
    String tasktype = bean.getChooseTaskStatus();
    String taskstatus = tasktype + " Started";
    //Assign the task to the settech
    AssignTask(bean, bookID, tasktype, taskstatus,settechID);
    TaskAssigned(bean, bookID);
    getConfirmTask(bean);
    }

     //If the task is "Scanning", "ISBN", "Publish"
    else if (status.equals("Scanning") || status.equals("ISBN") || status.equals("Publish")){
    String settechID = admins[tech][0];
    bean.setTechID(settechID);
    String bookID = bean.getBookID();
    String tasktype = bean.getChooseTaskStatus();
    String taskstatus = tasktype + " Started";
    AssignTask(bean, bookID, tasktype, taskstatus,settechID);
    TaskAssigned(bean, bookID);
    getConfirmTask(bean);
    }
    gotoPage("/ConfirmTech.jsp", request, response); //redirect the page to confirmtech page

    }

   //Method AssignTask
private void AssignTask(SBTS.Shared bean, String BookID, String TaskType, String TaskStatus, String TechID) throws ServletException, IOException{
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        //if connection exist, Assign the task to the select tech
        dbi.AssignTask(BookID, TaskType, TaskStatus,TechID);
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

    //Method to change the status of book
private void TaskAssigned(SBTS.Shared bean, String BookID) throws ServletException, IOException{
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
	//if yes, set the book status to "Task Assigned"
        dbi.TaskAssigned(BookID);
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

    //Method to
private void getConfirmTask(SBTS.Shared bean) throws ServletException, IOException{
        String[][] confirmtask;
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        //if yes, get the array of confirmtask, and pass it to the confirmtask variable
        confirmtask= dbi.getConfirmTask();
        //set the confirmtask value of the object
        bean.setConfirmTask(confirmtask);
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
