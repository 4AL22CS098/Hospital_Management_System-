<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient</title>
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

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header-icon {
            font-size: 3rem;
            margin-bottom: 10px;
            color: #4a90e2;
        }

        h2 {
            color: #2c3e50;
            font-size: 2rem;
            font-weight: 300;
            margin-bottom: 10px;
            text-align: center;
        }

        .subtitle {
            color: #7f8c8d;
            font-size: 1rem;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            display: block;
            color: #2c3e50;
            font-weight: 500;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        input[type="text"],
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

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            outline: none;
            border-color: #4a90e2;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
            transform: translateY(-1px);
        }

        .gender-group {
            display: flex;
            gap: 15px;
            margin-top: 8px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }

        input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: #4a90e2;
            cursor: pointer;
        }

        .radio-option label {
            margin: 0;
            cursor: pointer;
            font-weight: 400;
        }

        .submit-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.3);
            margin-top: 20px;
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, #27ae60, #229954);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(46, 204, 113, 0.4);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #4a90e2;
            text-decoration: none;
            font-weight: 500;
            text-align: center;
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            background: rgba(74, 144, 226, 0.1);
            color: #357abd;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 30px 20px;
                margin: 10px;
            }

            h2 {
                font-size: 1.6rem;
            }

            .header-icon {
                font-size: 2.5rem;
            }
        }

        /* Floating label effect */
        .floating-label {
            position: relative;
        }

        .floating-label input {
            padding-top: 20px;
        }

        .floating-label label {
            position: absolute;
            top: 12px;
            left: 15px;
            transition: all 0.3s ease;
            pointer-events: none;
            color: #7f8c8d;
        }

        .floating-label input:focus + label,
        .floating-label input:not(:placeholder-shown) + label {
            top: -8px;
            left: 12px;
            font-size: 0.8rem;
            color: #4a90e2;
            background: white;
            padding: 0 5px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="header">
            <div class="header-icon">👨‍⚕️</div>
            <h2>Register New Patient</h2>
            <p class="subtitle">Enter patient information below</p>
        </div>

        <form action="AddPatientServlet" method="post">
            <div class="form-group">
                <label for="id">Patient ID</label>
                <input type="text" id="id" name="id" required />
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required />
            </div>

            <div class="form-group">
                <label for="age">Age</label>
                <input type="text" id="age" name="age" required />
            </div>

            <div class="form-group">
                <label>Gender</label>
                <div class="gender-group">
                    <div class="radio-option">
                        <input type="radio" id="male" name="gender" value="Male" required />
                        <label for="male">Male</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="female" name="gender" value="Female" required />
                        <label for="female">Female</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="other" name="gender" value="Other" required />
                        <label for="other">Other</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="admissionDate">Admission Date</label>
                <input type="date" id="admissionDate" name="admissionDate" required />
            </div>

            <div class="form-group">
                <label for="ailment">Medical Condition / Ailment</label>
                <input type="text" id="ailment" name="ailment" required />
            </div>

            <div class="form-group">
                <label for="doctor">Assigned Doctor</label>
                <input type="text" id="doctor" name="doctor" required />
            </div>

            <button type="submit" class="submit-btn">
                ➕ Add Patient to System
            </button>
        </form>

        <a href="index.jsp" class="back-link">← Back to Main Menu</a>
    </div>
</body>
</html>