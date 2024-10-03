package vn.hoidanit.laptopshop.controller.clinet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    // ==============GET===================
    // detail product page
    @GetMapping("/product/{id}")
    public String getProductPage(
            Model model,
            @PathVariable long id) {

        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);

        return "client/product/show";
    }

    // ================POST===================
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(
            @PathVariable Long id,
            HttpServletRequest request) {
        // TODO: process POST request
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handelAddProductToCart(email, productId);

        return "redirect:/";
    }

}
