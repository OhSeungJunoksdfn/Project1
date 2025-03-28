<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>예약 관리</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
<div class="container mt-5" style="height:100%;overflow-y:scroll">
	<table class="table" >
		<tr>
			<th class="text-center"></th>
			<th class="text-center" >업체명</th>
			<th class="text-center">예약일</th>
			<th class="text-center">시간</th>
			<th class="text-center">인원</th>
			<th class="text-center">확인</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td class="text-center"><img src="${vo.cbvo.image }" style="width: 30px; height:30px"></td>
			<td class="text-center">${vo.cbvo.name }</td>
			<td class="text-center">${vo.day }</td>
			<td class="text-center">${vo.time }</td>
			<td class="text-center">${vo.inwon }</td>
			<td class="text-center">
			<c:if test="${vo.isok=='n' }">
			<a href="../reserve/reserveisok_ok.do?rno=${vo.rno }" class="btn btn-sm btn-success" id="check" >승인하기</a>
			</c:if>
			<c:if test="${vo.isok=='y' }">
			<span class="btn btn-sm btn-default"  >승인됨</span>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>