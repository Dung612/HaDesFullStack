package Hades.main.service;



import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import Hades.main.model.User;
@Service
public class UserDetailsServiceImpl extends BaseService<User> implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//lay user trong tbl_user theo username
		
		String sql = "SELECT * from tbl_user u where u.username='" + username + "'and u.status=1";
		User user = this.getEntityByNativeSQL(sql);
				
		if(user != null) {
			System.out.println("username: " + user.getUsername());
			System.out.println("Password: " + user.getPassword());	
			return  user;
		}

		
		else return  new User();
	}




	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	

}
