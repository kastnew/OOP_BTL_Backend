# Backend - Ứng Dụng Theo Dõi Sức Khỏe Cá Nhân (Personal Health Tracker)

Chào mừng bạn đến với mã nguồn phía Server (Backend) của dự án **Ứng Dụng Theo Dõi Sức Khỏe Cá Nhân**. Hệ thống này được xây dựng bằng **Java Spring Boot**, cung cấp các API RESTful để xử lý logic nghiệp vụ, tính toán chỉ số sức khỏe và quản lý dữ liệu người dùng.

---

## ⚠️ LƯU Ý QUAN TRỌNG (Đọc trước khi cài đặt)

Dự án này được xây dựng theo mô hình **Client-Server**. Repository này chỉ chứa mã nguồn Backend (Server & Database).

Để ứng dụng hoạt động trọn vẹn, bạn **BẮT BUỘC** phải tải và chạy song song phần **Frontend** (Giao diện người dùng).

👉 **Vui lòng tải code Frontend tại:** [Frontend - Ứng Dụng Theo Dõi Sức Khỏe Cá Nhân](https://github.com/kastnew/OOP_BTL)

---

## 🌟 Tính Năng Chính (Backend)

Backend cung cấp các API để thực hiện các chức năng sau:

1.  **Quản lý Hoạt động (Activity Management):** CRUD (Thêm, Sửa, Xóa, Xem) các hoạt động thể chất, tự động tính toán calo tiêu thụ dựa trên loại hoạt động và thời gian.
2.  **Quản lý Dinh dưỡng (Nutrition Management):** CRUD các bữa ăn, tính toán tổng lượng Calo, Protein, Carbs, Fat nạp vào.
3.  **Theo dõi Giấc ngủ (Sleep Tracking):** Ghi nhận thời gian ngủ/thức và đánh giá chất lượng giấc ngủ.
4.  **Hồ sơ Bệnh án (Medical Records):** Quản lý lịch sử bệnh lý của người dùng.
5.  **Báo cáo & Thống kê (Reports):**
    * API tổng hợp dữ liệu theo Ngày (Daily Summary): Tự động tính điểm Rating sức khỏe.
    * API tổng hợp dữ liệu theo Tháng (Monthly Summary): Thống kê xu hướng và đưa ra cảnh báo.
6.  **Tính toán Chỉ số (Calculations):** Logic tính BMI và các chỉ số khác được xử lý tại server hoặc hỗ trợ tính toán.

---

## 🛠 Công Nghệ Sử Dụng

* **Ngôn ngữ:** Java (JDK 17 trở lên).
* **Framework:** Spring Boot (Spring Web, Spring Data JPA).
* **Database:** MySQL.
* **ORM:** Hibernate.
* **Build Tool:** Maven.

---

## ⚙️ Yêu Cầu Cài Đặt (Prerequisites)

Trước khi bắt đầu, hãy đảm bảo máy tính của bạn đã cài đặt:

* **Java Development Kit (JDK):** Phiên bản 17 hoặc mới hơn.
* **Maven:** Công cụ quản lý dự án Java (thường đi kèm IDE hoặc cài riêng).
* **MySQL Server:** (Khuyên dùng XAMPP, MySQL Workbench hoặc Docker).
* **Git:** Để clone mã nguồn.

---

## 🚀 Hướng Dẫn Cài Đặt & Chạy (Backend + Database)

Thực hiện lần lượt các bước sau để khởi chạy Server:

### Bước 1: Clone mã nguồn về máy
Mở Terminal (hoặc Git Bash, CMD) và chạy lệnh:

```bash
git clone https://github.com/kastnew/OOP_BTL_Backend.git
cd OOP_BTL_Backend

```

---

### Bước 2: Cài đặt Cơ Sở Dữ Liệu (Quan Trọng ⚠️)
Trong thư mục gốc của dự án, bạn sẽ tìm thấy file **`theodoisuckhoe.sql`**.

**Thực hiện các thao tác sau trên MySQL Workbench hoặc phpMyAdmin:**

1.  **Tạo Database rỗng:**
    Tạo một cơ sở dữ liệu mới có tên chính xác là `theodoisuckhoe`. Chạy lệnh SQL sau:

    ```sql
    CREATE DATABASE theodoisuckhoe CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```

2.  **Import dữ liệu:**
    * **Cách 1: Dùng MySQL Workbench**
        * Vào menu **Server** -> **Data Import**.
        * Chọn **Import from Self-Contained File** và trỏ tới file `theodoisuckhoe.sql`.
        * Tại phần **Default Target Schema**, chọn `theodoisuckhoe`.
        * Nhấn **Start Import**.

    * **Cách 2: Dùng dòng lệnh (Terminal/CMD)**
        Di chuyển terminal vào thư mục chứa file `.sql` và chạy lệnh:
        ```bash
        mysql -u root -p theodoisuckhoe < theodoisuckhoe.sql
        ```

### Bước 3: Cấu hình kết nối (application.properties)
Mở file `src/main/resources/application.properties`. Chỉnh sửa các thông số sau để kết nối đúng với database vừa tạo:

```properties
# Cổng chạy backend (Mặc định 8080)
server.port=8080

# Kết nối MySQL (Đã trỏ đúng vào DB 'theodoisuckhoe')
spring.datasource.url=jdbc:mysql://localhost:3306/theodoisuckhoe?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true

# Tên đăng nhập MySQL (Mặc định XAMPP là 'root')
spring.datasource.username=root

# Mật khẩu MySQL (Mặc định XAMPP để trống, nếu bạn có pass hãy điền vào)
spring.datasource.password=

# Cấu hình JPA/Hibernate
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect

```

### Bước 4: Chạy ứng dụng Backend
Bạn có thể chọn 1 trong 2 cách sau để chạy server:

**Cách 1: Dùng dòng lệnh (Terminal)**
Tại thư mục gốc của dự án (nơi chứa file `pom.xml`), chạy lệnh:

```bash
mvn spring-boot:run
```
**Cách 2: Dùng IDE (IntelliJ IDEA / Eclipse)**
* Mở project bằng IDE.
* Đợi Maven tải xong các thư viện (Dependencies).
* Tìm file chính của ứng dụng (có tên là `GroopOopApplication.java`).
* Nhấn nút **Run** (biểu tượng tam giác xanh trên thanh công cụ).

✅ **Kiểm tra thành công:**
Khi terminal hiện dòng log tương tự: `Started GroopOopApplication in ... seconds`, nghĩa là Server đã chạy thành công tại địa chỉ: `http://localhost:8080`.

---

## 📂 Cấu Trúc Thư Mục

```bash
 src/
   ├── main/
   │  ├── java/
   │  │  └─ Group/OOP/Group/OOP/
   │  │     ├── GroupOopApplication.java
   │  │     ├── controller/
   │  │     │  ├── DailyActivityController.java
   │  │     │  ├── DailySummaryController.java
   │  │     │  ├── HealthIndicatorsController.java
   │  │     │  ├── MealController.java
   │  │     │  ├── MedicalRecordController.java
   │  │     │  ├─ MonthSummaryController.java
   │  │     │  ├─ SleepController.java
   │  │     │  └─ UserController.java
   │  │     ├─ dto/
   │  │     │  ├─ MonthSummary.java
   │  │     │  └─ MonthSummaryRequest.java
   │  │     ├─ entity/
   │  │     │  ├─ DailyActivity.java
   │  │     │  ├─ DailySummary.java
   │  │     │  ├─ HealthIndicators.java
   │  │     │  ├─ Meal.java
   │  │     │  ├─ MedicalRecord.java
   │  │     │  ├─ Sleep.java
   │  │     │  └─ User.java
   │  │     ├─ repository/
   │  │     │  ├─ DailyActivityRepository.java
   │  │     │  ├─ DailySummaryRepository.java
   │  │     │  ├─ HealthIndicatorsRepository.java
   │  │     │  ├─ MealRepository.java
   │  │     │  ├─ MedicalRecordRepository.java
   │  │     │  ├─ SleepRepository.java
   │  │     │  └─ UserRepository.java
   │  │     └─ service/
   │  │        ├─ ActivityTime.java
   │  │        ├─ CalculateCalorieIntakeValueService.java
   │  │        ├─ CalculateCaloValueService.java
   │  │        ├─ CalculateFatValueService.java
   │  │        ├─ CalculateFiberValueService.java
   │  │        ├─ CalculateNutritionValueService.java
   │  │        ├─ CalculateProteinValueService.java
   │  │        ├─ CalculateRate.java
   │  │        ├─ CalculateSugarValueService.java
   │  │        ├─ CaloInRate.java
   │  │        ├─ CaloRate.java
   │  │        ├─ DailyActivityService.java
   │  │        ├─ DailySummaryService.java
   │  │        ├─ HealthIndicatorsService.java
   │  │        ├─ MealService.java
   │  │        ├─ MedicalRecordService.java
   │  │        ├─ MonthSummaryService.java
   │  │        ├─ RestTime.java
   │  │        ├─ SleepRate.java
   │  │        ├─ SleepService.java
   │  │        ├─ TimeCalculate.java
   │  │        └─ UserService.java
   │  └─ resources/
   │     └─ application.properties
   └─ test/
      └─ java/
         └─ Group/OOP/Group/OOP/
            └─ GroupOopApplicationTests.java


```

---

## 👥 Nhóm Phát Triển

Dự án này được thực hiện bởi **Nhóm 5 Sinh viên Đại học**:

1.  Mai Xuân Đại - 202416149
2.  Phạm Duy Hiếu - 202400044
3.  Phạm Trung Kiên - 202416252
4.  Vũ Trung Kiên - 202416254
5.  Thái Hùng Lân - 202416261

---
*Cảm ơn bạn đã quan tâm đến dự án của chúng tôi!*
