package Group.OOP.Group.OOP.controller;


import Group.OOP.Group.OOP.entity.MedicalRecord;
import Group.OOP.Group.OOP.service.MedicalRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;
@RestController
@RequestMapping("/medicalrecord")

public class MedicalRecordController {

    @Autowired
    private MedicalRecordService medicalRecordService;

    @PostMapping("/create")
    public void MedicalRecord(@RequestBody MedicalRecord medicalRecord) {
        medicalRecordService.createMedicalRecord(medicalRecord);
    }

    @PostMapping("/up")
    public void MedicalRecordUp(@RequestBody MedicalRecord medicalRecord) {
        medicalRecordService.updateMedicalRecord(medicalRecord);
    }

    @GetMapping("/{id}")
    public List<MedicalRecord> getMedicalRecords(@PathVariable Integer id) {
        return medicalRecordService.listMedicalRecord(id);
    }

    @GetMapping("/delete/{id}")
    public void deleteMedicalRecord(@PathVariable Integer id) {
        medicalRecordService.deleteMedicalRecord(id);
    }

}
