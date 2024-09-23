package vn.hoidanit.laptopshop.controller.clinet;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class HomePageController {
    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    // home page
    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> productAll = this.productService.getAllProduct();
        model.addAttribute("allProduct", productAll);
        return "client/homepage/show";
    }

}
