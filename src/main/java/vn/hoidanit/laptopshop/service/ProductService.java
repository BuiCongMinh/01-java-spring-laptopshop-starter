package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProduct() {
        List<Product> allProduct = this.productRepository.findAll();
        return allProduct;
    }

    public Product getProductById(long id) {
        Product product = this.productRepository.findProductById(id);
        return product;
    }

    public Product handelSaveProduct(Product product) {
        Product newProduct = this.productRepository.save(product);
        return newProduct;
    }

}
