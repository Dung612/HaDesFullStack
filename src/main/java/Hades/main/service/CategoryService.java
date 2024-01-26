package Hades.main.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import Hades.main.model.Category;

@Service
public class CategoryService extends BaseService<Category> {

	@Override
	public Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}
	public List<Category> findAllActive(){
		return super.executeNativeSql("SELECT * FROM tbl_category WHERE status=1");
	}
	@Transactional
	public void deleteCategoryById(int id) {
		super.deleteById(id);
	}

	@Transactional
	public void updateCategory(Category category) {
		super.saveOrUpdate(category);
	}
	
	@Transactional
	public void inactiveCategory(Category category) {
		super.saveOrUpdate(category);
	}
	
	
	
	

}
