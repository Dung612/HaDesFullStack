<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HADES STUDIO</title>
    <link rel="stylesheet" href="${classpath}/frontend/accsents/base.css">

    <link rel="stylesheet" href="${classpath}/frontend/accsents/reponsive.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/fontawesome-free-6.4.0-web/css/all.min.css">
</head>
<style>

.cartItem{
    display: flex; margin: 6px 0; justify-content: space-between; align-items: center; height: 100px; width: 100%;
    padding: 4px 8px ;border: 1px solid black;
    background-color: white;

}
.cartItem  .daleteItemCart{
    background-color: transparent;
    border: none;
    font-size: 18px;
    padding: 4px;
    margin: 0 12px;
    
}
.soluongItem .update{
    height: 20px;
    width: 20px;
    font-size: 18px;
    line-height: 1;
    cursor: pointer;
    margin: 0 10px;
}

    .imgCartItem img{
        margin: auto;
        height: 80px;
        width: 80px;
        object-fit: contain;

    }
    .cartContentTotal{
        width: 20%;
        border: 1px solid black;
        height: 220px;
        border-radius: 2px;
        margin: 0 20px;
        padding: 12px;
        font-weight: 500;
        

    }
    .cartContentTotal .titleTotal{
        text-align: center;
        font-weight: 600;
    }
    .cartContentTotal .total{
        display: flex;
        justify-content: space-between;
        padding: 32px 0;
    }
    .doneCartItem{
        margin-top: 40px;
        width: 100%;
        height: 40px;   
        background-color: black;
        cursor: pointer;
        color: white;
        font-size: 18px;
        font-weight: 300;
        position: relative;
        
    }
    .total .totalright {
        color: rgb(196, 41, 41);
    }
        .doneCartItem a{
        text-decoration: none;
        color: white;
        position: absolute;
        top: 0;
        bottom: 0;
        right: 0;
        left: 0;
        font-size: 18px;
        line-height: 2;
    }
</style>
<body>
    <!-- header -->
      	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    
    <div class="titleCartContent" style="margin: 120px 220px; text-align: center;"><h1>GIỎ HÀNG CỦA BẠN</h1></div>
<form method="get">
    <div class="cartContent" style="margin: 20px 220px; display: flex; justify-content: space-between;" >
        
        <div class="cartContentItem" style="width: 80%; background-color: rgb(227, 227, 227); padding: 12px; height: auto;">
        <c:forEach var="item" items="${cart.productCarts }" varStatus="loop">
            <div class="cartItem" >
                <div class="imgCartItem" style="width: 15%;"><img src="${classpath}/FileUploads/${item.avatar }" alt=""></div>
                <div class="nameCartItem" style="width: 25%; text-align: center;">${item.productName }</div>
                <div class="soluongItem" style="width: 20%;">
                <button class="update updateUp" onclick="updateProductQuantity(${item.productId }, -1,'${item.size}')" value="-">-</button> 
                <span id="productQuantity_${item.productId }">${item.quantity }</span>/<SPan>${item.size}</SPan>
                <button class="update updateDown" onclick="updateProductQuantity(${item.productId }, 1,'${item.size}')" value="+">+</button> </div>
                <div class="totalItem" style="width: 20%;"><fmt:formatNumber value="${item.price }" minFractionDigits="0" /> </div>
                <div class="totalsItem" style="width: 20%;"><fmt:formatNumber value="${item.price * item.quantity }" minFractionDigits="0" />
                  <button class="daleteItemCart" onclick="removeFromCart(${item.productId},'${item.size}')"><i class="fa-solid fa-trash"></i></button></div>

            </div>
        </c:forEach>
            <div class="texttarea" style="display: flex; justify-content: space-between; align-items: center; margin: 82px 0;">
                <textarea name="" id="" cols="30" rows="10" style="height: 140px; width: 230px;"></textarea>
                <div class="chinhsach">
                    <ul> <h3>Chính sách Đổi/Trả</h3>
                        <li>Sản phẩm được đổi 1 lần duy nhất, không hỗ trợ trả.</li>
                        <li>Sản phẩm còn đủ tem mác, chưa qua sử dụng.</li>
                        <li>Sản phẩm nguyên giá được đổi trong 30 ngày trên toàn hệ thống.</li>
                        <li>Sản phẩm sale chỉ hỗ trợ đổi size (nếu cửa hàng còn) trong 7 ngày trên toàn hệ thống.</li>
                    
                    </ul>
                </div>
            </div>
        </div>
        <div class="cartContentTotal">
            <div class="titleTotal">
                Thông tin đơn hàng
            </div>
            <div class="total">
                <div class="totalleft">Tổng Tiền :</div>
                <div class="totalright"><fmt:formatNumber value="${totalCartPrice }" minFractionDigits="0"></fmt:formatNumber><sup>đ</sup></div>
            </div>
            <button class="doneCartItem" ><a href="/thanhtoan">Thanh Toán</a></button>
        </div>
    </div>
 </form>

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
    
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		function _placeOrder() {
			//javascript object
			let data = {				
				txtName : jQuery("#txtName").val(),
				txtEmail : jQuery("#txtEmail").val(), //Get by Id
				txtMobile : jQuery("#txtMobile").val(),
				txtAddress : jQuery("#txtAddress").val(),
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>

<script src="${classpath}/frontend/accsents/base.js"></script>
</html>