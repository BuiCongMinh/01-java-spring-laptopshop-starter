package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

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

}
