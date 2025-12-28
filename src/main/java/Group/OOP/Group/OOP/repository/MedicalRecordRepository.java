package Group.OOP.Group.OOP.repository;


import Group.OOP.Group.OOP.entity.MedicalRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MedicalRecordRepository extends JpaRepository<MedicalRecord, Integer>{
    @Query("select m from MedicalRecord m where m.userId = :userId")
    public List<MedicalRecord> getMedicalRecordByIds(Integer userId);
}


