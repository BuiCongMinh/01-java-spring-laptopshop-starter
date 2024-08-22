package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {
    private final UserService userService;

    // code style DI
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        User arrUsers = this.userService.getAllUserByEmail("123@gmail.com");
        System.out.println("Check home page data: " + arrUsers);

        model.addAttribute("minhvn", "test");
        model.addAttribute("mvn", "Minhvn");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getPageUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // post data from form mvc tutorial
    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String postCreateUserPage(Model model, @ModelAttribute("newUser") User minhvn) {
        User newUser = this.userService.handelSaveUser(minhvn);
        System.out.println(">>> Check newUser: " + newUser);
        return "hello";
    }

}

// @RestController
// public class UserController {

// private UserService userService;

// // viết code theo phong cách DI: dependency injection(search gg)
// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("")
// public String getHomePage() {
// return this.userService.handelHello();
// }

// }
