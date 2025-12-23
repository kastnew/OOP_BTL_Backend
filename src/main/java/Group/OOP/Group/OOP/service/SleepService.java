package Group.OOP.Group.OOP.service;

import Group.OOP.Group.OOP.entity.DailySummary;
import Group.OOP.Group.OOP.entity.Sleep;
import Group.OOP.Group.OOP.repository.DailySummaryRepository;
import Group.OOP.Group.OOP.repository.SleepRepository;
import Group.OOP.Group.OOP.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class SleepService {
    @Autowired
    private SleepRepository sleepRepository ;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RestTime restTime;

    @Autowired
    private DailySummaryRepository dailySummaryRepository;

    // them giac ngu
    public Sleep createSleep(Sleep new_sleep) {
         sleepRepository.save(new_sleep) ;

        DailySummary dailySummary = dailySummaryRepository.getDailySummaryByIdAndDate(new_sleep.getUserId(), new_sleep.getSleepDate());
        if(dailySummary == null) {
            dailySummary = new DailySummary();
            dailySummary.setUserId(new_sleep.getUserId());
            dailySummary.setDate(new_sleep.getSleepDate());
        }
        float totalTime = restTime.getTotalTimeByDay(new_sleep.getUserId(),  new_sleep.getSleepDate());
        dailySummary.setTotalRestTime(totalTime);
        dailySummaryRepository.save(dailySummary);
        return new_sleep;
    }

    // lấy thông tin giấc ngủ của 1 người trong 1 ngày
    public List<Sleep> ListSleep(Integer userId) {
        return sleepRepository.getSleepByUserId(userId) ;
    }
    // update
    public Sleep updateSleep(Sleep new_sleep) {
        sleepRepository.save(new_sleep) ;

        DailySummary dailySummary = dailySummaryRepository.getDailySummaryByIdAndDate(new_sleep.getUserId(), new_sleep.getSleepDate());
        if(dailySummary == null) {
            dailySummary = new DailySummary();
            dailySummary.setUserId(new_sleep.getUserId());
            dailySummary.setDate(new_sleep.getSleepDate());
        }
        float totalTime = restTime.getTotalTimeByDay(new_sleep.getUserId(),  new_sleep.getSleepDate());
        dailySummary.setTotalRestTime(totalTime);
        dailySummaryRepository.save(dailySummary);
        return new_sleep;
    }

    // delete
    public void deleteSleep(Integer sleepId) {
        Optional<Sleep> tmp = sleepRepository.findById(sleepId);
        Sleep sleep = tmp.get();

        Integer userId = sleep.getUserId();
        LocalDate date = sleep.getSleepDate();

        DailySummary dailySummary = dailySummaryRepository.getDailySummaryByIdAndDate(userId, date);
        sleepRepository.deleteById(sleepId) ;

        float totalTime = restTime.getTotalTimeByDay(userId,  date);
        dailySummary.setTotalRestTime(totalTime);
        dailySummaryRepository.save(dailySummary);
    }

}
