package Group.OOP.Group.OOP.entity;

import jakarta.persistence.*;
import lombok.Data ;
import lombok.NoArgsConstructor ;
import lombok.AllArgsConstructor ;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "Medical_Record")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MedicalRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Record_ID")
    private Integer recordId;

    @Column(name = "User_ID")
    private Integer userId ;

    @Column(name = "Disease_Name" , length = 100)
    private String diseaseName ;

    @Column(name = "Disease_Type" , length = 100)
    private String diseaseType ;

    @Column(name = "Severity" , length = 50)
    private String severity ;

    @Column(name = "Status" , length = 50)
    private String status ;

    @Column(name = "Diagnosis_Date")
    private LocalDate diagnosisDate ;

    @Column(name = "End_Date")
    private LocalDate endDate ;

    @Column(name = "Notes" , length = 255)
    private String notes ;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUser(Integer userId) {
        this.userId = userId;
    }
    public String getDiseaseName() {
        return diseaseName;
    }

    public void setDiseaseName(String diseaseName) {
        this.diseaseName = diseaseName;
    }

    public String getDiseaseType() {
        return diseaseType;
    }

    public void setDiseaseType(String diseaseType) {
        this.diseaseType = diseaseType;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getDiagnosisDate() {
        return diagnosisDate;
    }

    public void setDiagnosisDate(LocalDate diagnosisDate) {
        this.diagnosisDate = diagnosisDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

}
