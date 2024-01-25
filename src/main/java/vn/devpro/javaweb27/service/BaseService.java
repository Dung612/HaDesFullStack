package vn.devpro.javaweb27.service;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;


import vn.devpro.javaweb27.model.BaseModel;

@Service
public abstract class BaseService<E extends BaseModel> {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public abstract Class<E> clazz();
	// lay 1 ban ghi theo id
	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}
	
//lay tat ca cac ban ghi tron 1 table
	@SuppressWarnings("unchecked")
	public List<E> findAll(){
		Table table = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name(), 
				clazz()).getResultList();
		
	}
	
	//them 1 hoac sua 1 ban ghi
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0 ) {
			entityManager.persist(entity);
			return entity;
			
		} else {
			return entityManager.merge(entity);

		}
	}
	
	//xoa 1 ban ghi theo entity
	public void delete(E entity) {
		entityManager.remove(entity);
	}
	
	//delete theo id 
	public void deleteById(int id) {
		E entity = this.getById(id);
		delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			return query.getResultList();			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	//get entity
	
}
