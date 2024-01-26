package Hades.main.controller.backend;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Hades.main.controller.BaseController;
import Hades.main.dto.SearchModel;
import Hades.main.dto.jw27Constant;
import Hades.main.model.Category;
import Hades.main.model.Product;
import Hades.main.model.User;
import Hades.main.service.CategoryService;
import Hades.main.service.ProductService;
import Hades.main.service.UserService;

@Controller
@RequestMapping("/admin/product/")
public class ProductController extends BaseController implements jw27Constant {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	public String list(final Model model) {
//		List<Product> products = productService.findAll();
//		model.addAttribute("products", products);
//		return "backend/product-list";
//	}
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model,
			final HttpServletRequest request) {
		
		SearchModel productSearch = new SearchModel();
		//tim theo status
		productSearch.setStatus(2);//all
		String status = request.getParameter("status");
		if (!StringUtils.isEmpty(status)) {// neu co chon status
			productSearch.setStatus(Integer.parseInt(status));
			
		}
		//tim theo category
		productSearch.setCategoryId(0);//all
		String categoryId = request.getParameter("categoryId");
		if (!StringUtils.isEmpty(categoryId) ) {// neu co chon status
			productSearch.setCategoryId(Integer.parseInt(categoryId));
			
		}
		
		//tim theo keyword
		productSearch.setKeyword(null);//all
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword) ) {// neu co chon status
			productSearch.setKeyword(keyword);
					
		}
		
		// Kiem tra tieu chi tim kiem tu ngay den ngay
				String beginDate = null;
				String endDate = null;
				if (!StringUtils.isEmpty(request.getParameter("beginDate"))
						&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
					beginDate = request.getParameter("beginDate");
					endDate = request.getParameter("endDate");
				}
				productSearch.setBeginDate(beginDate);
				productSearch.setEndDate(endDate);
		//bat dau phan trang 
				
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // bam nut chuyen trang
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
			
			
		}else {
			productSearch.setCurrentPage(1);
		}
		
		List<Product> allProducts = productService.searchProduct(productSearch);//timkiem
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
		

	
		
		
		
				
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		
//		List<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("products", products);
		model.addAttribute( "productSearch",productSearch);
		return "backend/product-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		
		Product product = new Product();
		product.setCreateDate(new Date());
		
		model.addAttribute("product", product);
		
		return "backend/product-add";
	}
	
	//save new product
	@RequestMapping(value = "/add-save" , method = RequestMethod.POST)
	public String productAddSave(final Model model,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("avatarFile2") MultipartFile avatarFile2,
			@RequestParam("imageFiles") MultipartFile[] imageFiles ) throws IOException{
		//lay ds product tu btl_product trong db
		
		productService.saveAddProduct(product,avatarFile, avatarFile2,imageFiles);
		
		return "redirect:/admin/product/add";
	}
	
	
	@RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("productId") int productId) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		//lay product trong db
		Product product = productService.getById(productId);
		product.setUpdateDate(new Date());
		
		model.addAttribute("product", product);
		
		return "backend/product-edit";
	}
	
	@RequestMapping(value = "/edit-save" , method = RequestMethod.POST)
	public String productEditSave(final Model model,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("avatarFile2") MultipartFile avatarFile2,
			@RequestParam("imageFiles") MultipartFile[] imageFiles ) throws IOException{
		//lay ds product tu btl_product trong db
		
		productService.saveEditProduct(product,avatarFile,avatarFile2,imageFiles);
		
		return "redirect:/admin/product/list";
	}
	// delete product
	
	//xoa han
//	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
//	public String delete(final Model model,
//			@PathVariable("productId") int productId) {
//		
//
//		
//		//lay product trong db
//		Product product = productService.getById(productId);
//		
//		productService.deleteProductId(product);
//
//		return "redirect:/admin/product/list";
//	}
	// inactive 
	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("productId") int productId) {
		

		
		//lay product trong db
		Product product = productService.getById(productId);
		product.setStatus(false);
		productService.saveOrUpdate(product);

		return "redirect:/admin/product/list";
	}
	
	

}
