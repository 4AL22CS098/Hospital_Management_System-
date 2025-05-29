<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Patient" %>
<%@ page import="com.dao.HospitalDAO" %>
<%
    HospitalDAO dao = new HospitalDAO();
    List<Patient> patientList = dao.getAllPatients();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Records</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            padding: 40px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            margin-right: 5px;
        }
        .edit-btn {
            background-color: #28a745;
            color: white;
        }
        .edit-btn:hover {
            background-color: #218838;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        .add-btn {
            display: inline-block;
            margin-bottom: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }
        .add-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h2>Patient List</h2>
    
    <a href="patientadd.jsp" class="add-btn">+ Add New Patient</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Admission Date</th>
            <th>Ailment</th>
            <th>Doctor</th>
            <th>Actions</th>
        </tr>
        <%
            for (Patient p : patientList) {
        %>
        <tr>
            <td><%= p.getPatientID() %></td>
            <td><%= p.getPatientName() %></td>
            <td><%= p.getAge() %></td>
            <td><%= p.getGender() %></td>
            <td><%= p.getAdmissionDate() %></td>
            <td><%= p.getAilment() %></td>
            <td><%= p.getAssignedDoctor() %></td>
            <td>
                <a href="edit.jsp?id=<%= p.getPatientID() %>" class="action-btn edit-btn">Edit</a>
                <a href="DeletePatientServlet?id=<%= p.getPatientID() %>" class="action-btn delete-btn" 
                   onclick="return confirm('Are you sure you want to delete this patient?');">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>
