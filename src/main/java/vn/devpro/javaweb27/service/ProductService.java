package vn.devpro.javaweb27.service;




import java.io.File;
import java.io.IOException;
import java.util.Date;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.javaweb27.dto.SearchModel;
import vn.devpro.javaweb27.dto.jw27Constant;
import vn.devpro.javaweb27.model.Product;
import vn.devpro.javaweb27.model.ProductImage;


@Service
public class ProductService extends BaseService<Product> implements jw27Constant{

	@Override
	public Class<Product> clazz() {
		return Product.class;
	}
	
	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status = 1");
	}
	public List<Product> findAllActiveByCategoryId(Long categoryId) {
		 return super.executeNativeSql("SELECT * FROM tbl_product WHERE status = 1 AND category_id = " + categoryId);
	}
	
	
	public void deleteProductId(int id) {
		super.deleteById(id);
	}
	
	public boolean isUploadFile(MultipartFile file) {
		
		if (file == null || file.getOriginalFilename().isEmpty()) {
			return false; // khong upload
			
		}
		return true; //co upload
		
	}
	
	public boolean isUploadFiles(MultipartFile[] files) {
		
		if (files == null ||files.length == 0) {
			return false; // khong upload file
			
		}
		return true; //co upload it nhat 1 file
		
	}
	
	// save new product to db
	@Transactional
	public Product saveAddProduct(Product product , MultipartFile avatarFile,MultipartFile avatarFile2, MultipartFile[] imageFiles)
			throws IOException {
		
		if (isUploadFile(avatarFile)) {
			//luu file vaoo thu muc product/Avatar
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			//luu duong dan vao bang tbl product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());

		}
		////fixxx
		if (isUploadFile(avatarFile2)) {
			//luu file vaoo thu muc product/Avatar2
			String path = FOLDER_UPLOAD + "Product/Avatar2/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile2.transferTo(file);
			//luu duong dan vao bang tbl product
			product.setAvatar2("Product/Avatar2/" + avatarFile2.getOriginalFilename());

		}
		
		
		//luu images file
		
		if (isUploadFiles(imageFiles)) { //co up load ds anh
			//duyet ds file images
			
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) {//file co upload
					
					//luu file vao thu muc Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					
					//luu duong dan vao tbl product image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					
					//Luu duong dan anh sang tbl product image
					product.addRelationalProductImage(productImage);	
				}
			}
		}
		
		return super.saveOrUpdate(product);
	}
	
	@Transactional
	public Product saveEditProduct(Product product , MultipartFile avatarFile,MultipartFile avatarFile2, MultipartFile[] imageFiles) throws IOException{
		//lay product trong DB
		
		Product dbProduct = super.getById(product.getId());
		
		//luu avt moi neu ng dung co upload
		if (isUploadFile(avatarFile)) {
			
			//xoa avt cu
			String path = FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			
			//luu avt moi vao thu muc Product/Avatar
			path = FOLDER_UPLOAD + "Product/Avatar/" +avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			//luu duong dan cua avt mooi vao tbl_product
			product.setAvatar("Product/Avatar/"+ avatarFile.getOriginalFilename());
			
		}
		else {//nguoi dung ko upload avt
			product.setAvatar(dbProduct.getAvatar());
			
		}
		
		if (isUploadFile(avatarFile2)) {
			
			//xoa avt cu
			String path = FOLDER_UPLOAD + dbProduct.getAvatar2();
			File file = new File(path);
			file.delete();
			
			//luu avt moi vao thu muc Product/Avatar
			path = FOLDER_UPLOAD + "Product/Avatar2/" +avatarFile2.getOriginalFilename();
			file = new File(path);
			avatarFile2.transferTo(file);
			//luu duong dan cua avt mooi vao tbl_product
			product.setAvatar2("Product/Avatar2/"+ avatarFile2.getOriginalFilename());
			
		}
		else {//nguoi dung ko upload avt
			product.setAvatar2(dbProduct.getAvatar2());
			
		}
		//luu images file
		if (isUploadFiles(imageFiles)) { //co upload ds anh
			//duyet ds anh
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) { //file co upload
					//luu file vao thu muc Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					
					//luu duong dan vao tbl product image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					
					//Luu duong dan anh sang tbl product image
					product.addRelationalProductImage(productImage);
					
					
				}
			}
			
		}
		return super.saveOrUpdate(product);
	}
	
	// delete Product
	@Autowired
	private ProductImageService productImageService;
	
	@Transactional
	public void deleteProductId(Product product) {
		//lay ds anh cua product trong tbl product image
		String sql = "SELECT * FROM tbl_product_image WHERE product_id=" + product.getId();
		List<ProductImage> productImages = productImageService.executeNativeSql(sql);
		
		//xoa lan luot cac anh cua product trong Product/Image va trong tbl_product_image
		for (ProductImage productImage : productImages) {
			//xooa file trong folder product image
			String path = FOLDER_UPLOAD + productImage.getPath();
			File file = new File(path);
			file.delete();
			
			//xoa ban ghi thong tin anh trong tbl_product_image
//			product.removeRelationalProductImage(productImage); //restrict
			
		}
		
		//xoa file trong folder Product/Avatar
		String path = FOLDER_UPLOAD + product.getAvatar();
		File file = new File(path);
		file.delete();
		
		String path2 = FOLDER_UPLOAD + product.getAvatar2();
		File file2 = new File(path2);
		file2.delete();
		
		//xoa product trong db
		super.delete(product);

	}
	
	//search product--------------------
	public List<Product> searchProduct(SearchModel productSearch) {
		//tao cau lenh sql
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
		//tim kiem voi tieu chi status
		if (productSearch.getStatus() !=2) { // co chon Active/inactive
			
			sql += " AND p.status=" + productSearch.getStatus();
		}
		//tim kiem voi category
		if (productSearch.getCategoryId() !=0) {
			sql += " AND p.category_id=" + productSearch.getCategoryId();
			
		}
		
		// tim kiem voi keyword
		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			
			String keyword =  productSearch.getKeyword().toLowerCase();
			sql +=  " AND (LOWER(p.name) like '%" + keyword + "%'" +
					" OR LOWER(p.short_description) like '%" + keyword + "%'"+
					" OR LOWER(p.seo) like '%" + keyword + "%')"; 
	
		}
		// tim kiem voi ngay thang
		if (!StringUtils.isEmpty(productSearch.getBeginDate()) && !StringUtils.isEmpty(productSearch.getEndDate())) {
			
			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();
			
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" +endDate + "'"; 
			
		}
		return super.executeNativeSql(sql);
		
	}



	
}
