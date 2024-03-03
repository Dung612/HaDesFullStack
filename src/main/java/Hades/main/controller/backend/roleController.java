package Hades.main.controller.backend;

import java.io.IOException;
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
import Hades.main.model.Role;
import Hades.main.model.User;
import Hades.main.service.RoleService;
import Hades.main.service.UserService;

@Controller
@RequestMapping("/admin/role/")
public class roleController extends BaseController {

	
	@Autowired
	private RoleService roleSevice;
	
	@Autowired
	private UserService userSevice;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model) {
		
		List<Role> roles = roleSevice.findAllRoles();
		model.addAttribute("roles", roles);
		
		return "backend/role-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		
		List<User> users = userSevice.findAllUserActive();
		model.addAttribute("users", users);
		
		List<Role> roles = roleSevice.findAllRoles();
		model.addAttribute("roles", roles);
		
		Role role = new Role();
		role.setCreateDate(new Date());
		
		model.addAttribute("role", role);
		
		return "backend/role-add";
	}
	@RequestMapping(value = "/add-save" , method = RequestMethod.POST)
	public String userAddSave(final Model model,
			@ModelAttribute("role") Role role ) throws IOException{
			

		
		roleSevice.saveOrUpdate(role);
		
		return "redirect:/admin/role/list";	
	}
	
	@RequestMapping(value = "edit/{roleId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("roleId") int roleId
			) {
		List<Role> roles = roleSevice.findAllRoles();
		model.addAttribute("roles", roles);
		
		List<User> users = userSevice.findAllUserActive();
		model.addAttribute("users", users);
		
		//lay category trong db = id
		
		Role role = roleSevice.getById(roleId);
		role.setUpdateDate(new Date());
		
		
		model.addAttribute("role", role);
		
		return "backend/role-edit";
	}
	@RequestMapping(value = "/edit-save" , method = RequestMethod.POST)
	public String userEditSave(final Model model,
			@ModelAttribute("role") Role role ) throws IOException{

		roleSevice.saveOrUpdate(role);
		

		return "redirect:/admin/role/list";	
	}
	
	@RequestMapping(value = "/delete/{roleId}" , method = RequestMethod.GET)
	public String userDelete(final Model model,
			@PathVariable("roleId") int roleId ) throws IOException{
			//bo active
		
		Role role = roleSevice.getById(roleId);
		role.setStatus(false);
		roleSevice.inactiverole(role);
		
		return "redirect:/admin/role/list";	
	}
}
