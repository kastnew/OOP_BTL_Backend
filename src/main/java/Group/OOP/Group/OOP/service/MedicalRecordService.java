package Group.OOP.Group.OOP.service;


import Group.OOP.Group.OOP.entity.MedicalRecord;
import Group.OOP.Group.OOP.repository.MedicalRecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicalRecordService {
    @Autowired
    private MedicalRecordRepository medicalRecordRepository;

    public MedicalRecord createMedicalRecord(MedicalRecord medicalRecord) {
        return medicalRecordRepository.save(medicalRecord);
    }

    public MedicalRecord updateMedicalRecord(MedicalRecord medicalRecord) {
        return medicalRecordRepository.save(medicalRecord);
    }

    public List<MedicalRecord> listMedicalRecord(Integer userId) {
        return medicalRecordRepository.getMedicalRecordByIds(userId);
    }

    public void deleteMedicalRecord(Integer recordId) {
        medicalRecordRepository.deleteById(recordId);
    }
}
