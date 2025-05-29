<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Patient" %>
<%@ page import="com.dao.HospitalDAO" %>
<%
HospitalDAO dao = new HospitalDAO();
List<Patient> patientList = dao.getAllPatients();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Records - Hospital Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header-icon {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .header h1 {
            font-size: 2.2rem;
            font-weight: 300;
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .stats-bar {
            background: rgba(155, 89, 182, 0.1);
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .patient-count {
            font-size: 1.1rem;
            color: #2c3e50;
            font-weight: 600;
        }

        .search-container {
            position: relative;
        }

        .search-input {
            padding: 10px 40px 10px 15px;
            border: 2px solid #e0e6ed;
            border-radius: 25px;
            font-size: 0.95rem;
            width: 300px;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: #9b59b6;
            box-shadow: 0 0 0 3px rgba(155, 89, 182, 0.1);
        }

        .search-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #7f8c8d;
        }

        .table-container {
            padding: 30px;
            overflow-x: auto;
        }

        .patient-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .patient-table th {
            background: linear-gradient(135deg, #34495e, #2c3e50);
            color: white;
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .patient-table td {
            padding: 15px;
            border-bottom: 1px solid #ecf0f1;
            vertical-align: middle;
            font-size: 0.95rem;
        }

        .patient-table tbody tr {
            transition: all 0.3s ease;
        }

        .patient-table tbody tr:hover {
            background: rgba(155, 89, 182, 0.05);
            transform: translateY(-1px);
        }

        .patient-table tbody tr:nth-child(even) {
            background: rgba(0, 0, 0, 0.02);
        }

        .patient-id {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-block;
        }

        .patient-name {
            font-weight: 600;
            color: #2c3e50;
        }

        .gender-badge {
            padding: 4px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: uppercase;
        }

        .gender-male {
            background: rgba(52, 152, 219, 0.2);
            color: #2980b9;
        }

        .gender-female {
            background: rgba(231, 76, 60, 0.2);
            color: #c0392b;
        }

        .gender-other {
            background: rgba(155, 89, 182, 0.2);
            color: #8e44ad;
        }

        .ailment-cell {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .doctor-name {
            color: #27ae60;
            font-weight: 500;
        }

        .actions-cell {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .edit-btn {
            background: linear-gradient(135deg, #f39c12, #e67e22);
            color: white;
        }

        .edit-btn:hover {
            background: linear-gradient(135deg, #e67e22, #d35400);
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(243, 156, 18, 0.3);
        }

        .delete-btn {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
        }

        .delete-btn:hover {
            background: linear-gradient(135deg, #c0392b, #a93226);
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }

        .view-btn {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
        }

        .view-btn:hover {
            background: linear-gradient(135deg, #2980b9, #1f4e79);
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        .back-link {
            display: inline-block;
            margin: 20px 30px;
            padding: 12px 25px;
            background: linear-gradient(135deg, #4a90e2, #357abd);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            background: linear-gradient(135deg, #357abd, #2c5aa0);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(74, 144, 226, 0.3);
        }

        .no-patients {
            text-align: center;
            padding: 60px 30px;
            color: #7f8c8d;
        }

        .no-patients-icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 15px;
            }

            .stats-bar {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .search-input {
                width: 100%;
                max-width: 300px;
            }

            .table-container {
                padding: 15px;
            }

            .patient-table {
                font-size: 0.85rem;
            }

            .patient-table th,
            .patient-table td {
                padding: 10px 8px;
            }

            .actions-cell {
                flex-direction: column;
                gap: 5px;
            }

            .action-btn {
                font-size: 0.8rem;
                padding: 6px 12px;
            }
        }

        /* Loading animation */
        .loading {
            display: none;
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
        }

        .spinner {
            border: 3px solid #f3f3f3;
            border-top: 3px solid #9b59b6;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-icon">👥</div>
            <h1>Patient Records</h1>
            <p class="subtitle">Comprehensive patient information management</p>
        </div>

        <div class="stats-bar">
            <div class="patient-count">
                Total Patients: <strong><%= patientList.size() %></strong>
            </div>
            <div class="search-container">
                <input type="text" class="search-input" id="searchInput" placeholder="Search patients...">
                <span class="search-icon">🔍</span>
            </div>
        </div>

        <div class="table-container">
            <% if (patientList.isEmpty()) { %>
                <div class="no-patients">
                    <div class="no-patients-icon">🏥</div>
                    <h3>No patients found</h3>
                    <p>Start by adding new patients to the system.</p>
                </div>
            <% } else { %>
                <table class="patient-table" id="patientTable">
                    <thead>
                        <tr>
                            <th>Patient ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Admission Date</th>
                            <th>Medical Condition</th>
                            <th>Assigned Doctor</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Patient p : patientList) { %>
                            <tr class="patient-row">
                                <td><span class="patient-id"><%= p.getPatientID() %></span></td>
                                <td class="patient-name"><%= p.getPatientName() %></td>
                                <td><%= p.getAge() %> years</td>
                                <td>
                                    <span class="gender-badge gender-<%= p.getGender().toLowerCase() %>">
                                        <%= p.getGender() %>
                                    </span>
                                </td>
                                <td><%= p.getAdmissionDate() %></td>
                                <td class="ailment-cell" title="<%= p.getAilment() %>">
                                    <%= p.getAilment() %>
                                </td>
                                <td class="doctor-name">Dr. <%= p.getAssignedDoctor() %></td>
                                <td class="actions-cell">
                                    
              
                                    <a href="updatepatient.jsp?id=<%= p.getPatientID() %>" class="action-btn edit-btn">
                                        ✏️ Edit
                                    </a>
                                    
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>

        <a href="index.jsp" class="back-link">← Back to Main Menu</a>
    </div>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('.patient-row');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
            
            // Update visible count
            const visibleRows = document.querySelectorAll('.patient-row[style=""], .patient-row:not([style])');
            const countElement = document.querySelector('.patient-count strong');
            if (countElement) {
                countElement.textContent = visibleRows.length;
            }
        });

        // Add confirmation for delete actions
        document.querySelectorAll('.delete-btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                const patientName = this.closest('tr').querySelector('.patient-name').textContent;
                const confirmed = confirm(`Are you sure you want to delete the record for ${patientName}?`);
                if (!confirmed) {
                    e.preventDefault();
                }
            });
        });

        // Add tooltips for long ailment text
        document.querySelectorAll('.ailment-cell').forEach(cell => {
            if (cell.scrollWidth > cell.clientWidth) {
                cell.style.cursor = 'pointer';
                cell.addEventListener('click', function() {
                    alert('Medical Condition: ' + this.title);
                });
            }
        });

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            // Add loading animation if needed
            console.log('Patient records loaded successfully');
            
            // Focus search input for better UX
            document.getElementById('searchInput').focus();
        });
    </script>
</body>
</html>