package vn.devpro.javaweb27.controller.frontend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.dto.jw27Constant;
import vn.devpro.javaweb27.model.Product;
import vn.devpro.javaweb27.service.ProductService;

@RestController
@RequestMapping("/api")
public class apiController extends BaseController implements jw27Constant {

    @Autowired
    private ProductService productService;

    @GetMapping("/data")
    public List<Product> getData() {
        // Lấy danh sách sản phẩm từ productService
        List<Product> productList = productService.findAllActive();
        return productList;
    }
}