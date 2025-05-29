# 🏥 Hospital Management System  
**Subject Name**: Advanced Java  
**Subject Code**: BCS613D  
**Name**: Samay Shetty  
**USN**: 4AL22CS143  
**Sem/Section**: VI/C  

A comprehensive web application for managing patient records, doctor assignments, and appointments, built using **JSP**, **Servlets**, and **MySQL**, following the **MVC architecture**.

---

## 🚀 Features

- **Patient Management**: Add, update, delete, and view patient records  
- **Doctor Assignment**: Assign doctors to patients based on ailments  
- **Appointment Scheduling**: Create, update, and view appointments  
- **Advanced Search**: Search patients by name, ID, ailment, or doctor  
- **Reports**: Generate filtered reports such as:
  - Patients admitted in a date range  
  - Patients by doctor  
  - Patients by ailment  
- **Validation**: Client-side and server-side validation for all forms  
- **Responsive UI**: Professional design with Bootstrap  
- **MVC Architecture**: Clear separation of data, business logic, and view  
- **Database Integration**: MySQL with JDBC for persistent storage  

---

## 📋 Prerequisites

- **Java Development Kit (JDK)** 8 or higher  
- **Apache Tomcat** 9.0 or higher  
- **MySQL Server** (or XAMPP)  
- **MySQL JDBC Driver** (`mysql-connector-java`)  
- **IDE**: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE  
- **Web Browser**: Chrome, Firefox, or Edge  

---

## 🛠️ Project Structure

HospitalWebApp/
├── src/
│ ├── dao/
│ │ ├── PatientDAO.java
│ │ ├── DoctorDAO.java
│ │ └── AppointmentDAO.java
│ ├── model/
│ │ ├── Patient.java
│ │ ├── Doctor.java
│ │ └── Appointment.java
│ └── servlet/
│ ├── AddPatientServlet.java
│ ├── UpdatePatientServlet.java
│ ├── DeletePatientServlet.java
│ ├── ViewPatientsServlet.java
│ ├── AssignDoctorServlet.java
│ ├── AppointmentServlet.java
│ └── ReportServlet.java
├── WebContent/
│ ├── index.jsp
│ ├── add_patient.jsp
│ ├── update_patient.jsp
│ ├── delete_patient.jsp
│ ├── view_patients.jsp
│ ├── assign_doctor.jsp
│ ├── appointments.jsp
│ ├── report_form.jsp
│ └── report_result.jsp
├── WEB-INF/
│ └── web.xml
└── README.md

## 🗄️ Database Setup

### 1. Create Database

```sql
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;
### 2. Create Tables
sql
Copy
Edit
CREATE TABLE IF NOT EXISTS Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    AdmissionDate DATE NOT NULL,
    Ailment VARCHAR(100),
    AssignedDoctor VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

### 3. Insert Sample Data
sql
Copy
Edit
INSERT INTO Patients VALUES
(1, 'Ananya Rao', 29, 'Female', '2025-05-10', 'Fever', 'Dr. Mehta'),
(2, 'Raghav Verma', 42, 'Male', '2025-05-12', 'Diabetes', 'Dr. Singh'),
(3, 'Leela Das', 34, 'Female', '2025-05-14', 'Migraine', 'Dr. Nair');

INSERT INTO Doctors VALUES
(101, 'Dr. Mehta', 'General Medicine'),
(102, 'Dr. Singh', 'Endocrinology'),
(103, 'Dr. Nair', 'Neurology');

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate) VALUES
(1, 101, '2025-05-15'),
(2, 102, '2025-05-16'),
(3, 103, '2025-05-17');

