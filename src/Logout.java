package maxapp;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.sql.*;
import maxapp.DBI;
import maxapp.Control;
import maxapp.Shared;

public class Logout extends maxapp.Control{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    //Get the current HTTP session from Tomcat
    HttpSession session = request.getSession(true);
    //Gets the bean from session and retrieves shared data
    maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
    //Empty the email address
    bean.setemailAddress("");
    //Invalidate the session and unbinds any object attached to it
    session.invalidate();
    this.gotoPage("/Control", request, response); //Dispatch to Control.java
    }
}//End of Class
