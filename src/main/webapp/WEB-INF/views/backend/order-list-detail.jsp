<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Favicon icon -->
<link rel="shortcut icon" href="//theme.hstatic.net/1000306633/1000891824/14/favicon.png?v=587" type="image/png">
	<title>${projectTitle }</title>
	
	<!-- variables -->
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	
	<!-- Custome css resource file -->
	<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>

</head>

<body>


	<!-- End test -->
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
		<!-- End Topbar header -->

		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="/WEB-INF/views/backend/layout/left-slide-bar.jsp"></jsp:include>
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->

		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 align-self-center">
						<h2
							class="page-title text-truncate text-dark font-weight-medium mb-1">Order
							Tracking</h2>
					</div>
				</div>
			</div>
			
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<form  method="get">
					
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											<div>
											<table 
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr align="center">
														<th scope="col">No.</th>
														<th scope="col">Code</th>
														<th scope="col">Name</th>
														<th scope="col">Mobile</th>
														<th scope="col">Address</th>
														<th scope="col">Total Price</th>
														<th scope="col">User Name</th>
														<th scope="col">Time Create</th>
														<th scope="col">Status</th>
														

	
													</tr>
												</thead>
											<tbody>
												<c:forEach var="saleOrder" items="${saleOrder }"
														varStatus="loop">
														<tr>
															<th scope="row">${loop.index + 1 }</th>
	
															<td align="center">${saleOrder.code }</td>
															<td>${saleOrder.customerName }</td>
															<td align="center">${saleOrder.customerMobile }</td>
															<td>${saleOrder.customerAddress }</td>
															<td align="right"><fmt:formatNumber
																	value="${saleOrder.total }" minFractionDigits="0"></fmt:formatNumber>
															</td>
															<td>${saleOrder.userCreateSaleOrder.username }</td>
															<%-- <td>${saleOrder.updateBy }</td> --%>
															<td><fmt:formatDate pattern="dd-MM-yyyy"
																	value="${saleOrder.createDate}" /></td>
															
	
															<td><c:choose>
																	<c:when test="${saleOrder.status }">
																		Đã giao hàng
																	</c:when>
																	<c:otherwise>Chưa giao hàng</c:otherwise>
																</c:choose></td>
															
														</tr>
														<c:set var="totalSales" value="${totalSales + saleOrder.total }" />
													</c:forEach>
													</tbody>
											
											
											
											
											</div>
											
		
											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr align="center">
														<th scope="col">No.</th>
														<th scope="col">Name Product</th>
														<th scope="col">Avatar Product</th>
														<th scope="col">Size</th>
														<th scope="col">Price</th>
														<th scope="col">Quantity</th>
														<th scope="col">Total Price</th>
														<th scope="col">Status</th>

	
													</tr>
												</thead>
												<tbody>
												<c:set var="totalSales" value="0" />
													<c:forEach var="saleOrderProduct" items="${saleOrderProduct }"
														varStatus="loop">
														<tr style="background-color: white;">
															<th scope="row">${loop.index + 1 }</th>
					
															<td align="center">${saleOrderProduct.product.name }</td>
															<td style=" display: flex; justify-content: center;    padding: 2px;">
	                                                			<img style="    width: 80px;height: 80px;object-fit: contain;" 
	                                                		src="${classpath }/FileUploads/${saleOrderProduct.product.avatar }" class="light-logo">
	                                                		</td>
															<td align="center">${saleOrderProduct.size }</td>
															<td align="center">
															    <c:choose>
														        <c:when test="${saleOrderProduct.product.salePrice != null}">
														            <fmt:formatNumber value="${saleOrderProduct.product.salePrice}" minFractionDigits="0"/><sup>đ</sup>
														        </c:when>
														        <c:otherwise>
														            <fmt:formatNumber value="${saleOrderProduct.product.price}" minFractionDigits="0"/><sup>đ</sup>
														        </c:otherwise>
														    </c:choose>
															</td>
															
															
															
															<td>${saleOrderProduct.quantity }</td>
															
															<c:choose>
														        <c:when test="${saleOrderProduct.product.salePrice != null}">
															<td align="center"><fmt:formatNumber value="${saleOrderProduct.quantity * saleOrderProduct.product.salePrice}" minFractionDigits="0"></fmt:formatNumber><sup>đ</sup></td>
															</c:when>
															<c:otherwise>
															<td align="center"><fmt:formatNumber value="${saleOrderProduct.quantity * saleOrderProduct.product.price}" minFractionDigits="0"></fmt:formatNumber><sup>đ</sup></td>
															</c:otherwise>
														    </c:choose>
															
															
															
															
															 
															<td>${saleOrderProduct.status }</td>
															
	
															
															
														</tr>
														
														<c:choose>
														        <c:when test="${saleOrderProduct.product.salePrice != null}">
														        <c:set var="totalPrice" value="${totalPrice + (saleOrderProduct.quantity * saleOrderProduct.product.salePrice)}" />
														        </c:when>
														        <c:otherwise>
														<c:set var="totalPrice" value="${totalPrice + (saleOrderProduct.quantity * saleOrderProduct.product.price)}" />
														</c:otherwise>
														    </c:choose>
													</c:forEach>
												</tbody>
											</table>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<h3>
															Total sales:
															<fmt:formatNumber value="${totalPrice }"
																minFractionDigits="0"></fmt:formatNumber>(vnđ)
														</h3>
													</div>
												</div>
	

											</div>
											
											<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <a href="${classpath }/admin/order/list" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Back to list
			                                        </a>
                                    				
                                        		</div>
	                                    	</div>
										</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				</form>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->

	<!-- Slider js: All Jquery-->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${saleOrderSearch.status});
			
			$("#paging").pagination({
				currentPage: ${saleOrderSearch.currentPage}, //Trang hien tai
				items: ${saleOrderSearch.totalItems}, //Tong so don hang (total sale orders)
				itemsOnPage: ${saleOrderSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
	
</body>

</html>