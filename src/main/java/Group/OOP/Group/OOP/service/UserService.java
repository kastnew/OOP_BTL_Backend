package Group.OOP.Group.OOP.service;

import Group.OOP.Group.OOP.entity.User;
import Group.OOP.Group.OOP.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // thêm 1 user
    public User createUser(String email , String password) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        return userRepository.save(user);
    }


    public User updateUser(Integer id , User userUpdate){
        Optional<User> userOptional = userRepository.findById(id); ;

        if (userOptional.isEmpty()) {
            throw new RuntimeException("Không tìm thấy user với ID: " + id);
        }

        User user = userOptional.get() ;

        if(userUpdate.getFirstName() != null){
            user.setFirstName(userUpdate.getFirstName()) ;
        }
        if(userUpdate.getLastName() != null){
            user.setLastName(userUpdate.getLastName()) ;
        }
        if(userUpdate.getAge() != null){
            user.setAge(userUpdate.getAge()) ;
        }
        if(userUpdate.getGender() != null) {
            user.setGender(userUpdate.getGender());
        }
        return userRepository.save(user) ;
    }

    // lấy thông tin của 1 user
    public User printUserInfo(Integer userId){
        Optional<User> tmp = userRepository.findById(userId);
        User user = tmp.get() ;
        if(user != null)
        {
            System.out.println("=== THÔNG TIN USER ===");
            System.out.println("ID: " + user.getId());
            System.out.println("Họ và tên: " + user.getFirstName() + " " + user.getLastName());
            System.out.println("Tuổi: " + user.getAge());
            System.out.println("Giới tính: " + user.getGender());
        } else {
            System.out.println("❌ Không tìm thấy user với ID: " + userId);
        }
        return user ;
    }

    // lấy id của user dựa vào email và password
    public Integer findUserId(String email , String password){
        return userRepository.findId(email,password);
    }

    public void deleteUser(Integer userId) {
        userRepository.deleteById(userId);
    }

}
