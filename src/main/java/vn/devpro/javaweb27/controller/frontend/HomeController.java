package vn.devpro.javaweb27.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.dto.SearchModel;
import vn.devpro.javaweb27.dto.jw27Constant;
import vn.devpro.javaweb27.model.Category;
import vn.devpro.javaweb27.model.Product;
import vn.devpro.javaweb27.model.ProductImage;
import vn.devpro.javaweb27.service.CategoryService;
import vn.devpro.javaweb27.service.ProductImageService;
import vn.devpro.javaweb27.service.ProductService;
import vn.devpro.javaweb27.service.UserService; 

@Controller
public class HomeController extends BaseController implements jw27Constant {
	
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductImageService ProductImageService;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String index(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		return "frontend/index";
	}
	
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String shop(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			 ) throws IOException{
		
		List<Product> products = productService.findAllActive();
		model.addAttribute("products",products);
		

		 return "frontend/menu/shop";
	}
	
	@RequestMapping(value = "/shop/{categoryId}", method = RequestMethod.GET)
	public String shopmenu(@PathVariable Long categoryId,
	                   Model model,
	                   HttpServletRequest request,
	                   HttpServletResponse response) throws IOException {

	    List<Product> products = productService.findAllActiveByCategoryId(categoryId);
	    model.addAttribute("products", products);

	    return "frontend/menu/shop";
	}
	
	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String productDetail(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId) throws IOException{
		
		Product product = productService.getById(productId);
		model.addAttribute("product",product);
		// lay danh sach anh trong tbl_product_image
		List<ProductImage>  ProductImages = ProductImageService.getProductImageByProductId(productId);
		model.addAttribute("productImages", ProductImages);
		
		//viet method lay danh sach trong product image
		
		return "frontend/menu/product-Infor";
	}

//	@RequestMapping(value = "/search" ,   method = RequestMethod.GET)
//	public String search(final Model model,
//			final HttpServletRequest request) {
////		SearchModel productSearch = new SearchModel();
////		
////		//tim theo keyword
////		productSearch.setKeyword(null);//all
////		String keyword = request.getParameter("keyword");
////		if (!StringUtils.isEmpty(keyword) ) {// neu co chon status
////			productSearch.setKeyword(keyword);
////					
////		}
////		
////		
////		List<Category> categories = categoryService.findAll();
////		model.addAttribute("categories", categories);
////		
////		
//////		List<Product> products = productService.searchProduct(productSearch);
//////		model.addAttribute("products", products);
////		model.addAttribute( "productSearch",productSearch);
////		return "backend/product-list";
//		List<Product> products = productService.findAllActive();
//		model.addAttribute("products",products);
//		return "frontend/index";
//		
//		
//		
//		
//	}

}
