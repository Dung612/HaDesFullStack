package Hades.main.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import Hades.main.model.User;

@Service
public class UserService extends BaseService<User> {
	
	@Override
	public Class<User> clazz() {
		return User.class;
	}
	
	public List<User> findAllUserActive() {
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status=1");
	}
	public List<User> findAllUser() {
		return super.executeNativeSql("SELECT * FROM tbl_user");
	}
	
	@Transactional
	public void deleteUserById(int id) {
		super.deleteById(id);
	}
	@Transactional
	public void inactiveUser(User user) {
		super.saveOrUpdate(user);
		
	}
}
