<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="//theme.hstatic.net/1000306633/1000891824/14/favicon.png?v=587" type="image/png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tất Cả Sản Phẩm - HADES STUDIO</title>
    <link rel="stylesheet" href="${classpath}/frontend/accsents/base.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/shop.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/reponsive.css">
    <link href="${classpath}/backend/dist/css/simplePagination.css" rel="stylesheet">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/fontawesome-free-6.4.0-web/css/all.min.css">
</head>
<body>
    <!-- base header -->
   <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

    <!-- content shop -->
    <script>
    // Lấy đường dẫn hiện tại của URL
    var currentUrl = window.location.href;

    // Tách phần số ở cuối đường dẫn 
    var categoryId = currentUrl.substring(currentUrl.lastIndexOf('/') + 1);

    // Cập nhật action của form với categoryId đã lấy được
    var form = document.getElementById('shopForm');
    form.action = "/shop/" + categoryId;
</script>
<form id="shopForm"  method="get">
    <div class="selec">
        <select name="status" id="sortSelect"> 
            
            <option value="0">GIÁ: TĂNG DẦN</option>
            <option value="1">GIÁ: GIẢM DẦN</option>
            <option value="2">CŨ NHẤT </option>
            <option value="3">MỚI NHẤT</option>
            <option value="4">BÁN CHẠY NHẤT</option>
            
        </select>
        <button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary" style="display: none;">Search</button>
        <input id="currentPage" name="currentPage" class="form-control"
														value="${productSearch.currentPage }" style="display:none;">
        <script type="text/javascript">
        document.getElementById('sortSelect').addEventListener('change', function() {
            document.getElementById('btnSearch').click();
        });
		</script>

    </div>
    <!-- danh muc san pham------------ --> 

    <div class="sanpham">
    
    	<c:forEach items="${products }" var="product">
         <div class="sanpham1 col4s fontbasic">
            <div class="anhsanpham">
                <img src="${classpath }/FileUploads/${product.avatar }" alt="">
                <a class="image-link" href="${classpath }/product-detail/${product.id}"></a>
                <img class="anh2" src="${classpath }/FileUploads/${product.avatar2 }" alt="">
                <div class="chucnang">
                <c:choose>
						        <c:when test="${product.category.id == '3'}">
						        <div class="buy" onclick="addToCart(${product.id}, 1,'oversize', '${product.name }') ,redirectToThanhToan()">MUA NGAY</div>
                    <div class="add" onclick="addToCart(${product.id}, 1,'oversize', '${product.name }') , reloadPageAndShowCart()  " >THÊM VÀO GIỎ</div>
						        </c:when>
						        <c:otherwise>
                    <div class="buy" onclick="addToCart(${product.id}, 1,'M', '${product.name }') ,redirectToThanhToan()">MUA NGAY</div>
                    <div class="add" onclick="addToCart(${product.id}, 1,'M', '${product.name }') , reloadPageAndShowCart()  " >THÊM VÀO GIỎ</div>
                     </c:otherwise>
						    </c:choose>
                </div>
                </div>
                <div class="tensanpham"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></div>
         <c:choose>
        		<c:when test="${not empty product.salePrice}">
        		<div style="display: flex; justify-content: center;">
                		 <div id="price-decor" style="padding-right: 20px;"> <span style="color: rgb(201, 35, 35); font-style: italic; font-size: 17px;">sale</span>
                		  <span style="margin-left: 12px; "><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup></span> </div>
            			<div class="price "><fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup> </div>
                </div>
                </c:when>
        <c:otherwise>
            <div class="price"><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup></div>
        </c:otherwise>
    </c:choose>
                </div>
       

 	</c:forEach>
    </div>
    
		<div class="pagination " style="display: flex; justify-content: center;">
			<div id="paging"></div>
		</div>
	 
</form>

    <!-- base bottom -->
    <div class="textslideshow">
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>streetwear brand limited</p>
            </span>
        </div>
        

    </div>
    <footer>
            <div class="content1 col4">
                <p class="titlefooter">HỆ THỐNG CỬA HÀNG HADES</p>
                <ul>
                    
                    <li>HADES STUDIO FLAGSHIP STORE: 69 QUANG TRUNG STREET, GO VAP DISTRICT, HOCHIMINH.</li>
                    <li>Store 2: 26 LY TU TRONG STREET, DISTRICT 1, HOCHIMINH (THE NEW PLAYGROUND).</li>
                    <li>Store 3: 350 DIEN BIEN PHU STREET, WARD 7, BINH THANH DISTRICT, HOCHIMINH (G-TOWN).</li>
                    <li>Store 4: 140 NGUYEN HY QUANG, DONG DA DISTRICT, HANOI.</li>
                    <li>Store 5: 4 PHAM NGU LAO STREET, DISTRICT 1, HOCHIMINH.</li>
                    <li>Store 6: 136 NGUYEN HONG DAO STREET, TAN BINH DISTRICT, HOCHIMINH.</li>
                    <li>Store 7: 56 MAU THAN, NINH KIEU DISTRICT, CANTHO.</li>
                </ul>

            </div>
            <div class="footerres">
                <div class="content2 col4">
                    <p class="titlefooter">CHÍNH SÁCH</p>
                    <ul>
                        
                        <li><a href="">Chính sách sử dụng website</a></li>
                        <li><a href="">Phương thức thanh toán</a></li>
                        <li><a href="">Chính sách đổi trả</a></li>
                        <li><a href="">Chính sách giao nhận - vận chuyển</a></li>
                        <li><a href="">Điều khoản dịch vụ</a></li>
                        <li><a href="">Hướng dẫn mua hàng</a></li>
                        <li><a href="">Chính sách bảo mật</a></li>
                    </ul>
    
                </div>
                <div class="content3 col4">
                    <p class="titlefooter">THÔNG TIN LIÊN HỆ</p>
                    <ul>
                        
                        <li>CÔNG TY TNHH HADES Địa chỉ: 147 Bùi Đình Tuý, Phường 24, Bình Thạnh, Thành phố Hồ Chí Minh</li>
                        <li>SỐ CSKH: 02873011021 (10h -18h)</li>
                        <li>Ngày cấp: 20/07/2020</li>
                        <li>Tuyển dụng: hr@hades.vn</li>
                        <li>Website: hades.vn</li>
                        <li>For business: contact@hades.vn</li>
                    </ul>
    
                </div>
                <div class="content4 col4">
                    <p class="titlefooter">FOLLOW US ON SOCIAL MEDIA</p>
                    
                    <div class="social">
                        <a href=""><i class="fa-brands fa-square-facebook"></i></a>
                        <a href=""><i class="fa-brands fa-square-instagram"></i></a>
                    </div>
                    <a href="">
                        <img src="${classpath}/frontend/accsents/accsent/img/logo_bct_img_3c1bf699d3004ef2887fee1c4eb20afd.webp" alt="">
                    </a>
    
    
                </div>
            </div>



    </footer>
    <div class="slideshowfooter">
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        <div  class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2024</span>
        </div>
        
        
    </div>
    <div class="heart">
        <div class="boderheart">
            <a href="https://www.facebook.com/hadesvietnam/"><i class="fa-solid fa-heart"></i></a>
        </div>
    </div>

    <div class="messenger">
        <div class="bodermessenger">
            <a href="https://www.facebook.com/messages/t/1489313121348883"><i class="fa-brands fa-facebook-messenger"></i></a>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/frontend/layout/search.jsp"></jsp:include>
    <div id="mess">
        <!-- <div class="icon">
            <i class="fa-solid fa-circle-check"></i>
        </div>
        <div class="text">
            <div class="title">Success</div>
            <div class="textmess">Bạn đã đăng kí thành công</div>

        </div>
        <div class="close">
            <i class="fa-solid fa-xmark"></i>
        </div> -->
    </div>
    
    
</body>
<!-- <script src="${classpath}/frontend/accsents/test.js"></script> -->
<!-- <script src="${classpath}/frontend/accsents/shop.js"></script> -->
<!-- Jquery -->
<script src="${classpath}/frontend/accsents/base.js"></script> 
<script>


function reloadPageAndShowCart() {
    // Lưu trạng thái reloadCalled vào localStorage
    localStorage.setItem('reloadCalled', 'true');
    
    // Tải lại trang sau độ trễ
    setTimeout(function() {
        location.reload();
    }, 200);
}

// Gọi showCart() sau khi trang đã tải hoàn toàn
window.addEventListener('load', function() {
    // Kiểm tra nếu reloadCalled đã được set trong localStorage
    var reloadCalled = localStorage.getItem('reloadCalled');
    if (reloadCalled === 'true') {
        showCart(); // Chỉ gọi showCart() nếu reloadPageAndShowCart() đã được gọi
        // Xóa trạng thái reloadCalled khỏi localStorage
        localStorage.removeItem('reloadCalled');
    }
});

</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _Size, _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
				size: _Size
				
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
					
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				}
			});
		}
	</script>
		<script type="text/javascript">
		updateProductQuantity = function(_productId, _quantity,_Size) {
			let data = {
				productId : _productId, //lay theo id
				quantity : _quantity,
				size: _Size
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/update-product-quantity",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					let totalProducts = jsonResult.totalCartProducts; 
					//Viet lai so luong sau khi bam nut -, +
					$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
		<script type="text/javascript">
    removeFromCart = function(_productId, _Size) {		
        let data = {
            productId: _productId,
            size: _Size
        };
            
        //$ === jQuery
        jQuery.ajax({
            url : "/remove-from-cart",
            type : "POST",
            contentType: "application/json",
            data : JSON.stringify(data),
            dataType : "json",
            
            success : function(jsonResult) {
                let totalProducts = jsonResult.totalCartProducts;
                $("#totalCartProductsId").html(totalProducts);
            },
            
            error : function(jqXhr, textStatus, errorMessage) {
                alert(jsonResult.code + ': Đã có lỗi xảy ra...!')
            }
        });
    }
</script>
<script src="${classpath}/backend/dist/js/jquery.simplePagination.js"></script>

	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#sortSelect").val(${productSearch.status});
			
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
	<script type="text/javascript">
	$.ajax({
	    url: '/api/products',
	    type: 'GET',
	    success: function(products) {
	        // Xử lý danh sách sản phẩm ở đây
	        console.log(products);
	    },
	    error: function(xhr, status, error) {
	        // Xử lý lỗi nếu có
	        console.error(xhr.responseText);
	    }
	});</script>
 


</html>