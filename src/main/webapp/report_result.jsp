<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.model.Patient" %>
<html>
<head>
    <title>Report Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f8f9fa;
        }
        h2 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background: white;
            box-shadow: 2px 2px 10px #ccc;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .no-records {
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }
        .back-link, .print-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        .back-link:hover, .print-btn:hover {
            background-color: #5a6268;
        }
    </style>
    <script>
        function printPage() {
            window.print();
        }
    </script>
</head>
<body>

<h2>Report Results</h2>

<%
    List<Patient> patients = (List<Patient>) request.getAttribute("patients");
    if (patients != null && !patients.isEmpty()) {
%>
    <table>
        <tr>
            <th>Patient ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Admission Date</th>
            <th>Ailment</th>
            <th>Assigned Doctor</th>
        </tr>
        <%
            for (Patient p : patients) {
        %>
            <tr>
                <td><%= p.getPatientID() %></td>
                <td><%= p.getPatientName() %></td>
                <td><%= p.getAge() %></td>
                <td><%= p.getGender() %></td>
                <td><%= p.getAdmissionDate() %></td>
                <td><%= p.getAilment() %></td>
                <td><%= p.getAssignedDoctor() %></td>
            </tr>
        <%
            }
        %>
    </table>
<%
    } else {
%>
    <div class="no-records">No records found for the selected criteria.</div>
<%
    }
%>

<!-- Buttons -->
<a href="report_form.jsp" class="back-link">← Back to Report Form</a>
<a href="#" class="print-btn" onclick="printPage()">🖨️ Print</a>

</body>
</html>
