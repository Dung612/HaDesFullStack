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
        window.location.href = '/thanhtoan';
        
      }
          function cartview() {
        window.location.href = '/cart-view';
        
      }
      
      function redirectToindex() {
        window.location.href = '/index';
      }
      function redirectTologin() {
        window.location.href = '/login';
      }
            function register() {
        window.location.href = '/register';
      }

