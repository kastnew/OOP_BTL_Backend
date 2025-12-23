package Group.OOP.Group.OOP.repository;


import Group.OOP.Group.OOP.entity.Sleep;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface SleepRepository extends JpaRepository<Sleep, Integer> {
    @Query("select s from Sleep s where s.userId = :userId")
    public List<Sleep> getSleepByUserId(Integer userId);

    @Query("select s from Sleep s where s.userId = :userId and s.sleepDate =:date")
    public List<Sleep> getSleepByUserIdAndDate(Integer userId , LocalDate date);
}
