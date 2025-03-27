<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/reserve_cocktailbar_list.do',
		success:function(result)
		{
			$('#reserveList').html(result)
		}
	})
})
</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일바 예약</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<section class="product spad">
        <div class="container">
        <div class="row" >
           <div class="col-8" >
           <h4>칵테일바 목록</h4>
           	<div  id="reserveList" style="height:500px; border:1px solid black;overflow-y:scroll"></div>
           	<div  id="reserveDay" style="height:500px; border:1px solid black;display:none"></div>
           	<div  id="reserveTime" style="height:500px; border:1px solid black;display:none"></div>
           	<div  id="reserveInwon" style="height:500px; border:1px solid black;display:none"></div>
           </div>
           <div class="col-4" style="position:relative;">
           	<div style="position:sticky; top: 0;">
           	 <table class="table">
                     <tr><td colspan="2"><h4 class="primary-btn text-center" style="width:100%;">예약 정보</h4></td></tr>
                     <tr>
                       <td class="text-center" colspan="2">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5R6QRNst_kdWB8R08hMQMSDNVflcIzrZwQQ&s" style="width:250px;height: 180px" id="cocktailbar_poster">
                       </td>
                     </tr>
                     <tr>
                       <td width=30% style="color:gray">업체명</td>
                       <td width=70%><span id="cocktailbar_name"></span></td>
                     </tr>
                     <tr>
                       <td width=30% style="color:gray">예약일</td>
                       <td width=70%><span id="cocktailbar_reserve_day"></span></td>
                     </tr>
                     
                     <tr>
                       <td width=30% style="color:gray">예약시간</td>
                       <td width=70%><span id="cocktailbar_reserve_time"></span></td>
                     </tr>
                     
                     <tr>
                       <td width=30% style="color:gray">예약인원</td>
                       <td width=70%><span id="cocktailbar_reserve_inwon"></span></td>
                     </tr>
                     
                     <tr id="reserveBtn" style="display:none">
                       <td colspan="2" class="text-center">
                         <form method="post" action="../reserve/reserve_insert.do">
                           <input type="hidden" name="bar_no" value="" id="rno">
                           <input type="hidden" name="day" value="" id="rday">
                           <input type="hidden" name="time" value="" id="rtime">
                           <input type="hidden" name="inwon" value="" id="rinwon">
                           <input type=submit value="예약하기"
                             class="primary-btn">
                         </form>
                       </td>
                     </tr>
                    </table>
           	</div>
           </div>
        </div>
        </div>
  	</section> 
</body>
</html>