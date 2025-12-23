package Group.OOP.Group.OOP.service;

import Group.OOP.Group.OOP.entity.DailyActivity;
import Group.OOP.Group.OOP.repository.DailyActivityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.Duration;

import java.time.LocalDate;
import java.util.List;

@Service
public class ActivityTime extends TimeCalculate{

    @Autowired
    private DailyActivityRepository dailyActivityRepository;

    @Override
    public float getTotalTimeByDay(Integer userId , LocalDate date){
        List<DailyActivity> listDA = dailyActivityRepository.getDailyActivitiesByIdAndDate(userId , date);
        float total = 0f;
        for (DailyActivity a : listDA) {
            if (a.getCaloriesBurned() != null) {
                float minutes = Duration.between(a.getStartTime(), a.getEndTime()).toMinutes();
                total += minutes;
            }
        }
        return total;
    }
}
