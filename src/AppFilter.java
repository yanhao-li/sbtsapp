/******************************************************************************************

AppFilter.java

The purpose of this servlet is to filter each request/response ensuring that a valid session
still exists. If the user tries to submit data or go to a page while using an invalid session
then the user will be immediately redirected to the login page for your web app.

******************************************************************************************/

//Import statements are located on top, which is standard.


package maxapp;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppFilter implements Filter
{
   //The path to access your files on eve
   public static String contextPath = "MAXAPP"; // ********MAKE SURE TO CHANGE THIS TO MAXAPP, WHICH IS OUR SERVER NAME*******


   /* doFilter() is the main driver of this java program.
   It examines the request, and its parameters.
   It then checks if the session already exists from where the request is coming from, it constinues doing what it's supposed to do.
   Else, the user is redirected to the login page.
   */
   public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException
   {
      HttpServletRequest request = (HttpServletRequest) req;
      HttpServletResponse response = (HttpServletResponse) res;
      String requestURI = request.getRequestURI();

      if((((HttpServletRequest)request).getSession(false)==null) && (!requestURI.startsWith("/"+contextPath+"/Login")))
      
      {
         // the session has expired (or does not exist) and the user is not on the login page.
         ((HttpServletResponse)response).sendRedirect("/"+contextPath+"/Login");
      }
      else // continue doing what you normally would
      {
         chain.doFilter(request,response);
      }

   }

   //This method is called by the web container to indicate to a filter that it is being placed into service.

   public void init(FilterConfig config) throws ServletException
   {
       // add init code if needed
       // example: String testParam = config.getInitParameter("test-param");

      // an example of this in action: https://www.tutorialspoint.com/servlets/servlets-writing-filters.htm
   }
   public void destroy()
   {
        //add code to release any resource if needed
   }
}
