package com.servlet;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet{
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {

		        String reportType = request.getParameter("reportType");

		        request.setAttribute("reportType", reportType);

		        if ("date".equals(reportType)) {
		            request.setAttribute("fromDate", request.getParameter("fromDate"));
		            request.setAttribute("toDate", request.getParameter("toDate"));
		        } else if ("ailment".equals(reportType)) {
		            request.setAttribute("ailment", request.getParameter("ailment"));
		        } else if ("doctor".equals(reportType)) {
		            request.setAttribute("doctor", request.getParameter("doctor"));
		        }

		        RequestDispatcher rd = request.getRequestDispatcher("ReportServlet");
		        rd.forward(request, response);
		    }

}
