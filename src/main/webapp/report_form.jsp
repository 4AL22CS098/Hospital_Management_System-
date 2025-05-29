<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Generate Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background: #f2f2f2;
        }
        h2 {
            color: #333;
        }
        .form-section {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px #ccc;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="date"], select {
            width: 300px;
            padding: 8px;
            margin-top: 5px;
        }
        input[type="submit"] {
            margin-top: 15px;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
    </style>
</head>
<body>

<h2>Generate Report</h2>

<!-- Report by Date Range -->
<div class="form-section">
    <form action="ReportCriteriaServlet" method="post">
        <input type="hidden" name="reportType" value="date"/>
        <label for="fromDate">From Date:</label>
        <input type="date" name="fromDate" required/>

        <label for="toDate">To Date:</label>
        <input type="date" name="toDate" required/>

        <input type="submit" value="Generate Report by Date Range"/>
    </form>
</div>

<!-- Report by Ailment -->
<div class="form-section">
    <form action="ReportCriteriaServlet" method="post">
        <input type="hidden" name="reportType" value="ailment"/>
        <label for="ailment">Ailment:</label>
        <input type="text" name="ailment" placeholder="e.g. Fever, Diabetes" required/>

        <input type="submit" value="Generate Report by Ailment"/>
    </form>
</div>

<!-- Report by Assigned Doctor -->
<div class="form-section">
    <form action="ReportCriteriaServlet" method="post">
        <input type="hidden" name="reportType" value="doctor"/>
        <label for="doctor">Assigned Doctor:</label>
        <input type="text" name="doctor" placeholder="e.g. Dr. Sharma" required/>

        <input type="submit" value="Generate Report by Doctor"/>
    </form>
</div>

</body>
</html>
