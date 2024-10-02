package vn.hoidanit.laptopshop.controller.clinet;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    // ============== Get menthod ===============

    // home page
    @GetMapping("/")
    public String getHomePage(Model model) {

        List<Product> productAll = this.productService.getAllProduct();
        model.addAttribute("allProduct", productAll);

        return "client/homepage/show";
    }

    // register page
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());

        return "client/auth/register";
    }

    // login page
    @GetMapping("/login")
    public String getLoginPage(Model model) {
        // model.addAttribute("registerUser", new RegisterDTO());

        return "client/auth/login";
    }

    // access deny page
    @GetMapping("/access-deny")
    public String getAccessDenyPage() {
        return "client/auth/deny";
    }

    // =============== Post menthod ==================

    // post register logic
    @PostMapping("/register")
    public String postHandelRegister(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTOUser,
            BindingResult bindingResult) {

        // validate
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOToUser(registerDTOUser);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(userService.getRoleByName("USER"));

        // save data
        this.userService.handelSaveUser(user);

        return "redirect:/login";
    }

}