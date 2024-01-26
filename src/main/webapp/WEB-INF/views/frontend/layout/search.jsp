<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<div class="timkiem">
        <div class="title">
            <h2>TÌM KIẾM</h2>
            <button class="close"><i class="fa-solid fa-xmark"></i></button>
            
        </div>
        <form action="${classpath }/search"  method="get">
        <div class="search">
            <input type="text" id="search-input" name="keyword" placeholder="TÌM KIẾM SẢN PHẨM">
        </div>
        <div class="sanphamtimkiem">
        <c:forEach items="${products }" var="product">
            <div class="ifspsearch">
                        <div class="namespsearch">${product.name}</div>
                        <div class="pricespsearch"><fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber><sup>vnđ</sup></div>
                    </div>
                    <div class="imgspsearch">
                        <img src="${classpath }/FileUploads/${product.avatar }" alt="${product.name}">
                    </div> 

                    <a href="${classpath }/product-detail/${product.id}"></a>
         </c:forEach>
        </div>
        </form>
    </div>
    <div class="giohang">
        <div class="title">
            <h2>GIỎ HÀNG</h2>
            <button class="closegiohang close"><i class="fa-solid fa-xmark"></i></button>
        </div>

        <div class="spgiohang">
        
            <div class="content">
         <!--    <c:forEach var="item" items="${cart.productCarts }" varStatus="loop">
                 <div class="contentform">
                    <div class="leftsp">
                        <div class="anh">  
                            <img src="${classpath}/FileUploads/${item.avatar }" alt="">
                        </div>
                        <div class="thongtin">
                            <div class="name">${item.productName }</div>
                            <div class="size">ĐEN / <SPan>L</SPan></div>
                            <div class="price">
                                    <div class="soluong">1</div>
                                    <div class="gia"><fmt:formatNumber value="${item.price }" minFractionDigits="0" /><sup>đ</sup></div>
                            </div>
                        </div>
                    </div>
                        
                    <div class="closesmall"><i class="fa-solid fa-xmark"></i></div>
                </div> 
                
				</c:forEach> --> 
				
				<div class="contentform">
                    <div class="leftsp">
                        <div class="anh">  
                            <img src="${classpath}/frontedn/accsents/accsent/image/dsc05233_f4651fc12ce24ac28d00ff705d483daf_grande.webp" alt="">
                        </div>
                        <div class="thongtin">
                            <div class="name">OCEAN MEDIATION BOXY TEE</div>
                            <div class="size">ĐEN / <SPan>L</SPan></div>
                            <div class="price">
                                    <div class="soluong">1</div>
                                    <div class="gia">420,000đ</div>
                            </div>
                        </div>
                    </div>
                        
                    <div class="closesmall"><i class="fa-solid fa-xmark"></i></div>
                </div>
            </div>
            
            
            <div class="pricetotal">
                <div class="titlepricetotal">TOTAL</div>
                <div class="totalprice"><fmt:formatNumber value="${totalCartPrice }"
																	minFractionDigits="0"></fmt:formatNumber>
																<sup>đ</sup></div>
            </div> 
            <div class="btngiohang">
                <div class="btnxemgiohang"><button class="xemgiohang"><span>XEM GIỎ HÀNG</span></button></div>
                <div class="btnthanhtoan btnxemgiohang"  onclick="redirectToThanhToan()"><button class="thanhtoan xemgiohang"><span>THANH TOÁN</span></button></div>
            </div>

        </div>
    </div>
    <div class="backgroundmo"></div>