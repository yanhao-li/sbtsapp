/******************************************************************************************

ConfirmTechParallel.java

The purpose of this java file is to process the situation that the user try to assign multiple tasks to a tech.

   + This servlet is invoked by SelectTechParallel.jsp
   + This servlet dispatches to ViewTaskDetailsParallel.java

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

public class ConfirmTechParallel extends sbtsapp.Control{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    sbtsapp.Shared bean = (sbtsapp.Shared)session.getAttribute("shared");
      //get all roles from bean
     String [][] designers = bean.getDesigners();
     String [][] editors = bean.getEditors();
     String [][] admins = bean.getAdmins();
    //get the tech id from request and assign it to the tech variable
    int tech = Integer.parseInt(request.getParameter("TechID2"));
    String status = bean.getChooseTaskStatus();

    //If the status is "Design a cover" or "Design a Promotion"
    if(status.equals("Design a Cover") || status.equals("Design a Promotion")){
    String settechID = designers[tech][0];
    bean.setTechID(settechID);
    String bookID = bean.getBookID();
    String tasktype = bean.getChooseTaskStatus();
    String taskstatus = tasktype + " Started";
    AssignTask(bean, bookID, tasktype, taskstatus,settechID);
    TaskAssigned(bean, bookID);
    }

    //If the status is galley
    else if (status.equals("Galley 1") || status.equals("Galley 2") || status.equals("Galley 3")){
    String settechID = editors[tech][0];
    bean.setTechID(settechID);
    String bookID = bean.getBookID();
    String tasktype = bean.getChooseTaskStatus();
    String taskstatus = tasktype + " Started";
    AssignTask(bean, bookID, tasktype, taskstatus,settechID);
    TaskAssigned(bean, bookID);
    }

    //If the status is scanning ISBN or Publish
    else if (status.equals("Scanning") || status.equals("ISBN") || status.equals("Publish")){
    String settechID = admins[tech][0];
    bean.setTechID(settechID);
    String bookID = bean.getBookID();
    String tasktype = bean.getChooseTaskStatus();
    String taskstatus = tasktype + " Started";
    AssignTask(bean, bookID, tasktype, taskstatus,settechID);
    TaskAssigned(bean, bookID);
    }
    gotoPage("/ViewTaskDetailsParallel", request, response); //redirect the page to viewtaskdetailsparallel page

    }

   //Method to assign task to a selected tech
   private void AssignTask(sbtsapp.Shared bean, String BookID, String TaskType, String TaskStatus, String TechID) throws ServletException, IOException{
        sbtsapp.DBI dbi = null;
try{
    dbi = new sbtsapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
	//link the tech with the task in database
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

  //Method to
private void TaskAssigned(sbtsapp.Shared bean, String BookID) throws ServletException, IOException{
        sbtsapp.DBI dbi = null;
try{
    dbi = new sbtsapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
	//
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
}//End of Class
