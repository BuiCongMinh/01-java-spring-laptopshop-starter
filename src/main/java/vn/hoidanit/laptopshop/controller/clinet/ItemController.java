package vn.hoidanit.laptopshop.controller.clinet;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

        // Call list "cart_detail" (Check listCart null first !) on the "cart" object
        // (join table)
        List<CartDetail> listCart = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : listCart) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("listCart", listCart);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        // get id in session
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        long totalPrice = 0;

        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @GetMapping("/thanks")
    public String getThankPage(Model model) {
        return "client/cart/thanks";
    }

    // ================POST===================
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(
            @PathVariable Long id,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long productId = id;

        String email = (String) session.getAttribute("email");

        this.productService.handelAddProductToCart(email, productId, session);

        return "redirect:/";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckOut(cartDetails);

        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceStringOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone

    ) {

        User currentUser = new User();
        HttpSession session = request.getSession(false);
        // get id in session
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);

        return "redirect:/thanks";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(
            @PathVariable long id,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long cartDetailId = id;

        this.productService.handleRemoveCartDetail(cartDetailId, session);

        return "redirect:/cart";
    }

}
