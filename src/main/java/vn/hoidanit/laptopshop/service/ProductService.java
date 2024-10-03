package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(
            ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserService userService) {

        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;

    }

    public List<Product> getAllProduct() {
        List<Product> allProduct = this.productRepository.findAll();
        return allProduct;
    }

    public Optional<Product> getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public Product handelSaveProduct(Product product) {
        Product newProduct = this.productRepository.save(product);
        return newProduct;
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handelAddProductToCart(String email, long productId, HttpSession session) {

        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // Check user đã có cart chưa -> nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                Cart ortherCart = new Cart();
                ortherCart.setSum(0);
                ortherCart.setUser(user);

                cart = this.cartRepository.save(ortherCart);
            }

            // save cart_detail
            // find product by id
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                // Check sản phẩm đã từng được thêm vào giỏ hàng trước đây hay chưa ?
                // boolean isExistProductInCart =
                // this.cartDetailRepository.existsByCartAndProduct(cart, realProduct);

                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);

                    this.cartDetailRepository.save(cd);

                    // update cart(sum)
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);

                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);

                    this.cartDetailRepository.save(oldDetail);

                }

            }

        }

    }

}
