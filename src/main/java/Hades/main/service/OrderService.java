package Hades.main.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import Hades.main.dto.SearchModel;
import Hades.main.model.SaleOrder;
import Hades.main.model.SaleOrderProduct;

@Service
public class OrderService extends BaseService<SaleOrder> {

	@Override
	public Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	public List<SaleOrder> findAllOrdersActive(){
		return super.executeNativeSql("SELECT * FROM tbl_sale_order WHERE status = 1");
	}
	public List<SaleOrder> findAllOrders(){
		return super.executeNativeSql("SELECT * FROM tbl_sale_order ");
	}
	@Transactional
	public void deleteOrderById(SaleOrder saleOrder) {
		super.deleteById(saleOrder.getId());
		
	}
	public List<SaleOrder> searchProduct(SearchModel saleOrderSearch) {
		//tao cau lenh sql
		String sql = "SELECT p.* FROM tbl_sale_order p " +
                "INNER JOIN tbl_user u ON p.create_by = u.id " +
                "WHERE 1=1";
				//tim kiem voi tieu chi status
				if (saleOrderSearch.getStatus() !=2) { // co chon Active/inactive
					
					sql += " AND p.status=" + saleOrderSearch.getStatus();
				}

				
				// tim kiem voi keyword
				if (!StringUtils.isEmpty(saleOrderSearch.getKeyword())) {
					
					String keyword =  saleOrderSearch.getKeyword().toLowerCase();
					sql +=  " AND (LOWER(p.customer_name) like '%" + keyword + "%'" +
							" OR LOWER(p.customer_mobile) like '%" + keyword + "%'"+
							" OR LOWER(p.customer_address) like '%" + keyword + "%'"+
							" OR LOWER(u.username) like '%" + keyword + "%'"+
							" OR LOWER(p.customer_email) like '%" + keyword + "%')"; 
			
				}
				// tim kiem voi ngay thang
				if (!StringUtils.isEmpty(saleOrderSearch.getBeginDate()) && !StringUtils.isEmpty(saleOrderSearch.getEndDate())) {
					
					String beginDate = saleOrderSearch.getBeginDate();
					String endDate = saleOrderSearch.getEndDate();
					
					sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" +endDate + "'"; 
					
				}
				return super.executeNativeSql(sql);
	}
	public List<SaleOrder> findSaleOrderByCode(long saleOrdercode) {
		// TODO Auto-generated method stub
		return super.executeNativeSql("SELECT * FROM tbl_sale_order WHERE code = " + saleOrdercode);
	}





}
