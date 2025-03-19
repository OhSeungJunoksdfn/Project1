<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let curpage=1
let totalpage=0;
let startPage=0;
let endPage=0;
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

let commons = (page) => {
	let ss=$('#ss').val()
	$.ajax({
	type:'post',
	url:'../cocktail/cocktail_find_ajax.do',
	data:{"ss":ss,"page":page},
	success:(res) => {
		let json=JSON.parse(res)
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

let jsonView = (json) => {
	let html="";
	json.map((cocktail) => {
	html+='<div class="col-lg-4 col-md-6 col-sm-6" data-scrollmagic>'
    		+'<div class="product__item" >'
    		+'<div class="product__item__pic" style="height:350px; background-size:cover;background-position:center; background-image:url(\'' + cocktail.image + '\')">'
        	+'<ul class="product__item__pic__hover">'
            +'<li><a href="#"><i class="fa fa-heart"></i></a></li>'
            +'<li><a href="#"><i class="fa fa-retweet"></i></a></li>'
        	+'</ul>'
    		+'</div>'
    		+'<div class="product__item__text">'
        	+'<h6><a href="../cocktail/cocktail_detail_before.do?cno='+cocktail.cocktail_no+'">'+cocktail.name+'</a></h6>'
        	+'<h5>'+cocktail.ename+'</h5>'
    		+'</div>'
			+'</div>'
			+'</div>'
	})
	
	html+='<div class="container">'
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
      
	$('#view').html(html);
}


</script>
<style type="text/css">
  .checked{
  	background-color: #181b61 !important;
  	color:white !important;
  }
  #line{
    	border: 1px solid #ccc;
  	width: 100%;
  	height: 1px;
  	margin-top: 10px;
  	margin-bottom: 10px;
  }
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일 검색</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="product spad">
      <div class="container">
      <div class="row justify-content-end mb-2 mr-2">
    	<input type="text" id="ss" size="30" style="height:35px">
    	<button class="btn btn-info btn-sm" id="findBtn">검색</button>
      </div>
      </div>	
        <div class="container">
            <div class="row" id="view">
                    

           
                </div>
            </div>
    </section>
</body>
</html>