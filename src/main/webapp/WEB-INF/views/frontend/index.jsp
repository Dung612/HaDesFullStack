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
    <title>HADES STUDIO</title>
    <link rel="stylesheet" href="${classpath}/frontend/accsents/base.css">
        <link rel="stylesheet" href="${classpath}/frontend/accsents/shop.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/style.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/reponsive.css">
    <link rel="stylesheet" href="${classpath}/frontend/accsents/fontawesome-free-6.4.0-web/css/all.min.css">

</head>
<body>
  	<!--  header -->
  	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <div class="slide">
        <div class="slideshow ">
            <img src="https://theme.hstatic.net/1000306633/1001194548/14/slideshow_2.jpg?v=161" alt="">
            <img src="https://theme.hstatic.net/1000306633/1000891824/14/slideshow_2.jpg?v=662" alt="">
            <img src="https://theme.hstatic.net/1000306633/1001194548/14/slideshow_3.jpg?v=161" alt="">
            <img src="https://theme.hstatic.net/1000306633/1000891824/14/slideshow_2.jpg?v=662" alt="">
            <img src="https://theme.hstatic.net/1000306633/1001194548/14/slideshow_2.jpg?v=161" alt="">
            

        </div>
        <!-- <div class="button">
            <div class="btn btnleft"><i class="fa-solid fa-chevron-left"></i></div>
            <div class="btn btnright"><i class="fa-solid fa-chevron-right"></i></div>
        </div> -->
    </div>
    <div class="block-content">
        <div class="content1" ><a href="shop/1"> <img src="https://theme.hstatic.net/1000306633/1000891824/14/block_home_category1_new.png?v=662" alt=""></a></div>
        <div class="content2" style="margin: 0 4px;"> <a href="shop/2"> <img src="https://theme.hstatic.net/1000306633/1000891824/14/block_home_category2_new.png?v=662" alt=""></a> </div>
        <div class="content3"> <a href="shop/4"> <img src="https://theme.hstatic.net/1000306633/1000891824/14/block_home_category3_new.png?v=662" alt=""></a></div>
    </div>
    <img style="width: 100%; height: auto;"  alt="" src="https://theme.hstatic.net/1000306633/1001194548/14/show_block_home_category_image_3_new.png?v=161">
    
    
        <div class="textslideshow">
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        <div class="textslide">
            <span>
                <p>NEW ARRIVALS</p>
            </span>
        </div>
        

    </div>
    
    
        <div class="sanpham">
    
    	<c:forEach items="${productnew }" var="product">
         <div class="sanpham1 col4s fontbasic">
            <div class="anhsanpham">
                <img src="${classpath }/FileUploads/${product.avatar }" alt="">
                <a class="image-link" href="${classpath }/product-detail/${product.id}"></a>
                <img class="anh2" src="${classpath }/FileUploads/${product.avatar2 }" alt="">
                <div class="chucnang">
                    <div class="buy" onclick="addToCart(${product.id}, 1,'M', '${product.name }') ,redirectToThanhToan()">MUA NGAY</div>
                    <div class="add" onclick="addToCart(${product.id}, 1,'M', '${product.name }') , reloadPageAndShowCart()  " >THÊM VÀO GIỎ</div>
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
            <a href=""><i class="fa-solid fa-heart"></i></a>
        </div>
    </div>

    <div class="messenger">
        <div class="bodermessenger">
            <a href=""><i class="fa-brands fa-facebook-messenger"></i></a>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/frontend/layout/search.jsp"></jsp:include>

    
</body>

<script src="${classpath}/frontend/accsents/accsent/New folder/cdnjs.cloudflare.com_ajax_libs_jquery_3.5.0_jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="${classpath}/frontend/accsents/base.js"></script>
<script>
//     function setSlidePosition() {
//     slideimg.forEach((image, index) => {
//         image.style.left = index * 100 + '%';

//     });
// }
// function slide(direction) {
//     if (direction === 'right') {
//         index = (index + 1) % imgnumber;
//     } else if (direction === 'left') {
//         index = (index - 1 + imgnumber) % imgnumber;
//     }
//     slideshow.style.left = `-${index * 100}%`;
// }
// function slideauto(){
//     slide('left')
// }

// btnright.addEventListener('click',() =>{
//     slide('left')
// })

// btnleft.addEventListener('click',() =>{
//     slide('left')
    
// })


// setSlidePosition();
// setInterval(slideauto,15000)


$('.slideshow').slick({
    autoplay: true,
    speed: 500,
    prevArrow: '<div class="btn btnleft"><i class="fa-solid fa-chevron-left"></i></div>',
    nextArrow: '<div class="btn btnright"><i class="fa-solid fa-chevron-right"></i></div>',
    infinite: true, 
    slidesToShow: 1, 
    slidesToScroll: 1, 
});

</script>
</html>