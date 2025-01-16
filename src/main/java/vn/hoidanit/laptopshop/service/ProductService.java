package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.service.specification.ProductSpecs;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(
            ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserService userService,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {

        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;

    }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {

            return this.productRepository.findAll(page);
        }

        Specification<Product> combienedSpec = Specification.where(null);
        if (productCriteriaDTO.getTarget() != null
                && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListTarget(productCriteriaDTO.getTarget().get());
            combienedSpec = combienedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getTarget() != null
                && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListFactory(productCriteriaDTO.getFactory().get());
            combienedSpec = combienedSpec.and(currentSpecs);

        }

        return this.productRepository.findAll(combienedSpec, page);
    }

    // case 1
    // public Page<Product> fetchProductsWithSpec(Pageable page, double min) {
    // return this.productRepository.findAll(ProductSpecs.minPrice(min), page);
    // }

    // case 2
    // public Page<Product> fetchProductsWithSpec(Pageable page, double max) {
    // return this.productRepository.findAll(ProductSpecs.maxPrice(max), page);
    // }

    // case 3
    // public Page<Product> fetchProductsWithPageSpec(Pageable page, String factory)
    // {
    // return this.productRepository.findAll(ProductSpecs.matchFactory(factory),
    // page);
    // }

    // case 4
    // public Page<Product> fetchProductsWithPageSpec(Pageable page, List<String>
    // factory) {
    // return this.productRepository.findAll(ProductSpecs.matchListFactory(factory),
    // page);
    // }

    // case 5
    // public Page<Product> fetchProductsWithSpec(Pageable page, String price) {
    // if (price.equals("10-toi-15-trieu")) {
    // double min = 10000000;
    // double max = 15000000;
    // return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
    // page);
    // } else if (price.equals("15-toi-30-trieu")) {
    // double min = 15000000;
    // double max = 30000000;

    // return this.productRepository.findAll(ProductSpecs.matchPrice(min, max),
    // page);

    // } else {
    // return this.productRepository.findAll(page);
    // }
    // }

    // case 6
    // public Page<Product> fetchProductsWithSpec(Pageable page, List<String> price)
    // {
    // Specification<Product> combinedSpec = (root, query, criteriaBuilder) ->
    // criteriaBuilder.disjunction();
    // int count = 0;
    // for (String p : price) {
    // double min = 0;
    // double max = 0;

    // // Set the appropriate min and max based on the price range string
    // switch (p) {
    // case "10-toi-15-trieu":
    // min = 10000000;
    // max = 15000000;
    // count++;
    // break;
    // case "15-toi-20-trieu":
    // min = 15000000;
    // max = 20000000;
    // count++;
    // break;
    // case "20-toi-30-trieu":
    // min = 20000000;
    // max = 30000000;
    // count++;
    // break;
    // // Add more cases as needed
    // }

    // if (min != 0 && max != 0) {
    // Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
    // combinedSpec = combinedSpec.or(rangeSpec);
    // }
    // }

    // // Check if any price ranges were added (combinedSpec is empty)
    // if (count == 0) {
    // return this.productRepository.findAll(page);
    // }

    // return this.productRepository.findAll(combinedSpec, page);

    // }

    // Case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            double min = 0;
            double max = 0;

            // Set the appropriate min and max based on the price range string
            switch (p) {
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "10-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 200000000;
                    break;
            }
            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }
        return combinedSpec;
    }

    public Page<Product> getAllProduct(Pageable page) {
        return this.productRepository.findAll(page);
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

    public void handelAddProductToCart(
            String email,
            long productId,
            HttpSession session,
            long quantity) {

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
                    cd.setQuantity(quantity);

                    this.cartDetailRepository.save(cd);

                    // update cart(sum)
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);

                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }
            }
        }

    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailID, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailID);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();

            // Delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailID);

            // Update cart
            if (currentCart.getSum() > 1) {

                // Update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);

                // save data and save the s in session
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // delete product in cart
                this.cartRepository.deleteById(currentCart.getId());

                // update "sum" session 0
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckOut(List<CartDetail> cartDetails) {
        for (CartDetail cd : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cd.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cd.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(
            User user,
            HttpSession session,
            String receiverName,
            String receiverAddress,
            String receiverPhone,
            String paymentMethod,
            String uuid) {

        // get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                order.setPaymentMethod(paymentMethod);
                order.setPaymentStatus("PAYMENT_UNPAID");
                order.setPaymentRef(paymentMethod.equals("COD") ? "UNKNOWN" : uuid);

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();

                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail
                // step one : get cart by user
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setQuantity(cd.getQuantity());
                    orderDetail.setPrice(cd.getPrice());

                    this.orderDetailRepository.save(orderDetail);

                }

                // step two: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {

                    this.cartDetailRepository.deleteById(cd.getId());

                }

                this.cartRepository.deleteById(cart.getId());

                // step there : update session
                session.setAttribute("sum", 0);
            }

        }
    }

    public void updatePaymentStatus(String paymentRef, String paymentStatus) {
        Optional<Order> orderOptional = this.orderRepository.findByPaymentRef(paymentRef);
        if (orderOptional.isPresent()) {
            // update

            Order order = orderOptional.get();
            order.setPaymentStatus(paymentStatus);
            this.orderRepository.save(order);
        }

    }
}
