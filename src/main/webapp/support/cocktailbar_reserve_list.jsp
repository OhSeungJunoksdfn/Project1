<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.locBtn').click(function(){
		let loc=$(this).val()
		console.log(loc)
		$.ajax({
			type:'post',
			url:'../reserve/reserve_cocktailbar_list.do',
			data:{'loc':loc},
			success:function(res){
				$('#reserveList').html(res)
			},
			error:function(err){
				console.log(err)
			}
		})
	})
	$('.nameBtn').click(function(){
		let name = $(this).text();
		let image= $(this).attr("data-img")
		let no = $(this).attr("data-no")
		let rdays = $(this).attr("data-rdays")
		$('#cocktailbar_poster').attr("src",image)
		$('#cocktailbar_name').text(name)
		$('#rno').val(no);
		$('.nameBtn').css({'background':"none","color":"black"})
		$(this).css({'background':'rgba(24, 27, 97,0.5)',"color":"white"});
		$("#reserveDay").show();
		$("#reserveTime").hide();
		$("#reserveInwon").hide();
		$("#cocktailbar_reserve_day").text("");
		$("#cocktailbar_reserve_time").text("");
		$("#cocktailbar_reserve_inwon").text("");
		$("#rday").val("");
		$("#rtime").val("");
		$("#rinwon").val("");
		$.ajax({
			type:'post',
			url:'../reserve/cocktailbar_reserve_day.do',
			data:{"rdays":rdays},
			success:function(result)
			{
				$('#reserveDay').html(result)
				
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
})
</script>
<style type="text/css">
	td input{
		margin: 5px;
	}
	.nameBtn:hover{
		cursor: pointer;
		border: 1px solid rgb(24, 27, 97);
		
	}
</style>
</head>
<body>
		<table class="table">
		<tr>
			<td colspan="3">
				<input type="button" value="서울" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="인천" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="경기" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="강원" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="부산" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="대전" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="대구" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="경북" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="경남" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="울산" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="대전" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="광주" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="충북" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="충남" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="제주" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="전남" class="locBtn btn-sm btn-outline-primary">
				<input type="button" value="전북" class="locBtn btn-sm btn-outline-primary">
			</td>
		</tr>
			<tr>
				<td></td>
				<td>지역</td>
				<td>업체명</td>
			</tr>
			<c:forEach var="vo" items="${list }" >
			<tr>
				<td width=15%><img src="${vo.image }" style="width:30px;height: 30px;"></td>
				<td width=15%>${vo.loc }</td>
				<td width=70% class="nameBtn" data-no="${vo.bar_no }" data-img="${vo.image }" data-rdays= ${vo.rdays }  >${vo.name }</td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>