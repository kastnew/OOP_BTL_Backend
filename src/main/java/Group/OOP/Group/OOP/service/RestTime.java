package Group.OOP.Group.OOP.service;

import Group.OOP.Group.OOP.entity.Sleep;
import Group.OOP.Group.OOP.repository.SleepRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.Duration;

import java.time.LocalDate;
import java.util.List;

@Service
public class RestTime extends TimeCalculate{

    @Autowired
    private SleepRepository sleepRepository;

    @Override
    public float getTotalTimeByDay(Integer userId , LocalDate date){
        List<Sleep> listSl = sleepRepository.getSleepByUserIdAndDate(userId , date);
        float total = 0f;
        for (Sleep a : listSl) {
             {
                float minutes = Duration.between(a.getSleepTime(), a.getWakeTime()).toMinutes();
                total += minutes;
            }
        }
        return total;
    }
}
