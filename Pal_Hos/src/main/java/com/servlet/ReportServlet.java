package com.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.HospitalDAO;
import com.model.Patient;
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	        String reportType = (String) request.getAttribute("reportType");
	        HospitalDAO dao = new HospitalDAO();
	        List<Patient> result = new ArrayList<>();

	        switch (reportType) {
	            case "date":
	                String fromDate = (String) request.getAttribute("fromDate");
	                String toDate = (String) request.getAttribute("toDate");
	                result = dao.getPatientsByDateRange(fromDate, toDate);
	                break;
	            case "ailment":
	                String ailment = (String) request.getAttribute("ailment");
	                result = dao.getPatientsByAilment(ailment);
	                break;
	            case "doctor":
	                String doctor = (String) request.getAttribute("doctor");
	                result = dao.getPatientsByDoctor(doctor);
	                break;
	        }

	        request.setAttribute("patients", result);
	        RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
	        rd.forward(request, response);
	    }

	    // optionally handle GET if needed
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	        doPost(request, response);
	    }
}
