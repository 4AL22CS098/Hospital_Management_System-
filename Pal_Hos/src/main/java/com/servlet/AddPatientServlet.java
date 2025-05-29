package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Patient p = new Patient();
	        p.setPatientID(Integer.parseInt(request.getParameter("id")));
	        p.setPatientName(request.getParameter("name"));
	        p.setAge(Integer.parseInt(request.getParameter("age")));
	        p.setGender(request.getParameter("gender"));
	        p.setAdmissionDate(request.getParameter("admissionDate"));
	        p.setAilment(request.getParameter("ailment"));
	        p.setAssignedDoctor(request.getParameter("doctor"));

	        HospitalDAO dao = new HospitalDAO();
	        boolean success = dao.addPatient(p);

	        if (success) {
	            response.sendRedirect("DisplayPatientsServlet"); // NOT patientdisplay.jsp
	        } else {
	            response.getWriter().println("Failed to add patient.");
	        }
	    }
}
