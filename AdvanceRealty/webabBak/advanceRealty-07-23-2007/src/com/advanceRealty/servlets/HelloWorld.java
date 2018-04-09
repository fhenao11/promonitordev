package com.advanceRealty.servlets;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorld extends HttpServlet {
  private String greeting;

  public void init()
    throws ServletException
  {
    //greeting = getInitParameter("greeting");
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
    throws ServletException, IOException
  {
    PrintWriter out = response.getWriter();

    out.println("<title>Testing Servlet</title>");
    out.println("<h1>Hello World</h1>");
  }
  
  public void destroy()
  {
    // nothing to do
  }
}

