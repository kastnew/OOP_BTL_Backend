package Group.OOP.Group.OOP.repository;

import Group.OOP.Group.OOP.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Integer>{
    // in ra tất cả thông tin khách hàng
    // @Query("select u from User u")
    // public List<User> getAllUser();

//    @Query("select u from User u where u.id = 1")
//    public User getUserId();
    // create read update delete

    // lấy id 1 user dựa vào email và password
    @Query("select u.id from User u where u.password = :password and u.email = :email")
    public Integer findId(String email , String password) ;

//    @Query("select u from User u where u.firstName =   :userFirstName and u.lastName = :userLastName and u.age = :userAge and u.gender = :userGender")
//    boolean  existsUser(String userFirstName , String userLastName , Integer userAge , String userGender);
}
