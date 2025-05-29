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
    <meta charset="UTF-8">
    <title>Patient List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .back-btn:hover {
            background-color: #5a6268;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            padding: 6px 10px;
            border-radius: 4px;
            font-size: 14px;
        }
        .edit-btn {
            background-color: #007bff;
            color: white;
        }
        .edit-btn:hover {
            background-color: #0056b3;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<h2>Patient Records</h2>

<a href="index.jsp" class="back-btn">← Back to Home</a>

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
            <a href="updatepatient.jsp?id=<%= p.getPatientID() %>" class="edit-btn">Edit</a>
            <a href="DeletePatientServlet?id=<%= p.getPatientID() %>" class="delete-btn"
               onclick="return confirm('Are you sure you want to delete this patient?');">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
