package Group.OOP.Group.OOP.controller;

import Group.OOP.Group.OOP.dto.MonthSummary;
import Group.OOP.Group.OOP.dto.MonthSummaryRequest;
import Group.OOP.Group.OOP.service.MonthSummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/monthsummary")
//@CrossOrigin(origins = "http://localhost:5173")
@CrossOrigin(origins = "*")
public class MonthSummaryController {
    @Autowired
    private MonthSummaryService monthSummaryService;

    @PostMapping("/{id}")
    public MonthSummary getMonthSummary(@PathVariable Integer id ,  @RequestBody MonthSummaryRequest request) {
        return monthSummaryService.monthSummary(id,  request.getMonth(), request.getYear());
    }
}
