package Hades.main.controller.backend;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Hades.main.controller.BaseController;
import Hades.main.model.Category;
import Hades.main.model.User;
import Hades.main.service.CategoryService;
import Hades.main.service.UserService;

@Controller
@RequestMapping("/admin/category/")
public class CategoryController extends BaseController{
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model) {
		
		List<Category> categories = categoryService.findAll();
		
		// chi hien thi doi tuong da active
	//	List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		
		return "backend/category-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userService.findAll();	
		model.addAttribute("users", users);
		
		Category category = new Category();
		category.setCreateDate(new Date());
		
		model.addAttribute("category", category);
		
		return "backend/category-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String addSave(final Model model,
			@ModelAttribute("category") Category category) {
		
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/list";	
	}
	
	@RequestMapping(value = "edit/{categoryId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("categoryId") int categororyId
			) {
		
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		//lay category trong db = id
		
		Category category = categoryService.getById(categororyId);
		category.setUpdateDate(new Date());
		
		
		model.addAttribute("category", category);
		
		return "backend/category-edit";
	}
	///error
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String editSave(final Model model,
			@ModelAttribute("category") Category category) {
		
		
		
		categoryService.saveOrUpdate(category);
		
		return "redirect:/admin/category/list";	
	}
	
	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("categoryId") int categororyId
			) {
		//xoa vinh vien~~~
//		categoryService.deleteCategoryById(categororyId);
		
		
		//bo active 
		Category category = categoryService.getById(categororyId);
		category.setStatus(false);
		categoryService.inactiveCategory(category);
		
		
		
		return "redirect:/admin/category/list";	
	}

}
