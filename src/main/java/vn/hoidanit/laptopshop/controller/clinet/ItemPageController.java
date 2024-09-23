package vn.hoidanit.laptopshop.controller.clinet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ItemPageController {
    private final ProductService productService;

    public ItemPageController(ProductService productService) {
        this.productService = productService;
    }

    // detail product page
    @GetMapping("/product/{id}")
    public String getProductPage(
            Model model,
            @PathVariable long id) {

        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);

        return "client/product/show";
    }
}
