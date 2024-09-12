package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.ui.Model;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // get all products page
    @GetMapping("/admin/product")
    public String getProductsPage(Model model) {
        List<Product> allProduct = this.productService.getAllProduct();

        model.addAttribute("allProduct", allProduct);

        return "admin/product/show";
    }

    // get create a product page
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", model);
        return "admin/product/create";
    }

}
