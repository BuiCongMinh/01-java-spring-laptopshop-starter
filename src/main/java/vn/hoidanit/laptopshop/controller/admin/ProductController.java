package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
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
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    // get one product by id page
    @GetMapping("/admin/product/{id}")
    public String getProductByIDPage(
            Model model,
            @PathVariable long id) {
        System.out.println(">>>> Check id :" + id);
        Product detail = this.productService.getProductById(id);
        model.addAttribute("detail", detail);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    // get update a product page
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(
            Model model,
            @PathVariable long id) {
        Product productDetail = this.productService.getProductById(id);
        model.addAttribute("product", productDetail);
        return "admin/product/update";
    }

    // post create a product
    @PostMapping("/admin/product/create")
    public String postCreateProduct(
            Model model,
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult bindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {

        // Handel logic validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>" + error.getObjectName() + " - " +
                    error.getDefaultMessage());
        }
        // end

        // Adjust code flow
        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }
        // end

        String imgProduct = this.uploadService.handelSaveUploadFile(file, "product");

        newProduct.setImage(imgProduct);

        this.productService.handelSaveProduct(newProduct);

        return "redirect:/admin/product";
    }

    // post update product
    @PostMapping("/admin/product/update")
    public String postUpdate(
            @ModelAttribute("product") @Valid Product product,
            BindingResult bindingResult) {

        // Handel logic validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>" + error.getObjectName() + " - " +
                    error.getDefaultMessage());
        }
        // end

        // Adjust code flow (attention path !)
        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }
        // end

        Product productCurrent = this.productService.getProductById(product.getId());
        if (productCurrent != null) {
            productCurrent.setName(product.getName());
            productCurrent.setPrice(product.getPrice());
            productCurrent.setDetailDesc(product.getDetailDesc());
            productCurrent.setShortDesc(product.getShortDesc());
            productCurrent.setQuantity(product.getQuantity());
            productCurrent.setFactory(product.getFactory());
            productCurrent.setTarget(product.getTarget());

            this.productService.handelSaveProduct(productCurrent);

        }
        // } else {
        // System.out.println(">>> Data update false ");
        // return "admin/product/update";
        // }

        return "redirect:/admin/product";
    }

}
