/******************************************************************************************

SelectTech.java

The purpose of this servlet is to process the selected book from the list
and generate a list of technicians and their task counts.

   + This servlet is invoked by ??
   + This servlet dispatches to ??

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

public class SelectTech extends SBTS.Control{
    protected DBI dbi;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the shared bean from session
    SBTS.Shared bean = (SBTS.Shared)session.getAttribute("shared");
    //get the taskstatus from request and the book ID
    String taskstatus = request.getParameter("Status");
    String setbookID = bean.getBookID();

    //if there has tasks remained wait to be assigned
    if(request.getParameter("AssignTask") != null){
    //get the roles from bean
    getDesigners(bean);
    getEditors(bean);
    getAdmins(bean);
    //set taskstatus
    bean.setChooseTaskStatus(taskstatus);
    bean.setBookID(setbookID);
    gotoPage("/SelectTech.jsp", request, response); //redirect the page to selectTech page
    }

    //is the parallelTask value in the request exist
    else if(request.getParameter("ParallelTask") != null){
    getDesigners(bean);
    getEditors(bean);
    getAdmins(bean);
    bean.setChooseTaskStatus(taskstatus);
    bean.setBookID(setbookID);
    gotoPage("/SelectTechParallel.jsp", request, response); //redirect the page to select parallel tech page
    }

    }

    //method to get all deisgner from the database
    private void getDesigners(SBTS.Shared bean) throws ServletException, IOException{
        String[][] designers;
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        // Check if there is a database connection to Tomcat
        if(dbi.connect()){
        // if connected, get the designers
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

//Method to
private void getEditors(SBTS.Shared bean) throws ServletException, IOException{
        String[][] editors;
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        //if yes, get the editors from database
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

//Method
private void getAdmins(SBTS.Shared bean) throws ServletException, IOException{
        String[][] admins;
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
        //if connected, get the admins from database
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
