package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {
    private UserService userService;

    // code style DI
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage() {
        String test = this.userService.handelHello();
        return "eric.html";
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
