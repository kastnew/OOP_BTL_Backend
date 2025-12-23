package Group.OOP.Group.OOP.service;


import Group.OOP.Group.OOP.repository.UserRepository;
import Group.OOP.Group.OOP.entity.HealthIndicators;
import Group.OOP.Group.OOP.repository.HealthIndicatorsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HealthIndicatorsService {

    @Autowired
    HealthIndicatorsRepository healthIncatorsRepository;

    @Autowired
    UserRepository userRepository;

    // them thong tin
    public HealthIndicators createHealthIncators(HealthIndicators newHealthIndicators) {
        return  healthIncatorsRepository.save(newHealthIndicators);
    }

    // lay thong tin 1 user
    public List<HealthIndicators> findAllHealthIncators(Integer userId) {
        return healthIncatorsRepository.getHealthIndicatorsById(userId);
    }

    // update thong tin
    public HealthIndicators updateHealthIncators(HealthIndicators healthIndicators) {
        return  healthIncatorsRepository.save(healthIndicators);
    }

    // xoa thong tin
    public void  deleteHealthIncators(Integer indicatorId) {
        healthIncatorsRepository.deleteById(indicatorId);
    }
}
