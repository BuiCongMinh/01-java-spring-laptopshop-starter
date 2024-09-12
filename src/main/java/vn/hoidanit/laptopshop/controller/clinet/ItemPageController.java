package vn.hoidanit.laptopshop.controller.clinet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemPageController {

    // detail product page
    @GetMapping("/product/{id}")
    public String getProductPage() {
        return "client/product/show";
    }
}
