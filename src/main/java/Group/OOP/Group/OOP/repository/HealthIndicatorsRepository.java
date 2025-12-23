package Group.OOP.Group.OOP.repository;

import Group.OOP.Group.OOP.entity.HealthIndicators;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface HealthIndicatorsRepository extends JpaRepository<HealthIndicators, Integer> {
    @Query("select h from HealthIndicators h where h.userId = :userId")
    public List<HealthIndicators> getHealthIndicatorsById(Integer userId);

}
