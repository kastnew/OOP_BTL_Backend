package Group.OOP.Group.OOP.controller;

import Group.OOP.Group.OOP.entity.User;
import Group.OOP.Group.OOP.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
//@CrossOrigin(origins = "http://localhost:5173")
@CrossOrigin(origins = "*")
public class UserController {

    @Autowired
    private UserService userService;

    // đây là đăng ký
    @PostMapping("/create")
    public User createUser(
            @RequestParam String email,
            @RequestParam String password
    ) {
        return userService.createUser(email, password);
    }

    @PostMapping("/login")
    public Integer getId(
            @RequestParam String email,
            @RequestParam String password
    ){
        return userService.findUserId(email, password);
    }
    @PatchMapping("/up/{id}")
    public void updateUser(@PathVariable Integer id , @RequestBody User user) {
        userService.updateUser(id ,user) ;
    }


    @GetMapping("/delete/{id}")
    public void deleteUser(@PathVariable Integer id) {
        userService.deleteUser(id);
    }

    @GetMapping("/{id}")
    public User getUser(@PathVariable Integer id) {
        return userService.printUserInfo(id) ;
    }
}
