package vn.devpro.javaweb27.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.devpro.javaweb27.model.SaleOrder;
@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	public Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Transactional
	public SaleOrder saveOrder (SaleOrder saleOrder) {
		return super.saveOrUpdate(saleOrder);
	}

}
