<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Patient" %>
<%@ page import="com.dao.HospitalDAO" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    HospitalDAO dao = new HospitalDAO();
    Patient p = dao.getPatientById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Patient</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #83a4d4, #b6fbff);
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #444;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-link {
            display: inline-block;
            margin-top: 10px;
            text-align: center;
            width: 100%;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Patient Details</h2>
        <form action="UpdatePatientServlet" method="post">
            <input type="hidden" name="PatientID" value="<%= p.getPatientID() %>" />

            <label for="PatientName">Name</label>
            <input type="text" name="PatientName" value="<%= p.getPatientName() %>" required />

            <label for="Age">Age</label>
            <input type="number" name="Age" value="<%= p.getAge() %>" required />

            <label for="Gender">Gender</label>
            <input type="text" name="Gender" value="<%= p.getGender() %>" required />

            <label for="AdmissionDate">Admission Date</label>
            <input type="date" name="AdmissionDate" value="<%= p.getAdmissionDate() %>" required />

            <label for="Ailment">Ailment</label>
            <input type="text" name="Ailment" value="<%= p.getAilment() %>" required />

            <label for="AssignedDoctor">Assigned Doctor</label>
            <input type="text" name="AssignedDoctor" value="<%= p.getAssignedDoctor() %>" required />

            <input type="submit" value="Update Patient" />
        </form>
        <a class="back-link" href="viewPatients.jsp">← Back to Patient List</a>
    </div>
</body>
</html>
