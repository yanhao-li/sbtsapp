/******************************************************************************************

SelectBook.java

The purpose of this is to program is to select a book and get its details through Shared.java.
  
   + This servlet dispatches to SelectBook.jsp
   
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

//because of extends, the SelectBook class inherits the fields and methods of SBTS control.

public class SelectBook extends SBTS.Control{
    //Enables the client to send data/information to the web server
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data 
    SBTS.Shared bean = (SBTS.Shared)session.getAttribute("shared");
    String [][] SelectedBook = bean.getShepherdBookList();
    int BookID = Integer.parseInt(request.getParameter("BookID"));
    String setbookID = SelectedBook[BookID][0];
//sets the values of bean

    bean.setBookID(setbookID); 
    bean.setError(setbookID);

//calls the method getSelectedBook with arguments bean, and setbookID
    getSelectedBook(bean, setbookID);

//dispaches to selectbook.jsp
    gotoPage("/SelectBook.jsp", request, response);
    
    }
   
  /* 
   private void setContractID(SBTS.Shared bean, String id) throws ServletException, IOException{
    SBTS.DBI dbi = new SBTS.DBI();
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){
            
        bean.setContractID(id);
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
*/
    
private void getSelectedBook(SBTS.Shared bean, String BookID) throws ServletException, IOException{

    //variable matrix for selected book
        String[][] selectedbook;
        SBTS.DBI dbi = null;
try{
    dbi = new SBTS.DBI();
        //Check if there is a database connection to Tomcat
        if(dbi.connect()){

        // The BookID is obtained via getSelectedBook, with bookID as a parameter. 
        //this value is then set to the bean via setselectedbook.
        selectedbook = dbi.getSelectedBook(BookID);
        bean.setSelectedBook(selectedbook);
        } 
}


//Error has been detected, and will be displayed.
catch(Exception e){
    e.printStackTrace();
    bean.setError("Servlet Exception error" +e);
}

finally{
      dbi.close();//Close connection to database
}
}
}//End of Class 
 