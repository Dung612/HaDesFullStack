package Hades.main.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Hades.main.dto.jw27Constant;
import Hades.main.model.Role;
import Hades.main.model.SaleOrder;
import Hades.main.model.User;

@Service
public class RoleService extends BaseService<Role> implements jw27Constant {

	@Override
	public Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}

	public Role getRoleByName(String name) {
		
		String sql = "SELECT * FROM tbl_role WHERE name='" + name + "'";
		List<Role> roles = super.executeNativeSql(sql);
		
		if (roles.size() > 0 ) {
			return roles.get(0);
			
		}else {
			return new Role();
		}
		
	}
	public List<Role> findAllRoles(){
		return super.executeNativeSql("SELECT * FROM tbl_role ");
	}
	public List<Role> findAllRoleActive() {
		return super.executeNativeSql("SELECT * FROM tbl_role WHERE status=1");
	}
	@Transactional
	public void inactiverole(Role role) {
		super.saveOrUpdate(role);
		
	}

}
