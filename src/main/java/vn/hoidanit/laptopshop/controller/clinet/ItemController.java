package vn.hoidanit.laptopshop.controller.clinet;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.VNPayService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {
    private final ProductService productService;
    private final VNPayService vNPayService;

    public ItemController(ProductService productService, VNPayService vNPayService) {
        this.productService = productService;
        this.vNPayService = vNPayService;
    }

    // ==============GET===================
    // detail product page
    @GetMapping("/product/{id}")
    public String getProductPageByID(
            Model model,
            @PathVariable long id) {

        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);

        return "client/product/detail";
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
    public String getThankPage(
            Model model,
            @RequestParam("vnp_ResponseCode") Optional<String> vnpayResponseCode,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef

    ) {
        if (vnpayResponseCode.isPresent() && paymentRef.isPresent()) {
            // thanh toán qua VNPay, cập nhật trạng thái order
            String paymentStatus = vnpayResponseCode.get().equals("00")
                    ? "PAYMENT_SUCCEED"
                    : "PAYMENT_FAILED";
            this.productService.updatePaymentStatus(paymentRef.get(), paymentStatus);

        }

        return "client/cart/thanks";
    }

    @GetMapping("/products")
    public String getProductPage(
            Model model,
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request

    ) {

        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 10);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }

        }
        pageable = PageRequest.of(page - 1, 60);

        // Page<Product> prs = this.productService.fetchProducts(pageable);
        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "   ");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);

        return "client/product/show";
    }

    // ================POST===================
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(
            @PathVariable Long id,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long productId = id;

        String email = (String) session.getAttribute("email");

        this.productService.handelAddProductToCart(email, productId, session, 1);

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
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice

    ) throws UnsupportedEncodingException {

        User currentUser = new User();
        HttpSession session = request.getSession(false);
        // get id in session
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        final String uuid = UUID.randomUUID().toString().replace("-", "");

        this.productService.handlePlaceOrder(
                currentUser,
                session,
                receiverName,
                receiverAddress,
                receiverPhone,
                paymentMethod,
                uuid);

        if (!paymentMethod.equals("COD")) {
            // TODO redirect to VNPAY
            String ip = this.vNPayService.getIpAddress(request);
            String vnpUrl = this.vNPayService.generateVNPayURL(Double.parseDouble(totalPrice), uuid, ip);

            return "redirect:" + vnpUrl;
        }

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

    @PostMapping("add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        // TODO: process POST request

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handelAddProductToCart(email, id, session, quantity);

        return "redirect:/product/" + id;
    }

}
