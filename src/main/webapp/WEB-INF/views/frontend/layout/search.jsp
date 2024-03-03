<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<div class="timkiem">
        <div class="title">
            <h2>TÌM KIẾM</h2>
            <button class="close"><i class="fa-solid fa-xmark"></i></button>
            
        </div>
        <form action="${classpath }/search"  method="get">
        <div class="search">
            <input type="text" id="search-input"  placeholder="TÌM KIẾM SẢN PHẨM">
        </div>
        <div class="sanphamtimkiem">
        <c:forEach items="${productsallactive }" var="product">
        <div class="spsearch" style="display: none;">
            <div class="ifspsearch" >
                        <div class="namespsearch">${product.name}</div>
                        <div class="pricespsearch"><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup></div>
                    </div>
                    <div class="imgspsearch">
                        <img src="${classpath }/FileUploads/${product.avatar }" alt="${product.name}">
                    </div> 

                    <a href="${classpath }/product-detail/${product.id}"></a>
             </div>
         </c:forEach>
        </div>
        </form>
        <script>
    document.getElementById('search-input').addEventListener('keyup', function() {
    	
        if (this.value === '') {
        	document.querySelector('.sanphamtimkiem').style.display = 'none';
        }
        else {
        	document.querySelector('.sanphamtimkiem').style.display = 'block';
        	searchProducts(this.value);
        	
        }
    });

    function searchProducts(keyword) {
        // Lọc danh sách sản phẩm dựa trên từ khóa
        var products = document.querySelectorAll('.spsearch');
        for (var i = 0; i < products.length; i++) {
            var productName = products[i].querySelector('.namespsearch').textContent.toLowerCase();
            if (productName.includes(keyword.toLowerCase())) {
                products[i].style.display = 'flex';
            } else {
                products[i].style.display = 'none';
            }
        }
    }
</script>
    </div>
    <div class="giohang">
        <div class="title">
            <h2>GIỎ HÀNG</h2>
            <button class="closegiohang close"><i class="fa-solid fa-xmark"></i></button>
        </div>

        <div class="spgiohang">
        <form   method="get"> 
       	<div class="content" id = "cart">
		<c:set var="totalPrice" value="0" />

			<c:forEach var="item" items="${cart.productCarts}" varStatus="loop">
			    <div class="contentform">
			        <div class="leftsp">
			            <div class="anh">  
			                <img src="${classpath}/FileUploads/${item.avatar}" alt="">
			            </div>
			            <div class="thongtin">
			                <div class="name">${item.productName}</div>
			                <div class="size">ĐEN / <SPan>${item.size}</SPan></div>
			                <div class="price">
			                    <div class="soluong"><span id="productQuantity_${item.productId}">${item.quantity}</span></div>
			                    <div class="gia"><fmt:formatNumber value="${item.price * item.quantity}" minFractionDigits="0"></fmt:formatNumber><sup>đ</sup></div>
			                </div>
			            </div>
			        </div>
			                
			        <div class="closesmall" onclick="removeFromCart(${item.productId},'${item.size}'),reloadPageAndShowCart()"><i class="fa-solid fa-xmark"></i></div>
			    </div>
			    <c:set var="totalPrice" value="${totalPrice + (item.price * item.quantity)}" />
			</c:forEach>
         
            </div>
            

            
            
            <div class="pricetotal">
                <div class="titlepricetotal">TOTAL</div>
                <div class="totalprice"><fmt:formatNumber value="${totalPrice}" minFractionDigits="0"></fmt:formatNumber><sup>đ</sup></div>
            </div> 
       </form>

            <div class="btngiohang">
                <div class="btnxemgiohang"  onclick="cartview()"><button class="xemgiohang" ><span>XEM GIỎ HÀNG</span></button></div>
                <div class="btnthanhtoan btnxemgiohang"  onclick="redirectToThanhToan()"><button class="thanhtoan xemgiohang"><span>THANH TOÁN</span></button></div>
            </div>

        </div>
    </div>
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
    <div class="backgroundmo"></div>