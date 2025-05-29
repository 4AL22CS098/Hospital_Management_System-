<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>

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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header {
            margin-bottom: 40px;
        }

        .logo {
            font-size: 3rem;
            margin-bottom: 10px;
            color: #4a90e2;
        }

        h1 {
            color: #2c3e50;
            font-size: 2.2rem;
            font-weight: 300;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }

        .subtitle {
            color: #7f8c8d;
            font-size: 1.1rem;
            font-weight: 300;
        }

        .menu {
            display: grid;
            gap: 15px;
            margin-top: 30px;
        }

        .menu a {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            padding: 18px 25px;
            text-decoration: none;
            background: linear-gradient(135deg, #4a90e2, #357abd);
            color: white;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 500;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: none;
            box-shadow: 0 4px 15px rgba(74, 144, 226, 0.3);
            position: relative;
            overflow: hidden;
        }

        .menu a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .menu a:hover::before {
            left: 100%;
        }

        .menu a:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(74, 144, 226, 0.4);
            background: linear-gradient(135deg, #357abd, #2c5aa0);
        }

        .menu a:active {
            transform: translateY(0);
        }

        .icon {
            font-size: 1.3rem;
        }

        /* Specific colors for different actions */
        .add-patient {
            background: linear-gradient(135deg, #2ecc71, #27ae60) !important;
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.3) !important;
        }

        .add-patient:hover {
            background: linear-gradient(135deg, #27ae60, #229954) !important;
            box-shadow: 0 8px 25px rgba(46, 204, 113, 0.4) !important;
        }

        .update-patient {
            background: linear-gradient(135deg, #f39c12, #e67e22) !important;
            box-shadow: 0 4px 15px rgba(243, 156, 18, 0.3) !important;
        }

        .update-patient:hover {
            background: linear-gradient(135deg, #e67e22, #d35400) !important;
            box-shadow: 0 8px 25px rgba(243, 156, 18, 0.4) !important;
        }

        .delete-patient {
            background: linear-gradient(135deg, #e74c3c, #c0392b) !important;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3) !important;
        }

        .delete-patient:hover {
            background: linear-gradient(135deg, #c0392b, #a93226) !important;
            box-shadow: 0 8px 25px rgba(231, 76, 60, 0.4) !important;
        }

        .display-patients {
            background: linear-gradient(135deg, #9b59b6, #8e44ad) !important;
            box-shadow: 0 4px 15px rgba(155, 89, 182, 0.3) !important;
        }

        .display-patients:hover {
            background: linear-gradient(135deg, #8e44ad, #7d3c98) !important;
            box-shadow: 0 8px 25px rgba(155, 89, 182, 0.4) !important;
        }

        .generate-reports {
            background: linear-gradient(135deg, #1abc9c, #16a085) !important;
            box-shadow: 0 4px 15px rgba(26, 188, 156, 0.3) !important;
        }

        .generate-reports:hover {
            background: linear-gradient(135deg, #16a085, #138d75) !important;
            box-shadow: 0 8px 25px rgba(26, 188, 156, 0.4) !important;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }

            h1 {
                font-size: 1.8rem;
            }

            .menu a {
                padding: 15px 20px;
                font-size: 1rem;
            }

            .logo {
                font-size: 2.5rem;
            }
        }

        /* Pulse animation for logo */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .logo {
            animation: pulse 2s infinite;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">🏥</div>
            <h1>Hospital Management System</h1>
            <p class="subtitle">Comprehensive Patient Care Management</p>
        </div>

        <div class="menu">
            <a href="patientadd.jsp" class="add-patient">
                <span class="icon">➕</span>
                Add New Patient
            </a>
            <a href="updatetable.jsp" class="update-patient">
                <span class="icon">✏️</span>
                Update Patient Info
            </a>
            <a href="deletepatient.jsp" class="delete-patient">
                <span class="icon">🗑️</span>
                Remove Patient
            </a>
            <a href="patientdisplay.jsp" class="display-patients">
                <span class="icon">👥</span>
                View All Patients
            </a>
            <a href="report.jsp" class="generate-reports">
                <span class="icon">📊</span>
                Generate Reports
            </a>
        </div>
    </div>
</body>
</html>