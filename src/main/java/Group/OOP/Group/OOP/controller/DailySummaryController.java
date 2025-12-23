package Group.OOP.Group.OOP.controller;

import Group.OOP.Group.OOP.entity.DailySummary;
import Group.OOP.Group.OOP.service.DailySummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@RestController
@RequestMapping("/dailysummary")
@CrossOrigin(origins = "*")
public class DailySummaryController {

    @Autowired
    DailySummaryService dailySummaryService;

    // lấy daily summary của 1 người trong 1 ngày
    @PostMapping("/{id}")
    public DailySummary getDailySummary(@PathVariable Integer id , @RequestBody LocalDate date) {
        return dailySummaryService.findFirstByUserIdAndDate(id , date) ;
    }
}
