<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <div class="header">
        <div class="nav">
            <div class="left">
                <div class="logo">
                    <a href="${classpath}/index"><img src="${classpath}/frontend/accsents/accsent/image/logo_menu_no_scroll.webp" alt=""></a>
                </div>
                <div class="titlelogo">
                    <img src="${classpath}/frontend/accsents/accsent/image/logotitle.svg" alt="">
                </div>
                <ul class="menu">
                        <li><a href="${classpath}/shop">SS23 COLLECTION</a></li>
                        <li><a href="${classpath}/shop">SHOP ALL</a></li>
                        <li><a href="${classpath}/shop/${categoryId=1}">TOPS</a></li>
                        <li><a href="${classpath}/shop/${categoryId=2}">BOTTOM</a></li>
                        <li><a href="${classpath}/shop/${categoryId=4}">OUTERWEAR</a></li>
                        <li><a href="${classpath}/shop/${categoryId=5}">FOOTWEAR</a></li>
                        <li><a href="${classpath}/shop/${categoryId=7}">HAT</a></li>
                        <li><a href="${classpath}/shop/${categoryId=3}">BAGS</a></li>
                        <li><a href="${classpath}/shop?categoryId=7">SALE</a></li>
                        <li><a href="${classpath}/recruitment">RECRUITMENT</a></li>
                </ul>
            </div>
            <ul class="acc">
                <div class="accres">
                    <li class="accout"><a href="${classpath}/login" class="login" >ĐĂNG NHẬP</a>
                        <a href="${classpath}/signup" class="signup">ĐĂNG KÝ</a>
        
                    </li>
                    <!-- <li class="signin"><a href="">ĐĂNG KÝ</a></li> -->
                    <li class="btntimkiem">TÌM KIẾM</li>
                    <li class="btngiohang">GIỎ HÀNG</li>
                    <li> <select name="" id="lan">
                        <option value="VN">VI</option>
                        <option value="EN">EN</option>
                    </select></li>
                </div>
                <div class="btnresponsive">
                    <div class="btnres">
                        <i class=" fa-solid fa-magnifying-glass" onclick="showSearch()"></i>
                        <i class=" fa-solid fa-cart-shopping" onclick="showCart()"></i>
                    </div>
                    <i class="btnmenures fa-solid fa-bars"></i>
                    
                </div>
            </ul>


            
                <div class="menures">
                    
                        <li><a href="${classpath}/shop">SS23 COLLECTION</a></li>
                        <li><a href="${classpath}/shop">SHOP ALL</a></li>
                        <li><a href="${classpath}/shop?categoryId=1">TOPS</a></li>
                        <li><a href="${classpath}/shop?categoryId=2">BOTTOM</a></li>
                        <li><a href="${classpath}/shop?categoryId=4">OUTERWEAR</a></li>
                        <li><a href="${classpath}/shop?categoryId=6">FOOTWEAR</a></li>
                        <li><a href="${classpath}/shop?categoryId=3">HAT</a></li>
                        <li><a href="${classpath}/shop?categoryId=5">BAGS</a></li>
                        <li><a href="${classpath}/shop?categoryId=7">SALE</a></li>
                        <li><a href="${classpath}/recruitment">RECRUITMENT</a></li>
                        <li><a href="${classpath}/login" class="login" >ĐĂNG NHẬP</a></li>
                        <li><a href="${classpath}/signup" class="signup">ĐĂNG KÝ</a></li>
                </div>
            
        </div>
    </div>