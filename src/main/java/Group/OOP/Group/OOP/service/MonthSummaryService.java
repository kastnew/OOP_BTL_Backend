package Group.OOP.Group.OOP.service;

import Group.OOP.Group.OOP.dto.MonthSummary;
import Group.OOP.Group.OOP.entity.DailySummary;
import Group.OOP.Group.OOP.repository.DailySummaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MonthSummaryService {
    @Autowired
    DailySummaryRepository dailySummaryRepository;

    MonthSummaryService monthSummaryService;
    final float HIGH_SUGAR = 50f;    // g/ngày
    final float HIGH_FAT = 70f;      // g/ngày
    final float LOW_FIBER = 25f;     // g/ngày
    final float LOW_PROTEIN = 60f;

    public MonthSummary monthSummary(Integer userId , Integer month , Integer year) {
        List<DailySummary> monthSummaries = dailySummaryRepository.findByUserIdAndMonth(userId, month , year);

        Float avgCaloriesIn = 0.0f;
        Float avgCaloriesOut = 0.0f;
        Float avgProtein = 0.0f;
        Float avgFat = 0.0f;
        Float avgFiber = 0.0f;
        Float avgSugar = 0.0f;

        Integer daysCaloriesInMoreThanOut = 0;
        Integer daysHighSugar = 0;
        Integer daysHighFat = 0;
        Integer daysLowFiber = 0;
        Integer daysLowProtein = 0;

        Integer totalDays = 0;
        StringBuilder note = new StringBuilder();;

        for (DailySummary dailySummary : monthSummaries) {
            // Sử dụng Optional để tránh null
            Float caloriesConsumed = dailySummary.getCaloriesConsumed() != null ? dailySummary.getCaloriesConsumed() : 0.0f;
            Float caloriesBurned = dailySummary.getCaloriesBurned() != null ? dailySummary.getCaloriesBurned() : 0.0f;
            Float protein = dailySummary.getTotalProtein() != null ? dailySummary.getTotalProtein() : 0.0f;
            Float fat = dailySummary.getTotalFat() != null ? dailySummary.getTotalFat() : 0.0f;
            Float fiber = dailySummary.getTotalFiber() != null ? dailySummary.getTotalFiber() : 0.0f;
            Float sugar = dailySummary.getTotalSugar() != null ? dailySummary.getTotalSugar() : 0.0f;
            Float activityTime = dailySummary.getTotalActivityTime() != null ? dailySummary.getTotalActivityTime() : 0.0f;
            Float restTime = dailySummary.getTotalRestTime() != null ? dailySummary.getTotalRestTime() : 0.0f;
            Float rating = dailySummary.getRating() != null ? dailySummary.getRating() : 0.0f;

            // Kiểm tra xem có dữ liệu hay không
            boolean hasData = !(caloriesConsumed == 0.0f &&
                    caloriesBurned == 0.0f &&
                    protein == 0.0f &&
                    fat == 0.0f &&
                    fiber == 0.0f &&
                    sugar == 0.0f &&
                    activityTime == 0.0f &&
                    restTime == 0.0f &&
                    rating == 0.0f);

            if (hasData) {
                // Chỉ tính vào tổng số ngày nếu có dữ liệu
                totalDays++;

                // Cộng dồn để tính trung bình
                avgCaloriesIn += caloriesConsumed;
                avgCaloriesOut += caloriesBurned;
                avgProtein += protein;
                avgFat += fat;
                avgFiber += fiber;
                avgSugar += sugar;

                // Kiểm tra các điều kiện
                if (caloriesConsumed > caloriesBurned) {
                    daysCaloriesInMoreThanOut++;
                }
                if (sugar > HIGH_SUGAR) {
                    daysHighSugar++;
                }
                if (fat > HIGH_FAT) {
                    daysHighFat++;
                }
                if (fiber < LOW_FIBER) {
                    daysLowFiber++;
                }
                if (protein < LOW_PROTEIN) {
                    daysLowProtein++;
                }
            }
        }

        if(totalDays > 0) {
            avgCaloriesIn = avgCaloriesIn / totalDays;
            avgCaloriesOut = avgCaloriesOut / totalDays;
            avgProtein = avgProtein / totalDays;
            avgFat = avgFat / totalDays;
            avgFiber = avgFiber / totalDays;
            avgSugar = avgSugar / totalDays;
        }
        if(daysHighSugar >= 1){
            note.append("Tháng này bạn có một số ngày ăn đường vượt mức.\n");
            note.append("Nên ăn ít đường lại.\n");
        }
        else {
            note.append("Tháng này bạn tiêu thụ đường hợp lý.\n");
            note.append("Giữ mức tiêu thụ đường hoặc giảm đi.\n");
        }

        // ===== FAT =====
        if (daysHighFat >= 1) {
            note.append("Tháng này bạn có một số ngày tiêu thụ chất béo vượt mức.\n");
            note.append("Nên hạn chế đồ chiên rán, mỡ động vật và thức ăn nhanh.\n");
        } else {
            note.append("Tháng này bạn tiêu thụ chất béo ở mức hợp lý.\n");
            note.append("Hãy tiếp tục duy trì chế độ ăn hiện tại.\n");
        }

// ===== FIBER =====
        if (daysLowFiber >= 1) {
            note.append("Tháng này bạn có một số ngày thiếu chất xơ.\n");
            note.append("Nên bổ sung thêm rau xanh, trái cây và ngũ cốc nguyên hạt.\n");
        } else {
            note.append("Tháng này bạn cung cấp đủ chất xơ cho cơ thể.\n");
            note.append("Hãy tiếp tục duy trì thói quen ăn nhiều rau xanh.\n");
        }

// ===== PROTEIN =====
        if (daysLowProtein >= 1) {
            note.append("Tháng này bạn có một số ngày nạp protein chưa đủ.\n");
            note.append("Nên tăng cường thịt nạc, cá, trứng, sữa hoặc các loại đậu.\n");
        } else {
            note.append("Tháng này lượng protein bạn nạp vào ở mức phù hợp.\n");
            note.append("Tiếp tục duy trì chế độ ăn giàu protein chất lượng.\n");
        }

        if(daysCaloriesInMoreThanOut * 2 >= totalDays)
        {
            note.append("Tháng này bạn hơi lười.\n");
            note.append("Nên tăng tập luyện.\n");
        } else {
            note.append("Tháng này bạn khá chăm chỉ tập luyện.\n");
            note.append("Tiếp tục duy trì chế độ tập luyện.\n");
        }

        MonthSummary ms = new MonthSummary();

        ms.setUserId(userId);
        ms.setMonth(month);

        // ===== Giá trị trung bình =====
        ms.setAvgCaloriesIn(avgCaloriesIn.doubleValue());
        ms.setAvgCaloriesOut(avgCaloriesOut.doubleValue());
        ms.setAvgProtein(avgProtein.doubleValue());
        ms.setAvgFat(avgFat.doubleValue());
        ms.setAvgFiber(avgFiber.doubleValue());
        ms.setAvgSugar(avgSugar.doubleValue());

        // ===== Thống kê theo ngày =====
        ms.setDaysCaloriesInMoreThanOut(daysCaloriesInMoreThanOut);
        ms.setDaysHighSugar(daysHighSugar);
        ms.setDaysHighFat(daysHighFat);
        ms.setDaysLowFiber(daysLowFiber);
        ms.setDaysLowProtein(daysLowProtein);

        // ===== Tổng hợp =====
        ms.setTotalDays(totalDays);
        ms.setNote(note);

        return ms;
    }
}
