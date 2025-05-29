package com.servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.HospitalDAO;
@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
		        
		        int id = Integer.parseInt(request.getParameter("id"));
		        HospitalDAO dao = new HospitalDAO();
		        dao.deletePatient(id); // implement this in DAO
		        
		        response.sendRedirect("index.jsp");
		    }

}
