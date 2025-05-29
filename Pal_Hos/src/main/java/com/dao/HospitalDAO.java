package com.dao;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.model.Patient;

public class HospitalDAO {
	private Connection conn;

	public HospitalDAO() {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalDB", "root", "");

	        if (conn == null) {
	            System.err.println("Database connection failed: conn is null.");
	            throw new RuntimeException("Database connection failed!");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new RuntimeException("Failed to initialize DB connection: " + e.getMessage());
	    }
	}


    public boolean addPatient(Patient p) {
        String sql = "INSERT INTO Patients VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, p.getPatientID());
            ps.setString(2, p.getPatientName());
            ps.setInt(3, p.getAge());
            ps.setString(4, p.getGender());
            ps.setDate(5, Date.valueOf(p.getAdmissionDate()));
            ps.setString(6, p.getAilment());
            ps.setString(7, p.getAssignedDoctor());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Patient> getAllPatients() {
        List<Patient> list = new ArrayList<>();
        String sql = "SELECT * FROM Patients";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Patient p = new Patient();
                p.setPatientID(rs.getInt("PatientID"));
                p.setPatientName(rs.getString("PatientName"));
                p.setAge(rs.getInt("Age"));
                p.setGender(rs.getString("Gender"));
                p.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                p.setAilment(rs.getString("Ailment"));
                p.setAssignedDoctor(rs.getString("AssignedDoctor"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Patient getPatientById(int id) {
        Patient patient = null;
        String sql = "SELECT * FROM Patients WHERE PatientID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                patient = new Patient();
                patient.setPatientID(rs.getInt("PatientID"));
                patient.setPatientName(rs.getString("PatientName"));
                patient.setAge(rs.getInt("Age"));
                patient.setGender(rs.getString("Gender"));
                patient.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                patient.setAilment(rs.getString("Ailment"));
                patient.setAssignedDoctor(rs.getString("AssignedDoctor"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patient;
    }

    // ✅ Update Patient
    public boolean updatePatient(Patient p) {
        String sql = "UPDATE Patients SET PatientName=?, Age=?, Gender=?, AdmissionDate=?, Ailment=?, AssignedDoctor=? WHERE PatientID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getPatientName());
            ps.setInt(2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setDate(4, Date.valueOf(p.getAdmissionDate()));
            ps.setString(5, p.getAilment());
            ps.setString(6, p.getAssignedDoctor());
            ps.setInt(7, p.getPatientID());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
        
    }
    public void deletePatient(int id) {
        try {
         //   Connection conn = getConnection();
            String query = "DELETE FROM patients WHERE PatientID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
 // Get patients assigned to a specific doctor
    public List<Patient> getPatientsByDoctor(String doctor) {
        List<Patient> list = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM Patients WHERE AssignedDoctor LIKE ?")) {
            stmt.setString(1, "%" + doctor + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapRowToPatient(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Patient> getPatientsByAilment(String ailment) {
        List<Patient> list = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM Patients WHERE Ailment LIKE ?")) {
            stmt.setString(1, "%" + ailment + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapRowToPatient(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Patient> getPatientsByDateRange(String fromDate, String toDate) {
        List<Patient> list = new ArrayList<>();
        String sql = "SELECT * FROM Patients WHERE AdmissionDate BETWEEN ? AND ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            if (fromDate != null && toDate != null) {
                stmt.setDate(1, java.sql.Date.valueOf(fromDate));
                stmt.setDate(2, java.sql.Date.valueOf(toDate));
            } else {
                throw new IllegalArgumentException("Date values cannot be null");
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapRowToPatient(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    private Patient mapRowToPatient(ResultSet rs) throws SQLException {
        Patient p = new Patient();
        p.setPatientID(rs.getInt("PatientID"));
        p.setPatientName(rs.getString("PatientName"));
        p.setAge(rs.getInt("Age"));
        p.setGender(rs.getString("Gender"));

        // Convert java.sql.Date to String
        java.sql.Date sqlDate = rs.getDate("AdmissionDate");
        p.setAdmissionDate(sqlDate != null ? sqlDate.toString() : null);

        p.setAilment(rs.getString("Ailment"));
        p.setAssignedDoctor(rs.getString("AssignedDoctor"));
        return p;
    }



}
