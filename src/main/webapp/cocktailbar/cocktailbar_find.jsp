<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:hover{
  cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#ss').val('서울')
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
		url:'../cocktailbar/cocktailbar_find_ajax.do',
		data:{"fd":fd,"ss":ss,"page":page},
		success:function(result){
			//$('#view').text(result)
		  	let json=JSON.parse(result)
		  	
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
	json.map(function(cocktailbar){
		html+='<div class="row">'
    	+'<div class="col-lg-4 col-md-6 col-sm-6">'
        +'<div class="product__item">'
        +'<div class="product__item__pic set-bg" data-setbg=${vo.image}>'
                +'<ul class="product__item__pic__hover">'
                    +'<li><a href="#"><i class="fa fa-heart"></i></a></li>'
                    +'<li><a href="#"><i class="fa fa-retweet"></i></a></li>'
                +'</ul>'
            +'</div>'
            +'<div class="product__item__text">'
                +'<h6><a href="#">${vo.loc }</a></h6>'
                +'<h5><a href="../cocktailbar/cocktailbar_detail_before.do?bar_no=${vo.bar_no }">${vo.name}</a></h5>'
            +'</div>'
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
                        <h2>칵테일바 검색</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                             <select id="fd" class="form-control-sm">
                               <option value="name">업체명</option>
                               <option value="loc" selected>지역</option>
                               <option value="address">주소</option>
                             </select>
                             <input type=text size=15 id="ss" class="form-control-sm">
                             <input type=button value="검색" class="btn-sm btn-primary" id="findBtn">
                             
                             
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" id="view">
               
                
              
            </div> 
        </div>
    </section>
    <!-- ****** Archive Area End ****** -->

</body>
</html>