 const header = document.querySelector('.header');
const slideimg = document.querySelectorAll('.slideshow img')
const slideshow = document.querySelector('.slideshow')
const imgnumber = slideimg.length
const btnleft = document.querySelector('.btnleft')
const btnright = document.querySelector('.btnright')
const timkiem = document.querySelector('.timkiem')
const btntimkiem = document.querySelector('.btntimkiem')
const body = document.querySelector('body')
const btnclose = document.querySelector('.close')
const btnclosegiohang = document.querySelector('.closegiohang')
const bg = document.querySelector('.backgroundmo')
const  btngiohang = document.querySelector('.btngiohang')
const giohang = document.querySelector('.giohang')
const btnmenuses = document.querySelector('.btnmenures')
const menuses = document.querySelector('.menures')
const isIndexPage = window.location.pathname === '/Hades-Project/index.html';
const isinfo = window.location.pathname === '/Hades-Project/product-Infor.html'
const isshopall = window.location.pathname === '/hades%20project/Hades-Project/shop.html';

const urlParams = new URLSearchParams(window.location.search);
const categoryIds = urlParams.get('categoryId');
const productIds = urlParams.get('productId');
const x = parseInt(categoryIds);
const y = parseInt(productIds);
const searchInput = document.getElementById('search-input');
const searchResults = document.querySelector('.sanphamtimkiem')
const titlefooter = document.querySelector('.titlefooter')
const content1footer = document.querySelector('footer .content1')
const titleElement = document.querySelector('title');






let index = 0 

try {
    window.addEventListener('scroll', () => {
        const scrollTop = window.scrollY;
    
        if (scrollTop > 50) {
            header.style.backgroundColor = 'rgb(255, 255, 255)'; 
            header.style.transition = 'background-color 0.3s ease'; 
        } else {
            header.style.backgroundColor = 'rgba(0, 0, 0, 0)';
        }
    });
    // if (isIndexPage) {
    // function setSlidePosition() {
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
    // }
    
    btntimkiem.addEventListener('click',showSearch)
    btnclose.addEventListener('click',()=>{
        timkiem.classList.remove('active')
        body.classList.remove('active2')
        bg.classList.remove('active3')
        menuses.classList.remove('active')
    })
    function showCart() {
        giohang.classList.add('active');
        body.classList.add('active2');
        bg.classList.add('active3');
    }
    function showSearch() {
        timkiem.classList.add('active')
        body.classList.add('active2')
        bg.classList.add('active3')
    }
    

    btngiohang.addEventListener('click', showCart);
    
    btnclosegiohang.addEventListener('click',()=>{
        giohang.classList.remove('active')
        body.classList.remove('active2')
        bg.classList.remove('active3')
        menuses.classList.remove('active')
    })
    titlefooter.addEventListener('click',()=>{
        content1footer.classList.toggle('open')
    })
    bg.addEventListener('click',()=>{
        giohang.classList.remove('active')
        timkiem.classList.remove('active')
        body.classList.remove('active2')
        bg.classList.remove('active3')
        menuses.classList.remove('active')
    })
    btnmenuses.addEventListener('click',()=>{
        menuses.classList.toggle('active')
        bg.classList.toggle('active3')
    })
  
} catch (error) {
  // Xử lý lỗi ở đây
  console.error('Đã xảy ra lỗi:108', error.message);
}
function fetchProducts() {
    // Sử dụng Fetch API
	fetch('/api/data')
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => console.error('Error:', error));
}
fetchProducts();
 function fetchProduct() {
    // return fetch('http://localhost:3000/products')
    //     .then(response => response.json())
    //     .then(products => {
    //         return products; // Trả về danh sách sản phẩm
    //     })
    //     .catch(error => {
    //         console.error('Lỗi khi lấy dữ liệu sản phẩm:', error);
    //     });
    



    
        // Thay vì sử dụng fetch, bạn có thể trả về một mảng cố định
        const Products = [
            {
                "id": 1,
                "name": "OCEAN MEDITATION BOXY TEE",
                "categoryId": 1,
                "color": "black",
                "size": "S",
                "loai": "Áo",
                "anh1":"frontend/accsents/accsent/image/dsc05233_f4651fc12ce24ac28d00ff705d483daf_grande.webp",
                "anh2":"frontend/accsents/accsent/image/hd_thang_8.webp",
                "price": 420000 ,
                "soluong": 20,
                "soluongcart":0
        
                
        
              },
              {
                "id": 2,
                "name": "RAYBACK BABY TEE",
                "categoryId": 1,
                "color": "black",
                "size": "M",
                "loai": "Áo",
                "anh1":"frontend/accsents/accsent/image/ao2.webp",
                "anh2":"frontend/accsents/accsent/image/anhbgao2.webp",
                "price": 395000
                ,
                "soluong": 50
                ,
                "soluongcart":0
              },
              {
                "id": 3,
                "name": "NEIL MOON TEE",
                "categoryId": 1,
                "color": "black",
                "size": "L",
                "loai": "Áo",
                "anh1":"frontend/accsents/accsent/image/ao3.webp",
                "anh2":"frontend/accsents/accsent/image/anhbgao3.webp",
                "price": 420000
                ,
                "soluong": 40,
                "soluongcart":0
              },
        
              {
                "id": 4,
                "name": "REVET EGO TEE",
                "categoryId": 1,
                "color": "black",
                "size": "S",
                "loai": "Áo",
                "anh1":"frontend/accsents/accsent/image/ao4.webp",
                "anh2":"frontend/accsents/accsent/image/anhbgao4.webp",
                "price": 420000,
                "soluong": 20,
                "soluongcart":0
              },
        
              {
                "id": 1,
                "name": "ROBUST SHORTS",
                "categoryId": 2,
                "color": "black",
                "size": "S",
                "loai": "Quần",
                "anh1":"frontend/accsents/accsent/image/quan1.webp",
                "anh2":"frontend/accsents/accsent/image/bgquan1.webp",
                "price": 450000
                ,
                "soluong": 22,
                "soluongcart":0
                
        
              },
              {
                "id": 2,
                "name": "CONVERZIONE PARACHUTE PANTS",
                "categoryId": 2,
                "color": "black",
                "size": "S",
                "loai": "Quần",
                "anh1":"frontend/accsents/accsent/image/quan2.webp",
                "anh2":"frontend/accsents/accsent/image/bgquan2.webp",
                "price": 750000,
                "soluong": 32,
                "soluongcart":0
                
        
              },
              {
                "id": 3,
                "name": "ADAM SPREAD JEANS",
                "categoryId": 2,
                "color": "black",
                "size": "S",
                "loai": "Quần",
                "anh1":"frontend/accsents/accsent/image/quan3.webp",
                "anh2":"frontend/accsents/accsent/image/bgquan3.webp",
                "price": 750000
                ,
                "soluong": 20,
                "soluongcart":0
                
        
              },
              {
                "id": 4,
                "name": "WAVELENGTH PARACHUTE PANTS",
                "categoryId": 2,
                "color": "black",
                "size": "S",
                "loai": "Quần",
                "anh1":"frontend/accsents/accsent/image/quan4.webp",
                "anh2":"frontend/accsents/accsent/image/bgquan4.webp",
                "price": 690000,
                "soluong": 26,
                "soluongcart":0
                
        
              },
        
        
        
        
        
              {
                "id": 1,
                "name": "MAJOR PIECES JACKET",
                "categoryId": 4,
                "color": "black",
                "size": "S",
                "loai": "Jacket",
                "anh1":"frontend/accsents/accsent/image/jk1.webp",
                "anh2":"frontend/accsents/accsent/image/bgjk1.webp",
                "price": 760000,
                "soluong": 80,
                "soluongcart":0
              },
              {
                "id": 2,
                "name": "looming zip JACKET",
                "categoryId": 4,
                "color": "black",
                "size": "S",
                "loai": "Jacket",
                "anh1":"frontend/accsents/accsent/image/jk2.webp",
                "anh2":"frontend/accsents/accsent/image/bgjk2.webp",
                "price": 760000,
                "soluong":87,
                "soluongcart":0
              },
              {
                "id": 3,
                "name": "NEGATIVVITY HIDE CARDIGAN",
                "categoryId": 4,
                "color": "black",
                "size": "S",
                "loai": "Jacket",
                "anh1":"frontend/accsents/accsent/image/jk3.webp",
                "anh2":"frontend/accsents/accsent/image/bgjk3.webp",
                "price": 650000
                ,
                "soluong": 60,
                "soluongcart":0
              },
              {
                "id": 4,
                "name": "HEBREW BOXY HOODIE",
                "categoryId": 4,
                "color": "black",
                "size": "S",
                "loai": "Jacket",
                "anh1":"frontend/accsents/accsent/image/jk4.webp",
                "anh2":"frontend/accsents/accsent/image/bgjk4.webp",
                "price": 720000,
                "soluong": 120,
                "soluongcart":0
              }
        ,
              {
                "id": 1,
                "name": "HINT SHUFFLING BAG",
                "categoryId": 5,
                "loai": "Túi",
                "anh1":"frontend/accsents/accsent/image/tui1.webp",
                "anh2":"frontend/accsents/accsent/image/bgtui1.webp",
                "price": 650000,
                "soluong": 178,
                "soluongcart":0
              }
              ,
              {
                "id": 2,
                "name": "ZWART WEEKENDER BAG",
                "categoryId": 5,
                "loai": "Túi",
                "anh1":"frontend/accsents/accsent/image/tui2.webp",
                "anh2":"frontend/accsents/accsent/image/bgtui2.webp",
                "price": 690000,
                "soluong": 67,
                "soluongcart":0
              }
              ,
              {
                "id": 3,
                "name": "CURVE CROSSBODY QUITED BAG",
                "categoryId": 5,
                "loai": "Túi",
                "anh1":"frontend/accsents/accsent/image/tui3.webp",
                "anh2":"frontend/accsents/accsent/image/bgtui3.webp",
                "price": 380000,
                "soluong": 12,
                "soluongcart":0
              }
              ,
              {
                "id": 4,
                "name": "BLACK BLOCK BACKPACK",
                "categoryId": 5,
                "loai": "Túi",
                "anh1":"frontend/accsents/accsent/image/tui4.webp",
                "anh2":"frontend/accsents/accsent/image/bgtui4.webp",
                "price": 670000,
                "soluong": 230,
                "soluongcart":0
              }
        
        
        
        
        
              ,
              {
                "id": 1,
                "name": "INTERNATIONAL SOCKS",
                "categoryId": 6,
                "color":"black",
                "loai": "Tất",
                "anh1":"frontend/accsents/accsent/image/tat1.webp",
                "anh2":"frontend/accsents/accsent/image/bgtat1.webp",
                "price": 90000
                ,
                "soluong": 209
              }
              ,
              {
                "id": 2,
                "name": "LOGO SOCKS",
                "categoryId": 6,
                "color":"black",
                "loai": "Tất",
                "anh1":"frontend/accsents/accsent/image/tat2.webp",
                "anh2":"frontend/accsents/accsent/image/bgtat2.webp",
                "price": 90000,
                "soluong": 180
              }
        
        
        
        
        
              
            ]
        ;
    
        // Trả về mảng cố định
        return Promise.resolve(Products);
    

}

// renderproductshop()
const sortSelect = document.getElementById('sortSelect');

try{
    sortSelect.addEventListener('change', function() {
        const selectedValue = this.value;
      //  renderproductshop()
        console.log('Selected Value:', selectedValue);
        
        // Bạn có thể thực hiện các hành động khác dựa trên giá trị đã chọn ở đây
    });
}
catch(error){
    console.log('error 156 ')
}


function renderproductshop(){
    try {
        fetchProducts().then(products => {
            const productContainer = document.querySelector('.sanpham');
            let foundProduct = false;
            
                const selectedValue = sortSelect.value;
            
             // Biến để kiểm tra xem đã tìm thấy sản phẩm phù hợp chưa
            try{
                if (selectedValue === 'increase') {
                    products.sort((a, b) => a.price - b.price);
                } else if (selectedValue === 'decrease') {
                    products.sort((a, b) => b.price - a.price);
                }
                else if (selectedValue === 'oldest') {
                    products.sort((a, b) => a.date - b.date);
                }
                else if (selectedValue === 'newest') {
                    products.sort((a, b) => b.date - a.date);
                }
                else if (selectedValue === 'bestseller') {
                    
                }
            }catch(error){
                console.log('error 186 ')
            }

            productContainer.innerHTML = '';

            products.forEach(product => { 
                
                if( product.categoryId === x){
                    const productElement = document.createElement('div');
                productElement.className = 'sanpham1 col4s fontbasic';
                const formattedPrice = product.price.toLocaleString('vi-VN');
                productElement.innerHTML = `
                        
                <div class="anhsanpham">
                <img src="${product.anh1}" alt="">
                <a class="image-link" href="/product-Infor?productId=${product.id}&categoryId=${product.categoryId}"></a>
                <img class="anh2" src="${product.anh2}" alt="">
                <div class="chucnang">
                    <div class="buy" onclick="redirectToThanhToan()">MUA NGAY</div>
                    <div class="add" onclick="showCart()" >THÊM VÀO GIỎ</div>
                </div>
                </div>
                <div class="tensanpham"><a href="/product-Infor?productId=${product.id}&categoryId=${product.categoryId}">${product.name}</a></div>
                <div class="price">${formattedPrice} <span>đ</span></div>
                    
                `;
                productContainer.appendChild(productElement);
                const btnAddSpElements = productElement.querySelectorAll('.add');
    
                // Xử lý các phần tử có class "add" trong sản phẩm hiện tại
                btnAddSpElements.forEach(btn => {
                    btn.addEventListener('click', function() {
                        const existingProduct = Listgiohang.find(item => item.id === product.id && item.categoryid === product.categoryid);
                        if (existingProduct) {
                            // Nếu sản phẩm đã tồn tại, tăng giá trị của "soluong" lên 1
                            existingProduct.soluongcart += 1;
                        } else {
                            product.soluongcart = 1;
                        Listgiohang.push(product)
                        }
                        console.log('Đã thêm sản phẩm vào giỏ hàng');
                        Listgiohang.forEach(item => {
                            console.log(item);
                         
                            renderCartProducts(Listgiohang, contentElement);
                            updateTotalPrice(Listgiohang);
                            
                            
                        });
                        
                    });
                });
    
                btnAddSpElements.forEach(addElement => {
                  
                    const linkElement = addElement.querySelector('a');
                    if (linkElement) {
                       
    
                        const textContent = linkElement.textContent;
                        addElement.textContent = textContent;
                    }
                });
                foundProduct = true; // Đánh dấu đã tìm thấy sản phẩm
            }
                if(isNaN(x)){
                const productElement = document.createElement('div');
                productElement.className = 'sanpham1 col4s fontbasic';
                const formattedPrice = product.price.toLocaleString('vi-VN');
                productElement.innerHTML = `
                    
                        <div class="anhsanpham">
                            <img src="${product.anh1}" alt="">
                            <a class="image-link" href="/product-Infor?productId=${product.id}&categoryId=${product.categoryId}"></a>
                            <img class="anh2" src="${product.anh2}" alt="">
                            <div class="chucnang">
                                <div class="buy" onclick="redirectToThanhToan()">MUA NGAY</div>
                                <div class="add" onclick="showCart()" >THÊM VÀO GIỎ</div>
                            </div>
                        </div>
                        <div class="tensanpham"><a href="/product-Infor?productId=${product.id}&categoryId=${product.categoryId}">${product.name}</a></div>
                        <div class="price">${formattedPrice} <span>đ</span></div>
                    
                `;
                productContainer.appendChild(productElement);
                
                const btnAddSpElements = productElement.querySelectorAll('.add');
    
                // Xử lý các phần tử có class "add" trong sản phẩm hiện tại
                btnAddSpElements.forEach(btn => {
                    btn.addEventListener('click', function() {
                        const existingProduct = Listgiohang.find(item => item.id === product.id && item.categoryid === product.categoryid);
                        if (existingProduct) {
                            
                            existingProduct.soluongcart += 1;
                        } else {
                            product.soluongcart = 1;
                        Listgiohang.push(product)
                        }
                        
                        
                        console.log('Đã thêm sản phẩm vào giỏ hàng');
                        
                        
                        Listgiohang.forEach(item => {
                            console.log(item);
                            
                            renderCartProducts(Listgiohang, contentElement);
                            updateTotalPrice(Listgiohang);
                            
                            
                        });
                        
                    }); foundProduct = true; // Đánh dấu đã tìm thấy sản phẩm
                });
    
                btnAddSpElements.forEach(addElement => {
                  
                    const linkElement = addElement.querySelector('a');
                    if (linkElement) {
                       
    
                        const textContent = linkElement.textContent;
                        addElement.textContent = textContent;
                    }
                });
                }
                
            });
            if (!foundProduct ) {
                const emptyCategoryElement = document.createElement('div');
                emptyCategoryElement.className = 'empty-category';
                emptyCategoryElement.textContent = 'Chưa có sản phẩm nào trong danh mục này';
                productContainer.appendChild(emptyCategoryElement);
            }
          
        })
        .catch(error => console.error('Lỗi:', error));
        console.log('productId:', productIds);
        console.log('categoryId:', categoryIds);
        console.log('y:',y);
        console.log('x:',x);
      
    } catch (error) {
        
      // Xử lý lỗi ở đây
      console.error('Đã xảy ra lỗi:253', error.message);
    }
}    
        let selectedSizeButton;
function renderProductInfor(){
        fetchProducts().then(products => {
            
           
            
            const productContent = document.querySelector('.productContent');
            
            products.forEach(product => { 
                
                
                if(product.categoryId === x && product.id === y){
                    titleElement.textContent = `${product.name} - HADES STUDIO`;
                    const productElement = document.createElement('div');
                    productElement.className = 'ContentInfor';
                    const formattedPrice = product.price.toLocaleString('vi-VN');
                    productElement.innerHTML = `
                        
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
                         <img src="${product.anh1}" alt="">
                         <img src="${product.anh2}" alt="">
                     </div>
                 </div>
                 <div class="PayProduct">
                     <div class="ContentPay">
                         <div class="name"><h2>${product.name}</h2></div>
                         <div class="price">
                         ${formattedPrice} đ
                         </div>
                         <div class="size">
                         <h4>kích thước</h4>
                         <div class="btnsize">
                             <button class="btnsizes " data-size="S">S</button>
                             <button class="btnsizes selected" data-size="M">M</button>
                             <button class="btnsizes" data-size="L">L</button>
                         </div>
                     </div>
                     <div class=" btnadd" onclick="showCart()" >THÊM VÀO GIỎ</div>
                     <div class=" btnpay" onclick="redirectToThanhToan()">MUA NGAY</div>
                     </div>
                 </div>
                        
                    `;
                    productContent.appendChild(productElement);

                    const btnAddSpElements = productElement.querySelectorAll('.btnadd');

                    const buttonsize = productElement.querySelectorAll('.btnsizes');
                    const buttonsizearray = Array.from(buttonsize);
                    buttonsizearray.forEach(button => {
                        button.addEventListener('click', () => {
                            // Xóa lớp "selected" khỏi tất cả các nút
                            buttonsizearray.forEach(btn => {
                                btn.classList.remove('selected');
                            });
                            
                            // Thêm lớp "selected" cho nút được click
                            button.classList.add('selected');

                            selectedSizeButton = button;

                          
                            
                            
                        });
                    });
                    console.log("jadjakdja")

            // Xử lý các phần tử có class "add" trong sản phẩm hiện tại
            btnAddSpElements.forEach(btn => {
                btn.addEventListener('click', function() {
                    const existingProduct = Listgiohang.find(item => item.id === product.id && item.categoryid === product.categoryid);
                    if (existingProduct) {
                       
                        existingProduct.soluongcart += 1;
                    } else {
                        product.soluongcart = 1;
                    Listgiohang.push(product)
                    }
                    
                    console.log('Đã thêm sản phẩm vào giỏ hàng');
                    Listgiohang.forEach(item => {
                        console.log(item);
                        renderCartProducts(Listgiohang, contentElement);
                        updateTotalPrice(Listgiohang);
                        
                        
                    });
                    
                });
            });

            btnAddSpElements.forEach(addElement => {
              
                const linkElement = addElement.querySelector('a');
                if (linkElement) {
                   

                    const textContent = linkElement.textContent;
                    addElement.textContent = textContent;
                }
            });

                    
        
                    } 
            });
        
        })
    
    }

    function searchProducts(keyword) {
        
        searchResults.innerHTML = '';
    
        // Lặp qua dữ liệu sản phẩm và tìm kiếm dựa trên từ khóa
       
        fetchProducts().then(products => {
        products.forEach(product => {
            if (product.name.toLowerCase().includes(keyword.toLowerCase())) {
                // Tạo phần tử sản phẩm kết quả
                const productElement = document.createElement('div');
                productElement.className = 'spsearch';
                productElement.innerHTML = `
                    <div class="ifspsearch">
                        <div class="namespsearch">${product.name}</div>
                        <div class="pricespsearch">${product.price} <span>đ</span></div>
                    </div>
                    <div class="imgspsearch">
                        <img src="${product.anh1}" alt="${product.name}">
                    </div> 

                    <a href="/product-Infor?productId=${product.id}&categoryId=${product.categoryId}"></a>
                `;
    
                // Thêm sản phẩm vào kết quả tìm kiếm
                searchResults.appendChild(productElement);
            }
        });
    })
    searchResults.style.display =' block';
}
    try {
    searchInput.addEventListener('input', () => {
        const keyword = searchInput.value.trim();
        
        if (keyword === '') {
            
            hideAllProducts();
        } else {
            searchProducts(keyword);
        }
    });
  
} catch (error) {
  // Xử lý lỗi ở đây
  console.error('Đã xảy ra lỗi:421', error.message);
}

    
    function hideAllProducts() {
       searchResults.style.display =' none';
    }



    let productIndex = 0;
    const contentElement = document.querySelector('.content');

    // const size = getSizeFromSelectedButton();

   
   
    



 
    

    

    

    function mess({title = '',textmess = '',type='info',duration=3000}){
        const main = document.getElementById('mess')
        if(main){ 
            const mess = document.createElement('div')
            mess.onclick = function(e){
                if(e.target.closest('.close')){
                    main.removeChild(mess)
                    clearTimeout(autoremove)
                }
            }
            const icons = {
                warning:'fa-solid fa-triangle-exclamation',
                success:'fa-solid fa-circle-check'

            }
            const icon = icons[type]
            const delay = (duration / 1000)
            mess.classList.add('mess' , `${type}`)         
            mess.style.animation=`slide ease .3s , fadeout linear 1s ${delay}s forwards`
            mess.innerHTML = `
            <div class="icon">
                <i class="${icon}"></i>
            </div>
            <div class="text">
                <div class="title">${title}</div>
                <div class="textmess">${textmess}</div>

            </div>
            <div class="close">
                <i class="fa-solid fa-xmark"></i>
            </div>
            `
            main.appendChild(mess)

            const autoremove = setTimeout(function(){
                main.removeChild(mess)
            } ,duration + 1000)

        }
        

    }




  
    function  showmessSuccess(){
        mess({
        title:'success',
        textmess:'Bạn đã đăng kí thành công',
        type:'success',
        duration:1000,
    })
    

    }

    function  successCart(){
        mess({
        title:'success',
        textmess:'Bạn đã đặt hàng thành công',
        type:'success',
        duration:1000,
    })
    

    }
    function showmessWarning(){
        mess({
        title:'Warning',
        textmess:'Bạn đã đăng kí thất bại',
        type:'warning',
        duration:3000,
    })
    

    }
    function warning(){
        mess({
        title:'Warning',
        textmess:'Vui Lòng điền đủ thông tin',
        type:'warning',
        duration:3000,
    })
    
    

    }
    function warninglogin(){
        mess({
        title:'Error',
        textmess:'Sai tên đăng nhập hoặc mật khẩu',
        type:'warning',
        duration:3000,
    })
    
    

    }
    function  showmessCart(){
        mess({
        title:'success',
        textmess:'Thêm vào giỏ hàng thành công',
        type:'success',
        duration:1000,
    })

    }
    function redirectToThanhToan() {
        window.location.href = '/cart-view';
      }
      function redirectToindex() {
        window.location.href = '/index';
      }
      function redirectTologin() {
        window.location.href = '/login';
      }

