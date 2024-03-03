package Hades.main.controller.frontend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import Hades.main.controller.BaseController;
import Hades.main.dto.jw27Constant;
import Hades.main.model.Product;
import Hades.main.service.ProductService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class apiController {

	@Autowired
	private ProductService productService;

    public apiController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/api/products")
    public List<Product> getAllProducts() {
        return productService.findAllActive();
    }
}