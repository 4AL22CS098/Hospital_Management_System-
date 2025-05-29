<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Patient" %>
<%@ page import="com.dao.HospitalDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    HospitalDAO dao = new HospitalDAO();
    Patient p = dao.getPatientById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Patient</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Same theme and style as Add Patient */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        h2 {
            color: #2c3e50;
            font-size: 2rem;
            font-weight: 300;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: #2c3e50;
            font-weight: 500;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e6ed;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #4a90e2;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
            transform: translateY(-1px);
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .submit-btn {
            flex: 1;
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.3);
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, #27ae60, #229954);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(46, 204, 113, 0.4);
        }

        .back-link {
            margin-left: 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 10px;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        .back-link:hover {
            background-color: #5a6268;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 1.6rem;
            }

            .btn-group {
                flex-direction: column;
                gap: 15px;
            }

            .back-link {
                margin-left: 0;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Patient Information</h2>
        <form action="UpdatePatientServlet" method="post">
            <input type="hidden" name="PatientID" value="<%= p.getPatientID() %>" />

            <div class="form-group">
                <label for="PatientName">Patient Name</label>
                <input type="text" id="PatientName" name="PatientName" value="<%= p.getPatientName() %>" required />
            </div>

            <div class="form-group">
                <label for="Age">Age</label>
                <input type="number" id="Age" name="Age" value="<%= p.getAge() %>" min="0" max="150" required />
            </div>

            <div class="form-group">
                <label for="Gender">Gender</label>
                <select id="Gender" name="Gender" required>
                    <option value="Male" <%= "Male".equals(p.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(p.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(p.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="AdmissionDate">Admission Date</label>
                <input type="date" id="AdmissionDate" name="AdmissionDate" value="<%= p.getAdmissionDate() %>" required />
            </div>

            <div class="form-group">
                <label for="Ailment">Ailment/Condition</label>
                <input type="text" id="Ailment" name="Ailment" value="<%= p.getAilment() %>" required />
            </div>

            <div class="form-group">
                <label for="AssignedDoctor">Assigned Doctor</label>
                <input type="text" id="AssignedDoctor" name="AssignedDoctor" value="<%= p.getAssignedDoctor() %>" required />
            </div>

            <div class="btn-group">
                <a href="viewPatients.jsp" class="back-link">← Cancel</a>
                <input type="submit" value="Update Patient Information" class="submit-btn" />
            </div>
        </form>
    </div>
</body>
</html>
