// /******************************************************************************************
//
// EditTask.java
//
// The purpose of this servlet is to get the tasks that is assigned to a specific book.
//
//    + This servlet is invoked by ViewTechTaskList.jsp
//    + This servlet dispatches to EditTask.jsp
//
// ******************************************************************************************/
// package maxapp;
// import java.io.*;
// import javax.servlet.*;
// import javax.servlet.http.*;
// import java.sql.*;
// import javax.sql.*;
// import maxapp.DBI;
// import maxapp.Control;
// import maxapp.Shared;
//
// //ViewTaskDetails inherits methods and classes from maxapp.Control
//
// public class EditTask extends maxapp.Control{
//
// //Enables the client to send data/information to the web server
//     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//         //Ensures that the current session is still valid.
//         HttpSession session = request.getSession(true);
//         //Gets the bean from session and retrieves shared data
//         maxapp.Shared bean = (maxapp.Shared)session.getAttribute("shared");
//
//
//         //Variable SelectedBook is a matrix that holds values from getShepherdBookList method
//         String [][] TechTaskList = bean.getTechTaskList();
//         int RowIndex = Integer.parseInt(request.getParameter("RowIndex"));
//         String [] SingleTaskInfo = TechTaskList[RowIndex];
//
//         bean.setSingleTaskInfo(SingleTaskInfo);
//         gotoPage("/EditTask.jsp", request, response);
//
//     }
//
// }//End of Class
