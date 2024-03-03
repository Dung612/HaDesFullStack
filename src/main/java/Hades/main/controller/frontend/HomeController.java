package Hades.main.controller.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import Hades.main.controller.BaseController;
import Hades.main.dto.Cart;
import Hades.main.dto.ProductCart;
import Hades.main.dto.SearchModel;
import Hades.main.dto.jw27Constant;
import Hades.main.model.Category;
import Hades.main.model.Product;
import Hades.main.model.ProductImage;
import Hades.main.service.CategoryService;
import Hades.main.service.ProductImageService;
import Hades.main.service.ProductService;
import Hades.main.service.UserService; 

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
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);
	    
	    List<Product> productnew = productService.findNewProduct();
	    model.addAttribute("productnew", productnew);
	    
		return "frontend/index";
	}
	
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String shop(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			 ) throws IOException{
		
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);
		
		SearchModel productSearch = new SearchModel();
		//tim theo status
		productSearch.setStatus(3);// moi nhat
		String status = request.getParameter("status");
		if (!StringUtils.isEmpty(status)) {// neu co chon status
			productSearch.setStatus(Integer.parseInt(status));
			
		}
		//bat dau phan trang 
		
				if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // bam nut chuyen trang
					productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
					
					
				}else {
					productSearch.setCurrentPage(1);
				}
		
				List<Product> allProducts = productService.searchProductFe(productSearch);//timkiem
				List<Product> products = new ArrayList<Product>();//ds sp can hien thi trang hien tai 
				//tong so trang theo tim kiem
				
				int totalPages =  allProducts.size() / SIZE_OF_PAGE;
				if (allProducts.size() % SIZE_OF_PAGE >0) { 
					totalPages ++;
					
				}
				
				//neu tong so trang nho hon trang hien tai (lai bam tim kiem)
				if (totalPages < productSearch.getCurrentPage()) {
					productSearch.setCurrentPage(1);
					
				}
				// lay danh sach san pham hien thi trong 1 trang
				
				int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
				int index = firstIndex , count =0 ;
				while (index < allProducts.size() && count <SIZE_OF_PAGE) {
					products.add(allProducts.get(index));
					index++;
					count++;;
					
					
				}
				
				// phan trang 
				
				productSearch.setSizeOfPage(SIZE_OF_PAGE);
				productSearch.setTotalItems(allProducts.size());
				model.addAttribute("products", products);
				model.addAttribute( "productSearch",productSearch);

	    
		

		 return "frontend/menu/shop";
	}
	
	@RequestMapping(value = "/shop/{categoryId}", method = RequestMethod.GET)
	public String shopmenu(@PathVariable Long categoryId,
	                   Model model,
	                   HttpServletRequest request,
	                   HttpServletResponse response) throws IOException {
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);

		
		SearchModel productSearch = new SearchModel();
		//tim theo status
		productSearch.setStatus(3);// moi nhat
		String status = request.getParameter("status");
		if (!StringUtils.isEmpty(status)) {// neu co chon status
			productSearch.setStatus(Integer.parseInt(status));
			
		}
		//bat dau phan trang 
		
				if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // bam nut chuyen trang
					productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
					
					
				}else {
					productSearch.setCurrentPage(1);
				}
		
				List<Product> allProducts = productService.searchProductAndCategoryFe(productSearch,categoryId);//timkiem
				List<Product> products = new ArrayList<Product>();//ds sp can hien thi trang hien tai 
				//tong so trang theo tim kiem
				
				int totalPages =  allProducts.size() / SIZE_OF_PAGE;
				if (allProducts.size() % SIZE_OF_PAGE >0) { 
					totalPages ++;
					
				}
				
				//neu tong so trang nho hon trang hien tai (lai bam tim kiem)
				if (totalPages < productSearch.getCurrentPage()) {
					productSearch.setCurrentPage(1);
					
				}
				// lay danh sach san pham hien thi trong 1 trang
				
				int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
				int index = firstIndex , count =0 ;
				while (index < allProducts.size() && count <SIZE_OF_PAGE) {
					products.add(allProducts.get(index));
					index++;
					count++;;
					
					
				}
				
				// phan trang 
				
				productSearch.setSizeOfPage(SIZE_OF_PAGE);
				productSearch.setTotalItems(allProducts.size());
				model.addAttribute("products", products);
				model.addAttribute( "productSearch",productSearch);

				return "frontend/menu/shop";
	}
	
	@RequestMapping(value = "/sale",method = RequestMethod.GET)
	public String recruitment(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);
		
		
		List<Product> products = productService.saleProduct();
		model.addAttribute("products", products);
		return "frontend/menu/shop";
	}


	
	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String productDetail(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId) throws IOException{
		
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);
		
		Product product = productService.getById(productId);
		model.addAttribute("product",product);
		// lay danh sach anh trong tbl_product_image
		List<ProductImage>  ProductImages = ProductImageService.getProductImageByProductId(productId);
		model.addAttribute("productImages", ProductImages);
		
		List<Product> products = productService.findAllActiveIsHot();
		model.addAttribute("products",products);
		
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
