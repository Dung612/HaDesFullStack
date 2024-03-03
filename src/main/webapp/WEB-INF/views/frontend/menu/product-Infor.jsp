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
    <title>Hades</title>
    <link rel="stylesheet" href="${classpath}/frontend/accsents/base.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/shop.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/product-Infor.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/reponsive.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/fontawesome-free-6.4.0-web/css/all.min.css">

</head>
<body>
<!-- header -->
  <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <div class="productContent">
    <form class="form-inline" action="${classpath }/product-detail" method="get">
         <div class="ContentInfor"> 
            <div class="infors">
                    <div class="infor">
                     <h3>THÔNG TIN</h3>
                     <ul class="product-info-list"> 
                         <li> Quần lưng thun có dây rút</li>
                         <li> Sử dụng kỹ thuật ráp nối vải toàn thân quần</li>
                         <li> Đường line phản quang tạo điểm nhấn</li>
                         <li> Chi tiết chữ "H" thêu nổi ở mặt trước</li>
                         <li> Các chi tiết kim loại khác</li>
                         <li> Có hai túi hai bên</li>
                         <li> Chất liệu: Dù</li>
                         <li>Vận chuyển từ 2-3 ngày. 
                             Thiết kế và sản xuất bởi HADES.</li>
                     </ul>
                    </div>
                 </div>
                 <div class="imgProduct">
                     <div class="imgs">
                         <img src="${classpath }/FileUploads/${product.avatar }" alt="">
                         <c:forEach items="${productImages }" var="productImage">
                         <img src="${classpath }/FileUploads/${productImage.path }" alt="">
                         </c:forEach>
                     </div>
                 </div>
                 <div class="PayProduct">
                     <div class="ContentPay">
                         <div class="name"><h2>${product.name }</h2></div>
             <c:choose>
        		<c:when test="${not empty product.salePrice}">
        		<div style="display: flex; justify-content: left;">
                		 <div id="price-decor" style="padding-right: 20px;"> <span style="color: rgb(201, 35, 35); font-style: italic; font-size: 17px;">sale</span>
                		  <span style="margin-left: 12px; "><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup></span> </div>
            			<div class="price "><fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup> </div>
                </div>
                </c:when>
		        <c:otherwise>
		            <div class="price"><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup></div>
		        </c:otherwise>
		    </c:choose>
                         <div class="size">
                         <h4>kích thước</h4>
                         <select id="sizeSelect" name="Size" style="width: 100%;text-align: center;height: 40px;">
							    <c:choose>
						        <c:when test="${product.category.id == '3'}">
						            <!-- Hiển thị tùy chọn "Over Size" nếu categoryId là 3 -->
						            <option value="oversize" selected>Over Size</option>
						        </c:when>
						        <c:otherwise>
						            <!-- Hiển thị các tùy chọn "S", "M", "L" nếu categoryId không phải là 3 -->
						            <option value="S">S</option>
						            <option value="M">M</option>
						            <option value="L">L</option>
						        </c:otherwise>
						    </c:choose>
						</select>
                     </div>
                     <div class=" btnadd" onclick="addToCart(${product.id}, 1,$('#sizeSelect').val(), '${product.name}') , reloadPageAndShowCart()  " >THÊM VÀO GIỎ</div>
                     <div class=" btnpay" onclick="addToCart(${product.id}, 1, '${product.name }') ,redirectToThanhToan()">MUA NGAY</div>
                     </div>
                 </div>
         </div> 
</form>
    </div>
    <div class="RelatedProduct">
        <h2>SẢN PHẨM BÁN CHẠY</h2>
		<form  method="get">
		    <div class="sanpham">
		    
		<c:forEach items="${products}" var="product">
		   
		        <div class="sanpham1 col4s fontbasic">
		            <div class="anhsanpham">
		                <img src="${classpath}/FileUploads/${product.avatar}" alt="">
		                <a class="image-link" href="${classpath}/product-detail/${product.id}"></a>
		                <img class="anh2" src="${classpath}/FileUploads/${product.avatar2}" alt="">
		                <div class="chucnang">
		                    <div class="buy" onclick="addToCart(${product.id}, 1,'M', '${product.name}') ,redirectToThanhToan()">MUA NGAY</div>
		                    <div class="add" onclick="addToCart(${product.id}, 1,'M', '${product.name}') , reloadPageAndShowCart()">THÊM VÀO GIỎ</div>
		                </div>
		            </div>
		            <div class="tensanpham"><a href="${classpath}/product-detail/${product.id}">${product.name}</a></div>
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
		</form>


    </div>
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
        <div class="textfooter">
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
<!-- <script src="${classpath}/frontend/accsents/test.js"></script>
<script src="${classpath}/frontend/accsents/product-Infor.js"></script> -->
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
	</script>
</html>