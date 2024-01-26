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
    <link rel="stylesheet" href="${classpath}/frontend/accsents/fontawesome-free-6.4.0-web/css/all.min.css">
</head>
<body>
    <!-- base header -->
   <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

    <!-- content shop -->

    <div class="selec">
        <select name="" id="sortSelect"> 
            
            <option value="increase">GIÁ: TĂNG DẦN</option>
            <option value="decrease">GIÁ: GIẢM DẦN</option>
            <option value="oldest">CŨ NHẤT </option>
            <option value="newest">MỚI NHẤT</option>
            <option value="bestseller">BÁN CHẠY NHẤT</option>
            
        </select>
    </div>
    <!-- danh muc san pham------------ --> 
<form method="get">
    <div class="sanpham">
    
    	<c:forEach items="${products }" var="product">
         <div class="sanpham1 col4s fontbasic">
            <div class="anhsanpham">
                <img src="${classpath }/FileUploads/${product.avatar }" alt="">
                <a class="image-link" href="${classpath }/product-detail/${product.id}"></a>
                <img class="anh2" src="${classpath }/FileUploads/${product.avatar2 }" alt="">
                <div class="chucnang">
                    <div class="buy" onclick="redirectToThanhToan()">MUA NGAY</div>
                    <div class="add" onclick="addToCart(${product.id}, 1, '${product.name }') , showCart()" >THÊM VÀO GIỎ</div>
                </div>
                </div>
                <div class="tensanpham"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></div>
                <div class="price"><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup>
                </div>
        </div>

 	</c:forEach>
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
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div class="textfooter">
            <p class="mess-text-title">SS23 MINI COLLECTION</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        <div  class="textfooter">
            <p class="mess-text-title">GET TO KNOW ABOUT OUR VIBE</p>
            <span class="mess-text-sub">HADES™ 2023</span>
        </div>
        
        
    </div>
    <div class="heart">
        <div class="boderheart">
            <a href=""><i class="fa-solid fa-heart"></i></a>
        </div>
    </div>

    <div class="messenger">
        <div class="bodermessenger">
            <a href=""><i class="fa-brands fa-facebook-messenger"></i></a>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
				
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message); 
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
<script src="${classpath}/frontend/accsents/base.js"></script>  


</html>