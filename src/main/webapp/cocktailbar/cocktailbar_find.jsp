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
.checked{
  	background-color: #181b61 !important;
  	color:white !important;
  }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
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
		json.map((cocktailbar) => {
			html+='<div class="col-lg-4 col-md-6 col-sm-6" data-scrollmagic>'
		    		+'<div class="product__item" >'
		    		+'<div class="product__item__pic" style="height:350px; background-size:cover;background-position:center; background-image:url(\'' + cocktailbar.image + '\')">'
		        	+'<ul class="product__item__pic__hover">'
		            +'<li><a href="#"><i class="fa fa-heart"></i></a></li>'
		            +'<li><a href="#"><i class="fa fa-retweet"></i></a></li>'
		        	+'</ul>'
		    		+'</div>'
		    		+'<div class="product__item__text">'
		        	+'<h6><a href="../cocktailbar/cocktailbar_detail_before.do?bar_no='+cocktailbar.bar_no+'">'+cocktailbar.name+'</a></h6>'
		        	+'<h5>'+cocktailbar.loc+'</h5>'
		    		+'</div>'
					+'</div>'
					+'</div>'
			})
	
	html+='<div class="container mb-4">'
	html+='<div class="row justify-content-end">'
    html+='<div class="product__pagination">'
   
    if(json[0].startPage>1)
    {
    html+='<a onclick="prev('+(json[0].startPage-1)+')" style="cursor:pointer"><i class="fa fa-long-arrow-left"></i></a>'
    }
    
    for(let i=json[0].startPage;i<=json[0].endPage;i++)
   	{
		if(json[0].curpage===i){
    	html+='<a class="checked" style="cursor:pointer" onclick="pageChange('+i+')">'+i+'</a>'
		}
		else{
			html+='<a onclick="pageChange('+i+')" style="cursor:pointer">'+i+'</a>'
		}
    }
    
	if(json[0].endPage<json[0].totalpage)
	{
    html+='<a onclick="next('+(json[0].endPage+1)+')" style="cursor:pointer"><i class="fa fa-long-arrow-right"></i></a>'
	}
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
   <div class="container">
		<div class="row justify-content-end mb-2 mt-2">
    		<select id="fd" style="height: 46px;margin-right:5px;padding: 0 5px;">
              <option value="name">업체명</option>
              <option value="loc" selected>지역</option>
              <option value="address">주소</option>
            </select>
            <input type=text size=20 id="ss" >
            <input type=button value="검색" class=" site-btn" id="findBtn">
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