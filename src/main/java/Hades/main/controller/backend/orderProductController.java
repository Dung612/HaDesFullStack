package Hades.main.controller.backend;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Hades.main.controller.BaseController;
import Hades.main.dto.SearchModel;
import Hades.main.dto.jw27Constant;
import Hades.main.model.Category;
import Hades.main.model.Product;
import Hades.main.model.SaleOrder;
import Hades.main.model.SaleOrderProduct;
import Hades.main.service.OrderService;
import Hades.main.service.SaleOrderProductService;





@Controller
@RequestMapping("/admin/order/")
public class orderProductController extends BaseController implements jw27Constant {

	@Autowired
	private OrderService orderSevice;
	
	@Autowired
	private SaleOrderProductService saleOrderProductService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model,
			final HttpServletRequest request) {
		SearchModel saleOrderSearch = new SearchModel();
		//tim theo status
		saleOrderSearch.setStatus(2);//all
		String status = request.getParameter("status");
		if (!StringUtils.isEmpty(status)) {// neu co chon status
			saleOrderSearch.setStatus(Integer.parseInt(status));
			
		}
		
		//tim theo keyword
		saleOrderSearch.setKeyword(null);//all
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword) ) {// neu co chon status
			saleOrderSearch.setKeyword(keyword);
					
		}
		
		// Kiem tra tieu chi tim kiem tu ngay den ngay
		String beginDate = null;
		String endDate = null;
		if (!StringUtils.isEmpty(request.getParameter("beginDate"))
				&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		saleOrderSearch.setBeginDate(beginDate);
		saleOrderSearch.setEndDate(endDate);
		
		//bat dau phan trang 
		
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // bam nut chuyen trang
			saleOrderSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
			
			
		}else {
			saleOrderSearch.setCurrentPage(1);
		}
		List<SaleOrder> allSaleOrders = orderSevice.searchProduct(saleOrderSearch);//timkiem
		List<SaleOrder> saleOrders = new ArrayList<SaleOrder>();//ds sp can hien thi trang hien tai 
		
		int totalPages =  allSaleOrders.size() / SIZE_OF_PAGE;
		if (allSaleOrders.size() % SIZE_OF_PAGE >0) { 
			totalPages ++;
			
		}
		
		//neu tong so trang nho hon trang hien tai (lai bam tim kiem)
		if (totalPages < saleOrderSearch.getCurrentPage()) {
			saleOrderSearch.setCurrentPage(1);
			
		}
		// lay danh sach san pham hien thi trong 1 trang
		
		int firstIndex = (saleOrderSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex , count =0 ;
		while (index < allSaleOrders.size() && count <SIZE_OF_PAGE) {
			saleOrders.add(allSaleOrders.get(index));
			index++;
			count++;;
			
			
		}
		
		// phan trang 
		
		saleOrderSearch.setSizeOfPage(SIZE_OF_PAGE);
		saleOrderSearch.setTotalItems(allSaleOrders.size());
		
		

		
		
//		List<SaleOrder> saleOrders = orderSevice.findAllOrders();
		model.addAttribute("saleOders", saleOrders);
		model.addAttribute( "saleOrderSearch",saleOrderSearch);
		
		return "backend/order-list";
	}
	@RequestMapping(value = "done-product/{saleOrderid}", method = RequestMethod.GET)
	public String Done(final Model model,
			@PathVariable("saleOrderid") int saleOrderid) {
		SaleOrder saleOrder = orderSevice.getById(saleOrderid);
		saleOrder.setStatus(true);
		orderSevice.saveOrUpdate(saleOrder);
		
		return "redirect:/admin/order/list";
	}
	
	@RequestMapping(value = "list-detail/{saleOrdercode}/{saleOrderid}", method = RequestMethod.GET)
	public String listdetail(final Model model,
			@PathVariable("saleOrderid") int saleOrderid,
			@PathVariable("saleOrdercode") long saleOrdercode) {
		
		List<SaleOrder> saleOrder  = orderSevice.findSaleOrderByCode(saleOrdercode);
		model.addAttribute("saleOrder", saleOrder);
		
		List<SaleOrderProduct> saleOrderProduct = saleOrderProductService.findSaleOrderProductById(saleOrderid);
		model.addAttribute("saleOrderProduct", saleOrderProduct);
		return "backend/order-list-detail";
	}
	
	@RequestMapping(value = "delete-product/{saleOrderid}", method = RequestMethod.GET)
	public String delete(final Model model,
			@PathVariable("saleOrderid") int saleOrderid) {
		SaleOrder saleOrder = orderSevice.getById(saleOrderid);
		
		orderSevice.deleteOrderById(saleOrder);
		
		return "redirect:/admin/order/list";
	}
}
