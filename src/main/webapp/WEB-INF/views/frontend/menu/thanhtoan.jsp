<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <link rel="shortcut icon" href="//theme.hstatic.net/1000306633/1000891824/14/favicon.png?v=587" type="image/png">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/fontawesome-free-6.4.0-web/css/all.min.css">
    
    <title>Thanh Toán - HADES STUDIO</title>
</head>
<style>
    
    @font-face {
    font-family:Oswald ;
    src: url(./accsent/font/Oswald-VariableFont_wght.ttf);
}
@font-face {
    font-family: quicksand;
    src: url(./accsent/font/Quicksand/Quicksand-VariableFont_wght.ttf);
}
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    transition:  0.4s ease;
    text-decoration: none;
    
    
}
.thanhtoan{
    display: flex;

}
.thanhtoanr{
    padding: 56px 0;
    background-color: rgb(232, 232, 232);
    width: 40%;
    overflow : hidden;
    height: 100vh;
}
.thanhtoanl{
    padding: 56px 40px;
    width: 60%;
    padding-left: 12%;
    height: 100vh;

}
.thanhtoanl div{
    margin: 8px 0;
    
}
.thanhtoan input{
    width: 100%;
    height: 44px;
    border-radius: 8px;
    border: 1px solid rgb(152, 152, 152);
    margin: 6px 0;
    padding: 12px;
    
}
.thanhtoan a{
    color: rgb(59, 131, 212);
}
.thanhtoanl-emailsdt{
    display: flex;
}

.thanhtoanl-emailsdt .email{
    width: 70%;
    margin-right: 8px;
}
.thanhtoanl-emailsdt .sdt{
    width: 30%;
}
.thanhtoanl-phuongthuc input{
    width: 18px;
    margin-right:8px ;
    cursor: pointer;
}
.thanhtoanl-phuongthuc{
    display: flex;
    align-items: center;
    border: 1px solid rgb(152, 152, 152);
    border-radius: 8px;
    padding: 0 10px;
}
.thanhtoanl button{
    float:right;
    cursor: pointer;
    height: 54px;
    background-color: #338dbc;
    border-radius: 8px;
    color: white;
    width: 180px;
    border: none;
    margin: 12px 0;
}
h1{
    margin: 12px 0;
    font-weight: 300;
        
}
.thanhtoanl-api{
    display: flex;
    justify-content: space-between;
}
.thanhtoanl-api select{
    width: 32.5%;
    height: 44px;
    border-radius: 8px;
    

}
h4{
    margin-top: 12px;
    font-size: 17px;
}
.thanhtoan .thanhtoanl-title{
    font-size: 18px;
    font-weight: 500;
    margin-top: 18px;
}
.thanhtoan button:hover {
    background-color: #338cbcb6;
}
.thanhtoanr-mgg , .thanhtoanr-dangnhap{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    border-bottom: 2px solid rgb(156, 156, 156) ;
    margin-bottom: 12px;
    padding: 10px;
}
.thanhtoanr-mgg input{
    width: 60%;
}
.thanhtoanr button{
    width: 120px ; 
    height: 44px;
    border-radius: 8px;
    background-color: #338dbc;
    color: white;
    border: none;
    cursor: pointer;
    margin-left: 8px;
    
}
.thanhtoanr-dangnhap .title{
    width: 70%;
    
}
.spgiohang{
    width: 100%;
    height: 100vh;
    
    padding: 20px;
    
    
    z-index: 100000;
    transition: .4s linear;

}
.spgiohang .content{
    display: flex;
    justify-content: center;
    
    width: 100%;
    padding-bottom: 12px;
    border-bottom: 3px solid black;
    flex-wrap: wrap-reverse;
        height: 50vh;
    overflow: scroll;

}
.content::-webkit-scrollbar {
    width: 4px; /* Chiều rộng thanh cuộn */
  }
.content::-webkit-scrollbar-thumb {
    background: #888; /* Màu nền của thanh cuộn */
    border-radius: 6px; /* Đường viền cong của thanh cuộn */
  }

.spgiohang{
    padding: 30px;
    overflow: scroll;
    height: 90%;
    overflow-x: hidden;
}
.spgiohang::-webkit-scrollbar {
    width: 4px; /* Chiều rộng thanh cuộn */
  }
.spgiohang::-webkit-scrollbar-thumb {
    background: #888; /* Màu nền của thanh cuộn */
    border-radius: 6px; /* Đường viền cong của thanh cuộn */
  }
.spgiohang .contentform{
    
    
    
    align-items: center;
    border-bottom: 1px solid rgba(195, 195, 195, 0.653);
}
.contentform{
    width: 100%;

   
}
.spgiohang .anh {
    
    width: 18%;
    margin: 18px;
    
}
.leftsp{
    display: flex;
    align-items: center;
    border-top: 1px solid black;
}

.spgiohang .anh img{
    width: 100%;
    height: auto;
    border-radius: 8px;
}
.spgiohang .price{
    display: flex;
}
.soluong{
    width: 24px;
    height: 24px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #d4d4d4da;
    padding: 6px;
    margin-right: 6px;
}
.pricetotal{
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-family: Oswald;
    margin: 18px 0;
}
.thongtin .size{
    margin: 8px 0;
}
.thongtin{
    font-size: 14px;
}

.title{
    
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 24px;
    margin-top: 12px;
   
}
.title .close i{
    color: black;
    cursor: pointer;
    background-color: white;
    font-size: 28px;
    
}
.close{
    border: none;
    background-color: transparent;
}
.titlesmall{
    width: 60%;
}
#mess{
    position: fixed;
    right: 26px;
    top: 50px;
    z-index: 100000;
}
.mess{
    
    display: flex;
    border-left: 6px  solid rgb(66, 169, 217);
    height: 96px;
    width: 340px;
    border-radius: 12px;
    padding: 12px;
    align-items: center;
    justify-content: space-between;
    background-color: #000000b8;
    /* animation: slide ease .3s , fadeout linear 1s 3s forwards; */
    
    
    
}
@keyframes slide{
    from{
        transform: translateX(calc(100% + 26px));
        opacity: 0;
    }
    to{
        transition: translateX(0);
        opacity: 1;
    }
}
@keyframes fadeout{
    from{
        opacity: 1;

    }to{
        opacity: 0;

    }
}
.icon i{
    font-size: 40px;
}
.mess .title{
    font-size: 20px;
    font-weight: bold;
    margin: 0px 0;
    height: 10px;
}
.mess .textmess{
    color: aliceblue;
}
.close{
    color: aliceblue;
}
.close{
    cursor: pointer;
    font-size: 20px;
}
.success .icon {
    color: greenyellow;

}
.content .success{
    border-color: greenyellow;
    background-color: rgb(48, 48, 48);

}
.success .title {
    color: greenyellow;

}

.warning .icon {
    color: rgb(244, 55, 55);

}
.content .warning{
    border-color: rgb(244, 55, 55);
    background-color: rgb(48, 48, 48);

}
.warning .title {
    color: rgb(244, 55, 55);

}
#mess .textmess{
    line-height: 1;
    font-size: 16px;
    font-weight: 300;
}

</style>
<link rel="stylesheet" href="${classpath}/frontend/accsents/reponsive.css">
<body>
<div class="thanhtoan">
    <div class="thanhtoanl">
    <form action="${classpath }/cart-view" method="get">
        <h1 onclick="redirectToindex()" style="cursor: pointer;" >HADES STUDIO</h1>
        <div class="thanhtoanl-giohang">
            <a href="${classpath}/frontend/accsents/shop.html">Shop all</a> <span>></span> <span>Thông tin giao hàng</span>

        </div>
        <div class="thanhtoanl-title">Thông Tin Giao Hàng</div>
        <div class="thanhtoanl-dangnhap">
                        <c:choose>
                 <c:when test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
            <span>Bạn đã có tài khoản ?</span><a href="${classpath}/login">Đăng Nhập</a>
             </c:when>
                    <c:otherwise>
                    
                    <span>Xin chào ${loginedUser.name }</span>
                    
                    </c:otherwise>
                 </c:choose>
        </div>
        <div class=".thanhtoanl-move">
        	
           <input id="txtName" class="fullname" type="text" name="txtName" value="${loginedUser.name }" placeholder="Họ Và Tên">
            <div class="thanhtoanl-emailsdt">
              <input id="txtEmail" class="email" type="email" name="txtEmail" value="${loginedUser.email }" placeholder="Email">
                <input id="txtMobile" class="sdt" type="tel" name="txtMobile" value="${loginedUser.mobile }" placeholder="Số Điện Thoại">
            </div>
            <div class="thanhtoanl-api">
                <select id="provinceSelect" class="sldiachi">
                    <option value="" selected disabled>Chọn tỉnh/thành phố</option>
                </select>
                
                <select id="districtSelect" class="sldiachi">
                    <option value="" selected disabled>Chọn quận/huyện</option>
                </select>
                
                <select id="wardSelect" class="sldiachi">
                    <option value="" selected disabled>Chọn phường/xã</option>
                </select>

            </div>
            <input id="txtAddress" class="diachi" type="text" name="txtAddress" value="${loginedUser.address }" placeholder="Địa Chỉ">
            <h4>Phương Thức Thanh Toán</h4>
            <div class="thanhtoanl-phuongthuc">
                <input class="cod" type="radio"><span>Thanh toán khi giao hàng (COD)</span>
            </div>
            <button onclick="_placeOrder()" class="btnsucces" >Hoàn Tất Đơn Hàng</button>
	</form>

        </div>


    </div>
    <div class="thanhtoanr">
    <form method="get">
        <div class="thanhtoanr-giohang">
            <div class="spgiohang">
                <div class="content">
                     <div class="contentform">
                     <c:forEach var="item" items="${cart.productCarts }" varStatus="loop">
                        <div class="leftsp" style="width: 100%">
                            <div class="anh">  
                                <img src="${classpath}/FileUploads/${item.avatar }">
                            </div>
                            <div class="thongtin">
                                <div class="name">${item.productName }</div>
                                <div class="size">ĐEN / <SPan>${item.size}</SPan></div>
                                <div class="price">
                                        <div class="soluong"><span id="productQuantity_${item.productId }">${item.quantity }</span></div>
                                        <div class="gia"><fmt:formatNumber value="${item.price }" minFractionDigits="0" /><sup>đ</sup></div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                            
                        
                    </div> 
                </div>
                <div class="thanhtoanr-mgg">
                    <input type="text" placeholder="Mã Giảm Giá">
                    <button>Sử Dụng</button>
                </div>
                <c:choose>
                 <c:when test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
                	<div class="thanhtoanr-dangnhap">
                    <div class="titlesmall">Chương Trình Khách Hàng Thân Thiết</div>
                    <button onclick="redirectTologin()">Đăng Nhập</button>
                </div>
                </c:when>
                    <c:otherwise>
                <div class="thanhtoanr-dangnhap" style="white-space: pre-line;">
                    <div class="titlesmall" style="width: 100%">Xin chào ${loginedUser.name },
                     cảm ơn bạn vì đã quan tâm tới sản phẩm của chúng tôi.
                     Hãy mua hàng để nhận giảm giá cho lần tiếp theo.
                      </div>
                </div>
                </c:otherwise>
                 </c:choose>
                 <div class="pricetotal">
                    <div class="titlepricetotal">TOTAL</div>
                    <div class="totalprice"><fmt:formatNumber value="${totalCartPrice }"
																	minFractionDigits="0"></fmt:formatNumber>
																<sup>đ</sup>
                    </div>
                </div>

    
            </div>

        </div>


	</form>
    </div>
</div>
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
<!-- Jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<  <script src="${classpath}/frontend/accsents/base.js"></script> 
<script>
    
    const provinceSelect = document.getElementById('provinceSelect');
    const districtSelect = document.getElementById('districtSelect');
    const wardSelect = document.getElementById('wardSelect');
    let selectedProvince = null; // Đảm bảo biến selectedProvince có phạm vi toàn cục
    
    // Lấy danh sách tỉnh/thành phố ban đầu
    fetch('https://provinces.open-api.vn/api/?depth=3', {
        method: 'GET',
        headers: {
            'Host': 'provinces.open-api.vn'
        }
    })
    .then(response => response.json())
    .then(data => {
        // Xử lý danh sách tỉnh/thành phố ban đầu
        data.forEach(province => {
            const option = document.createElement('option');
            option.value = province.code;
            option.textContent = province.name;
            provinceSelect.appendChild(option);
        });
    
        // Lắng nghe sự kiện khi tỉnh/thành phố thay đổi
        provinceSelect.addEventListener('change', () => {
            selectedProvince = data.find(province => province.code === parseInt(provinceSelect.value)); // Gán giá trị cho selectedProvince
            const selectedProvinceCode = provinceSelect.value;
    
            if (selectedProvinceCode) {
                // Xóa tất cả các lựa chọn cũ trong các ô chọn
                districtSelect.innerHTML = '<option value="" selected disabled>Chọn quận/huyện</option>';
                wardSelect.innerHTML = '<option value="" selected disabled>Chọn phường/xã</option>';
    
                // Nếu tỉnh/thành phố có danh sách quận/huyện
                if (selectedProvince.districts && selectedProvince.districts.length > 0) {
                    selectedProvince.districts.forEach(district => {
                        const districtOption = document.createElement('option');
                        districtOption.value = district.code;
                        districtOption.textContent = district.name;
                        districtSelect.appendChild(districtOption);
                    });
                }
            }
        });
    
        // Lắng nghe sự kiện khi quận/huyện thay đổi
        districtSelect.addEventListener('change', () => {
            const selectedDistrictCode = districtSelect.value;
    
            if (selectedDistrictCode) {
                // Tìm quận/huyện được chọn dựa trên mã code
                const selectedDistrict = selectedProvince.districts.find(district => district.code === parseInt(selectedDistrictCode));
    
              // Xóa tất cả các lựa chọn cũ trong ô chọn phường/xã
                wardSelect.innerHTML = '<option value="" selected disabled>Chọn phường/xã</option>';
    
                // Nếu quận/huyện có danh sách phường/xã
                if (selectedDistrict.wards && selectedDistrict.wards.length > 0) {
                    selectedDistrict.wards.forEach(ward => {
                        const wardOption = document.createElement('option');
                        wardOption.value = ward.code;
                        wardOption.textContent = ward.name;
                        wardSelect.appendChild(wardOption);
                    });
                }
            }
        });
        console.log(data)
    })
    .catch(error => {
        console.error('Lỗi khi lấy dữ liệu tỉnh thành:', error);
    });
    renderCartthanhtoan(Listgiohang, contentElement)
    updateTotalPrice(Listgiohang)
    const btnsucces = document.querySelector('.btnsucces')

    btnsucces.addEventListener('click', function () {
    const provinceSelect = document.getElementById('provinceSelect');
    const districtSelect = document.getElementById('districtSelect');
    const wardSelect = document.getElementById('wardSelect');

    const selectedProvince = provinceSelect.options[provinceSelect.selectedIndex].value;
    const selectedDistrict = districtSelect.options[districtSelect.selectedIndex].value;
    const selectedWard = wardSelect.options[wardSelect.selectedIndex].value;

    // Lấy giá trị từ các trường thông tin
    const fullName = document.querySelector('.fullname').value;
    const email = document.querySelector('.email').value;
    const phone = document.querySelector('.sdt').value;
    const address = document.querySelector('.diachi').value;
    const paymentMethod = document.querySelector('.cod').checked;
    

    // Kiểm tra xem các trường có được điền đủ hay không
    if (!fullName || !email || !phone || !address || !paymentMethod  || !selectedProvince || !selectedDistrict || !selectedWard) {
        warning() 
    } else {
       
        var check = /^0\d{9}$/; //bat dau bang so 0 va cos tong 10 chu so

        if (check.test(phone)) {
            kiemtra()
        } else {
        alert("Số điện thoại không hợp lệ");
        }
    }
    function kiemtra() {
      
      var emailkt = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      // ^ khẳng định vị trí bắt đầu của chuỗi.
      // [^\s@]+ khớp với một hoặc nhiều ký tự không phải khoảng trắng hoặc '@'.
      // @ khớp với ký tự '@'.
      // [^\s@]+ khớp với một hoặc nhiều ký tự không phải khoảng trắng hoặc '@'.
      // \. khớp với ký tự '.'.
      // [^\s@]+ khớp với một hoặc nhiều ký tự không phải khoảng trắng hoặc '@'.
      // $ khẳng định vị trí kết thúc của chuỗi.

      if (!emailkt.test(email)) {
        alert("Định dạng email không đúng");
      } 
      else{
        successCart()
      }
    }
});

    </script>
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

</html>