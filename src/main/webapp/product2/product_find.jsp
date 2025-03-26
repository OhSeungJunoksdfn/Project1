<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:hover{
cursor:pointer;}
li{list-style:none;}
.product__item .set-bg {   width: 300px;   /* 가로 크기 지정 */
    height: 300px;  /* 세로 크기 지정 */
    background-size: cover;  /* 요소에 맞게 이미지 크기 조절 */
    background-position: center;
    background-repeat: no-repeat;
    

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#ss').val('하이볼글라스')
	commons(1)
	
	$('#findBtn').click(function(){
		commons(1)
	})
	$('#ss').keydown(function(e){
		if(e.keyCode==13)
		{
			commons(1)
		}
	})
})
function commons(page)
{
	let fd=$('#fd').val()
	let ss=$('#ss').val()
	$.ajax({
		type:'post',
		url:'../product2/product_find_ajax.do',
		data:{"fd":fd,"ss":ss,"page":page},
		success:function(result){
			//$('#view').text(result)
		  	let json=JSON.parse(result)
		  	console.log(json)
		  	jsonView(json)
		}
	})
}
function prev(page)
{
	commons(page)
}
function next(page)
{
	commons(page)
}
function pageChange(page)
{
	commons(page)
}
function jsonView(json)
{
	
	// 이미지 
	let html=''
	json.map(function(product2){
		
		html+='<div class="col-lg-4 col-md-6 col-sm-6">'
        +'<div class="product__item">'
        +'<div class="product__item__pic set-bg" data-setbg="'+product2.poster+'">'
        +'<ul class="product__item__pic__hover">'
        +'<li><a href="#"><i class="fa fa-heart"></i></a></li>'
        +'<li><a href="#"><i class="fa fa-retweet"></i></a></li>'
        +'<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>'
        +'</ul>'
        +'</div>'
        +'<div class="product__item__text">'
        +'<h6><a href="../product2/product_detail_before.do?product_no='+product2.product_no+'">'+product2.name+'</a></h6>'
        +'<h5>'+product2.price+'</h5>'
        +'</div>'
        +'</div>'
        +'</div>'
    	
	})
	
    html+='<div class="col-12">'
	html+='<div class="pagination-area d-sm-flex mt-15">'
	html+='<nav aria-label="#">'
	html+='<ul class="pagination">'
      if(json[0].startPage>1)
      {
       html+='<li class="page-item">'
       html+='<a class="page-link" onclick="prev('+(json[0].startPage-1)+')">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>'
       html+='</li>'
      }
            
      for(let i=json[0].startPage;i<=json[0].endPage;i++)
      {
    	  if(json[0].curpage===i)
    	  {
    		  html+='<li class="page-item active"><a class="page-link" onclick="pageChange('+i+')">'+i+'</a></li>'
    	  }
    	  else
    	  {
    		  html+='<li class="page-item"><a class="page-link" onclick="pageChange('+i+')">'+i+'</a></li>'
    	  }
    	  
      }
            
            if(json[0].endPage<json[0].totalpage)
            {
            	html+='<li class="page-item">'
            	html+='<a class="page-link" onclick="next('+(json[0].endPage+1)+')">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>'
            	html+='</li>'
            }
            
            html+='</ul>'
            html+='</nav>'
            html+='<div class="page-status">'
            html+='<p>Page '+json[0].curpage+' of '+json[0].totalpage+' results</p>'
            html+='</div>'
            html+='</div>'
            html+='</div>'

	$('#view').html(html)
	// 페이지 
				
	$('.set-bg').each(function () {
	    let bg = $(this).attr('data-setbg');
	    if (bg) {
	        $(this).css('background-image', 'url(' + bg + ')');
	    }
	});	
            
	}
</script>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일 용품 검색</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="hero hero-normal">
      <div class="container">
          <div class="row">
              <div class="col-lg-9">
             
                  <div class="hero__search">
                      <div class="hero__search__form">
                          <ol class="hero__search__categories">
                            <li class="hero__search-item">
                             <select id="fd" class="form-control-sm">
                               <option value="name">상품명</option>
                               <option value="type" selected>상품종류</option>
                             </select>
                             <input type=text size=15 id="ss" class="form-control-sm">
                             <input type=button value="검색" class="btn-sm btn-primary" id="findBtn">
                            </li>
                        </ol>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row" id="view">
            
            
            </div>
         </div>
     </section>
</body>
</html>