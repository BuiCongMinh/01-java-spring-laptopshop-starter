package vn.hoidanit.laptopshop.controller.clinet;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

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

    // cart page
    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {

        // create new object user
        User userCurrent = new User();

        // check session
        HttpSession session = request.getSession(false);

        // get user id from session
        long id = (long) session.getAttribute("id");

        // assign to the newly created object
        userCurrent.setId(id);

        // calls "cart" based on the "user" object just created (join table)
        Cart cart = this.productService.fetchByUser(userCurrent);

        // Call list "cart_detail" on the "cart" object (join table)
        List<CartDetail> listCart = cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : listCart) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("listCart", listCart);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show";

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

        this.productService.handelAddProductToCart(email, productId, session);

        return "redirect:/";
    }

}
