package com.servlet;


import com.dao.HospitalDAO;
import com.model.Patient;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

		 int patientID = Integer.parseInt(request.getParameter("PatientID"));
	        String patientName = request.getParameter("PatientName");
	        int age = Integer.parseInt(request.getParameter("Age"));
	        String gender = request.getParameter("Gender");
	        String admissionDate = request.getParameter("AdmissionDate");
	        String ailment = request.getParameter("Ailment");
	        String assignedDoctor = request.getParameter("AssignedDoctor");

	        Patient p = new Patient();
	        p.setPatientID(patientID);
	        p.setPatientName(patientName);
	        p.setAge(age);
	        p.setGender(gender);
	        p.setAdmissionDate(admissionDate);
	        p.setAilment(ailment);
	        p.setAssignedDoctor(assignedDoctor);

	        HospitalDAO dao = new HospitalDAO();
	        dao.updatePatient(p);

	        System.out.println("✅ Patient updated: " + patientID);
	        response.sendRedirect("index.jsp");

	    }
}
