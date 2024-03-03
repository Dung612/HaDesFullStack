package Hades.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import Hades.main.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> {

	@Override
	public Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}

	public List<SaleOrderProduct> findSaleOrderProductById(int saleOrderid) {
	    return super.executeNativeSql("SELECT * FROM tbl_sale_order_product WHERE status = 1 AND sale_order_id = " + saleOrderid);
	}


}
