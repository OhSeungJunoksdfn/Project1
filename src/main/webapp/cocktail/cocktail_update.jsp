<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(document).on('keydown', 'input[type="text"]', function(event) {
	    if (event.key === 'Enter' || event.keyCode === 13) {
	        event.preventDefault(); 
	    }
	});
	$('#ingtable').on('click', '.findBtn', function() {
	    let fd = $(this).closest('.findContent').find('.fd').val(); 
	    console.log(fd);
	    commons(fd); 
	  });
			
	$('#ingtable').on('click', '.ingfind', function(event) {
    	$(this).find('.findContent').toggle();
    	event.stopPropagation();
  	});

 	 $('#ingtable').on('click', '.findContent', function(event) {
    	event.stopPropagation();
  	});
	
	
	
  $('.createBtn').on('click', function() {
	    let html = '<tr>' +
	      '<td class="text-center" width="60%">' +
	        '<div class="ingfind">' +
	          '<input type="text" name="ingname" class="ingredient" readonly>' +
	          '<input type="hidden" name="ing_no" class="ing_no">' +
	          '<input type="hidden" name="alc" class="alc">' +
	          '<div class="findContent">' +
	            '<div>' +
	              '<input type="text" style="float:left; width:80%" placeholder="재료 검색" class="fd">' +
	              '<input type="button" style="float:right; width: 20%; height:40px" value="검색" class="findBtn primary-btn">' +
	            '</div>' +
	            '<table class="table findList"></table>' +
	          '</div>' +
	        '</div>' +
	      '</td>' +
	      '<td class="text-center" width="15%"><input type="text" name="volume" class="volume" placeholder="용량"></td>' +
	      '<td class="text-center" width="15%">' +
	        '<select name="unit" class="unit">' +
	          '<option>ml</option>' +
	          '<option>dash</option>' +
	          '<option>teaspoon</option>' +
	          '<option>drops</option>' +
	          '<option>gram</option>' +
	          '<option>개</option>' +
	          '<option>slice</option>' +
	          '<option>peel</option>' +
	          '<option>leaves</option>' +
	        '</select>' +
	      '</td>' +
	      '<td class="text-center" width="10%">' +
	        '<a class="deleteBtn btn btn-danger btn-sm">삭제</a>' +
	      '</td>' +
	    '</tr>';

	    $('#ingtable').append(html);
	  });

	
	$("#ingtable").on('click', '.deleteBtn', function() {
		$(this).closest('tr').remove(); 
	});
	
	//재료 선택
	$("#ingtable").on("click", ".onSelect", function() {

	    let ing_no = $(this).attr("data-ing_no");
	    let ingname = $(this).attr("data-ingname");
	    let alc = $(this).attr("data-alc");


	    
	    let ingredient= $(this).closest(".ingfind").find(".ingredient")
	    let ing_noContent= $(this).closest(".ingfind").find(".ing_no")
	    let alcContent= $(this).closest(".ingfind").find(".alc")
	    
	    ingredient.val(ingname);
	    ing_noContent.val(ing_no);
	    alcContent.val(alc);
	    
	    $('.findList').html('')
	    $('.fd').val('')
	    $(".findContent").hide();
	});
	
})
let commons = (fd) => {
		$.ajax({
		type:'post',
		url:'../cocktail/ingredients_find_ajax.do',
		data:{"fd":fd},
		success:(res) => {
			let json=JSON.parse(res)
			jsonView(json)
		} 
		})
	}

let jsonView=(json)=>{
	let html="";
	json.map((vo) => {
	html+='<tr><td width="100%" >'+vo.ingname+'</td>'
	+'<td width="100%"><input type=button value="선택"data-ing_no="'+vo.ing_no
	+'" data-ingname="'+vo.ingname+'" data-alc="'+vo.alc+'" class="btn-sm btn-info onSelect"/> </td></tr>'
	})
	
	$('.findList').html(html)
	}

let onSubmit = ()=>{
	const form = $('form');
	let name = $('#name')
	if(name.val().trim()==='')
	{
		name.focus();
		return;
	}
	
	let ename = $('#ename')
	if(ename.val().trim()==='')
	{
		ename.focus();
		return;
	}
	
	let comments = $('#comments')
	if(comments.val().trim()==='')
	{
		comments.focus();
		return;
	}
	
	let ingredient = $('.ingredient')
	for(let i=0;i<ingredient.length;i++){
		if($(ingredient[i]).val().trim()==='')
			{
				alert("재료를 입력해주세요")
				return;
			}
	}
	
	let volume = $('.volume')
	for(let i=0;i<volume.length;i++){
		if($(volume[i]).val().trim()==='')
			{
				volume.focus();
				return;
			}
		
	}
	let numberRegex=/^[0-9]+$/;
	for(let i=0;i<volume.length;i++){
		let volValue = $(volume[i]).val().trim();
		if (!numberRegex.test(volValue)) {
            alert("숫자를 입력해주세요"); 
            $(volume[i]).focus(); 
            return;
        }
	}
	
	let unit = $('.unit')
	for(let i=0;i<unit.length;i++){
		if($(unit[i]).val().trim()==='')
			{
				return;
			}
	}
	
	let content = $('#content')
	if(content.val().trim()==='')
	{
		content.focus();
		return;
	}
	
	
	form.submit();
}
</script>
<style type="text/css">
.ingfind{
	position: relative;
	cursor: pointer;
	width: 100%;
}

.findContent{
	display: none;
	position: absolute;
	width: 100%;
	top:100%;
	z-index: 10;
	border : 1px solid #d9d9d9;
}
h5{
	text-align: center;
}

input[type=text]{
	width: 100%;
	height: 40px;
}

.findList{
	background-color: white;
	height:200px ;
	max-height: 200px;
	display:block;
	overflow-y:scroll;
	width: 100%;  
	table-layout: fixed;  
}

.findList tr {
    display: block;             
}

.findList td {
    overflow: hidden;            
    white-space: nowrap;         
}

.ingfind{
	cursor:pointer;
}
.ingredient{
	cursor: pointer;
}
</style>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일 수정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
<section class="product-details spad">
        <div class="container">
        <form method="post" action="../cocktail/cocktail_insert_ok.do">
            <table class="table">
            <tr>
            	<th><h5>이미지 업로드</h5></th>
            	<td>
            	<input type="file" id="image" name="image">
            	<a id="fileBtn" class="btn btn-sm btn-primary" style="color:white;font-weight:700">버튼</a>
            	</td>
            </tr>
            <tr>
            	<th><h5>칵테일 이름</h5></th>
            	<td>
					<input type="text" name="name" id="name" value="${vo.name }" >   	
            	</td>
            </tr>
            <tr>
            	<th><h5>칵테일 영문 이름</h5></th>
            	<td>
				<input type="text" name="ename" id="ename" value="${vo.ename }" >   	
            	</td>
            </tr>
            <tr>
            	<th><h5>칵테일 설명</h5></th>
            	<td>
				<input type="text"  name="comments" id="comments" value="${vo.comments }" />
            	</td>
            </tr>
            <tr>
            	<th><h5>레시피 정보</h5></th>
            	<td>
				<textarea rows="10" style="width:100%" name="content" id="content">${vo.content }</textarea>
            	</td>
            </tr>
            </table>
            <table>
				<h4 class="text-center">재료 정보</h4>
				<table class="table" id="ingtable">
					<tr>
					 <th class="text-center" width="60%">재료</th>
					 <th class="text-center" width="15%">용량</th>
					 <th class="text-center" width="15%">단위</th>
					 <th class="text-center" width="10%"><input type="button" value="추가" style="float:right;" class="createBtn btn-sm btn-danger"></th>
					</tr>
					<tr>
					 <td class="text-center" width="60%" >
					 <div class="ingfind">
					 	<input type="text" name="ingname" class="ingredient"  value=${list[0].civo.ingname } readonly>
					 	<input type="hidden" name="ing_no" class="ing_no" value="${list[0].civo.ing_no }">
					 	<input type="hidden" name="alc" class="alc" value="${list[0].civo.alc }">
					 	<div class="findContent" >
					 	<div>
					 		<input type="text" style="float:left; width:80%" placeholder="재료 검색" class="fd">
					 		<input type="button" style="float:right; width: 20%; height:40px"  value="검색" class="findBtn primary-btn">
					 	</div>
					 		<table class="table findList" >
					 			
					 		</table>
					 	</div>
					 </div>
					 </td>
					 <td class="text-center" width="15%"><input type="text" name="volume" class="volume" value="${list[0].crivo.volume }"></td>
					 <td class="text-center" width="15%">
					 <select  name="unit" class="unit">
					 <option  <c:if test="${list[0].crivo.unit=='ml' }">selected</c:if> >ml</option>
					 <option  <c:if test="${list[0].crivo.unit=='dash' }">selected</c:if> >dash</option>
					 <option <c:if test="${list[0].crivo.unit=='teaspoon' }">selected</c:if>  >teaspoon</option>
					 <option  <c:if test="${list[0].crivo.unit=='drops' }">selected</c:if> >drops</option>
					 <option  <c:if test="${list[0].crivo.unit=='gram' }">selected</c:if> >gram</option>
					 <option  <c:if test="${list[0].crivo.unit=='개' }">selected</c:if> >개</option>
					 <option  <c:if test="${list[0].crivo.unit=='slice' }">selected</c:if> >slice</option>
					 <option  <c:if test="${list[0].crivo.unit=='peel' }">selected</c:if> >peel</option>
					 <option  <c:if test="${list[0].crivo.unit=='leaves' }">selected</c:if> >leaves</option>
					 </select>
					 </td>
					 <td class="text-center" width="10%" class="deleteBtn"></td>
					</tr>
					
					<c:forEach var="i" begin="1" end="${list.size()-1 }" >
					<tr>
	      				<td class="text-center" width="60%"> 
	        			<div class="ingfind"> 
	          			<input type="text" name="ingname" class="ingredient"  value=${list[i].civo.ingname } readonly>
						<input type="hidden" name="ing_no" class="ing_no" value="${list[i].civo.ing_no }">
						<input type="hidden" name="alc" class="alc" value="${list[i].civo.alc }">
	          			<div class="findContent"> 
	            <div> 
	              <input type="text" style="float:left; width:80%" placeholder="재료 검색" class="fd"> 
	              <input type="button" style="float:right; width: 20%; height:40px" value="검색" class="findBtn primary-btn"> 
	            </div> 
	            <table class="table findList"></table> 
	          </div> 
	        </div> 
	      </td> 
	      <td class="text-center" width="15%"><input type="text" name="volume" class="volume" value="${list[i].crivo.volume }"></td> 
	      <td class="text-center" width="15%"> 
	        <select name="unit" class="unit"> 
	          <option   ${list[i].crivo.unit.trim()=="ml"? "selected":"" } >ml</option>
					 <option   ${list[i].crivo.unit.trim()=="dash"? "selected":"" } >dash</option>
					 <option  ${list[i].crivo.unit.trim()=="teaspoon"? "selected":"" } >teaspoon</option>
					 <option  ${list[i].crivo.unit.trim()=="drops"? "selected":"" } >drops</option>
					 <option   ${list[i].crivo.unit.trim()=="gram"? "selected":"" } >gram</option>
					 <option   ${list[i].crivo.unit.trim()=="개"? "selected":"" } >개</option>
					 <option  ${list[i].crivo.unit.trim()=="slice"? "selected":"" } >slice</option>
					 <option   ${list[i].crivo.unit.trim()=="peel"? "selected":"" } >peel</option>
					 <option   ${list[i].crivo.unit.trim()=="leaves"? "selected":"" }>leaves</option>
	        </select> 
	      </td> 
	      <td class="text-center" width="10%"> 
	        <a class="deleteBtn btn btn-danger btn-sm">삭제</a> 
	      </td> 
	    </tr>
	    	</c:forEach>
				</table>
				<tr >
				<td colspan="2" class="text-right">
					<input type="button" value="레시피 올리기" class="primary-btn" onclick="onSubmit()">
					<a href="javascript:history.back()" class="primary-btn" style="background: white; color: #000;border: 2px solid black;">취소</a>
				</td>
				</tr>
            </table>
        </form>
        </div>
</section>
</body>
</html>