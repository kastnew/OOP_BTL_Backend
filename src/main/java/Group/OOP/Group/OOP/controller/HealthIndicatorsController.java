package Group.OOP.Group.OOP.controller;

import Group.OOP.Group.OOP.entity.HealthIndicators;
import Group.OOP.Group.OOP.service.HealthIndicatorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;
@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/healthincators")
public class HealthIndicatorsController {

    @Autowired
    HealthIndicatorsService healthIndicatorsService;

    @PostMapping("/create")
    public void create(@RequestBody HealthIndicators healthIndicators){
        healthIndicatorsService.createHealthIncators(healthIndicators);
    }

    @GetMapping("/{id}")
    public List<HealthIndicators> getHealthIndicators(@PathVariable Integer id){
        return healthIndicatorsService.findAllHealthIncators(id);
    }

    @PostMapping("up")
    public void up(@RequestBody HealthIndicators healthIndicators){
        healthIndicatorsService.updateHealthIncators(healthIndicators);
    }

    @GetMapping("/delete/{id}")
    public void delete(@PathVariable Integer id){
        healthIndicatorsService.deleteHealthIncators(id);
    }
}

