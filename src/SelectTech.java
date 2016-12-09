/******************************************************************************************

Actor:
Context:
Invoked by:
Dispatch to:

SelectTech.java

The purpose of this servlet is to process the selected book from the list
and generate a list of technicians and their task counts.

   + This servlet is invoked by ViewTaskDetails.jsp
   + This servlet dispatches to SelectDesTech.jsp or SelectEdiTech.jsp, or SelectAdmTech.jsp or SelectTechParallel.jsp

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

public class SelectTech extends maxapp.Control{
    protected DBI dbi;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
    //Get the status/type from the drop down list in ViewTaskDetails.jsp request
    String taskstatus = request.getParameter("Status");
    String setbookID = bean.getBookID();

    //If the user selects to assign only 1 task
    if(request.getParameter("AssignTask") != null){
    //Get lists of different types of technicians based on their skill from db, to the bean
    getDesigners(bean);
    getEditors(bean);
    getAdmins(bean);
    //Set the task type selected and the ID of the current book
    bean.setChooseTaskStatus(taskstatus);
    bean.setBookID(setbookID);
    if(taskstatus.equals("Design a Cover") || taskstatus.equals("Design a Promotion")){
    	gotoPage("/SelectDesTech.jsp", request, response);} //Dispatch to SelectTech.jsp
    else if(taskstatus.equals("Galley 1") || taskstatus.equals("Galley 2") || taskstatus.equals("Galley 3")){
	gotoPage("/SelectEdiTech.jsp", request, response);} //Dispatch to SelectTech.jsp
    else if(taskstatus.equals("Scanning") || taskstatus.equals("ISBN") || taskstatus.equals("Publish")){
   	 gotoPage("/SelectAdmTech.jsp", request, response);} //Dispatch to SelectTech.jsp
    } // end outer inner if
    //If the user selects to assign a task and then assign another parallel task for same book
   else if(request.getParameter("ParallelTask") != null){
    //Get lists of different types of technicians based on their skill from db, to the bean
    getDesigners(bean);
    getEditors(bean);
    getAdmins(bean);
    //Set the task selected and the ID of the selected book
    bean.setChooseTaskStatus(taskstatus);
    bean.setBookID(setbookID);
    gotoPage("/SelectTechParallel.jsp", request, response); //Dispatch to SelectTechParallel.jsp
    } // end outer else

    }// end main

    //Method to get the list of designers from db to the bean
private void getDesigners(maxapp.Shared bean) throws ServletException, IOException{
        String[][] designers;
        maxapp.DBI dbi = null;
try{
    dbi = new maxapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        // the dbi will fetch designer Techs and their count of current tasks
        designers= dbi.getDesigners();
        bean.setDesigners(designers);

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

//Method to get the list of editors from db to the bean
private void getEditors(maxapp.Shared bean) throws ServletException, IOException{
        String[][] editors;
        maxapp.DBI dbi = null;
try{
    dbi = new maxapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
         // the dbi will fetch editor Techs and their count of current tasks
        editors= dbi.getEditors();
        bean.setEditors(editors);

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

//Method to get the list of admins from db to the bean
private void getAdmins(maxapp.Shared bean) throws ServletException, IOException{
        String[][] admins;
        maxapp.DBI dbi = null;
try{
    dbi = new maxapp.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
         // the dbi will fetch admin Techs and their count of current tasks
        admins= dbi.getAdmins();
        bean.setAdmins(admins);

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
