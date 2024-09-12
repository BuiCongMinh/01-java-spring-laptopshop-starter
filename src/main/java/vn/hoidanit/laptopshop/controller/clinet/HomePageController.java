package vn.hoidanit.laptopshop.controller.clinet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {

    // home page
    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show";
    }

}
