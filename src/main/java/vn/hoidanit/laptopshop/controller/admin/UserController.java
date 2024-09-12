package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import jakarta.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    // code style DI (Depetioncy injection)
    public UserController(
            UserService userService,
            UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;

    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // List<User> arrUsers = this.userService.getAllUser();
    // model.addAttribute("minhvn", "test");
    // model.addAttribute("mvn", "Minhvn");
    // return "hello";
    // }

    // get all user
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String getPageAllUser(Model model) {
        List<User> allUsers = this.userService.getAllUser();
        model.addAttribute("allUsers", allUsers);
        // System.out.println(">>>check allUser get all page: " + allUsers);
        return "admin/user/show";
    }

    // get one user by id page
    @RequestMapping(value = "/admin/user/{id}", method = RequestMethod.GET)
    public String getPageUserById(Model model, @PathVariable long id) {
        User detailUser = this.userService.getUserByID(id);
        model.addAttribute("detailUser", detailUser);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // get update user by id page
    @RequestMapping(value = "/admin/user/update/{id}", method = RequestMethod.GET)
    public String getPageUpdateUser(Model model, @PathVariable long id) {
        User userId = this.userService.getUserByID(id);
        model.addAttribute("userId", userId);
        return "admin/user/update";
    }

    // get create user page
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String getPageCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // get delete user page
    @GetMapping("/admin/user/delete/{id}")
    public String getPageDeleteUser(Model model, @PathVariable long id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    // post update user from mvc
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("userId") User newUser) {
        User currentUser = this.userService.getUserByID(newUser.getId());
        if (currentUser != null) {
            currentUser.setAddress(newUser.getAddress());
            currentUser.setFullName(newUser.getFullName());
            currentUser.setPhone(newUser.getPhone());

            this.userService.handelSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // post create data from "form" mvc tutorial
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String postCreateUser(
            Model model,
            @ModelAttribute("newUser") @Valid User minhvn,
            BindingResult newUserBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {

        // handel logic Validate
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        // end

        // Validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        // end

        String avatar = this.uploadService.handelSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(minhvn.getPassword());

        minhvn.setAvatar(avatar);
        minhvn.setPassword(hashPassword);
        minhvn.setRole(this.userService.getRoleByName(minhvn.getRole().getName()));

        // save
        this.userService.handelSaveUser(minhvn);
        return "redirect:/admin/user";
    }

    // post delete data from mvc tutorial
    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
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
