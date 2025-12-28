package Group.OOP.Group.OOP.entity;

import jakarta.persistence.* ;
import lombok.Data ;
import lombok.AllArgsConstructor ;
import lombok.NoArgsConstructor ;
import org.springframework.cglib.core.Local;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Sleep {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Sleep_ID")
    private Integer sleepId;

    @Column(name = "User_ID")
    private Integer userId;

    @Column(name = "Sleep_Time")
    private LocalDateTime sleepTime;

    @Column(name = "Wake_Time")
    private LocalDateTime wakeTime;

    @Column(name = "Sleep_Type", length = 50)
    private String sleepType;

    @Column(name = "Sleep_Quality", length = 50)
    private String sleepQuality;

    @Column(name = "Sleep_Date")
    private LocalDate sleepDate;

    public Integer getSleepId() {
        return sleepId;
    }

    public void setSleepId(Integer sleepId) {
        this.sleepId = sleepId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public LocalDateTime getSleepTime() {
        return sleepTime;
    }

    public void setSleepTime(LocalDateTime sleepTime) {
        this.sleepTime = sleepTime;
    }

    public LocalDateTime getWakeTime() {
        return wakeTime;
    }

    public void setWakeTime(LocalDateTime wakeTime) {
        this.wakeTime = wakeTime;
    }

    public String getSleepType() {
        return sleepType;
    }

    public void setSleepType(String sleepType) {
        this.sleepType = sleepType;
    }

    public String getSleepQuality() {
        return sleepQuality;
    }

    public void setSleepQuality(String sleepQuality) {
        this.sleepQuality = sleepQuality;
    }

    public LocalDate getSleepDate() {
        return sleepDate;
    }

    public void setSleepDate(LocalDate sleepDate) {
        this.sleepDate = sleepDate;
    }

}
