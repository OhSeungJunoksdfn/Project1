<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

$(function(){
    // 우편번호 버튼 클릭 시
    $('#postBtn').click(function(){
        new daum.Postcode({
            oncomplete:function(data)
            {
                $('#post').val(data.zonecode);
                $('#address').val(data.address);
            }
        }).open();
    });

    // 수정 버튼 클릭 시
    $('#updateBtn').click(function(){
        let bar_no = $('input[name="bar_no"]').val();
        let name = $('input[name="name"]').val();
        let image = $('input[name="image"]').val();
        let address = $('input[name="address"]').val();
        let subway = $('input[name="subway"]').val();
        let time = $('input[name="time"]').val();
        let profile = $('textarea[name="profile"]').val();
        let phone = $('input[name="phone"]').val();
        let post = $('#post').val();
        let loc = $('select[name="loc"]').val();

        // 필수 항목 공백 검사
        if(name === "" || image === "" || address === "" || subway === "" || time === "" || profile === "" || post === "" || phone === "") {
            alert("공백 없이 반드시 입력하셔야 합니다.");
            return;  // 폼 제출 방지
        }

        // 폼 데이터를 formData 객체로 묶기
        let formData = {
            bar_no: bar_no,
            name: name,
            image: image,
            address: address,
            subway: subway,
            time: time,
            profile: profile,
            phone: phone,
            post: post,
            loc: loc
        };

        // AJAX 요청
        $.ajax({
            type: 'POST',
            url: '../cocktailbar/cocktailbarboard_update_ok.do',
            data: formData,  // 폼 데이터를 보내기
            success: function(result) {
                // 수정 성공 시 상세 페이지로 이동
                location.href = "../cocktailbar/cocktailbar_detail.do?bar_no=" + bar_no;
            },
            error: function(err) {
                // 오류 발생 시 알림
                alert("오류 발생: " + err);
            }
        });
    });
});
</script>
</head>
<body>
!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일바 수정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" style="width:800px;margin:0px auto">
            <form id="frm">
             <table class="table">
              <tr>
               <th width=30% class="text-center" style="color:gray">칵테일바 이름</th>
               <td width=70%>
                <input type=text name="name" id="name" size=15 class="form-control-sm" value="${vo.name}">
              	<input type="hidden" name="bar_no" value="${vo.bar_no}">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">사진</th>
               <td width=85%>
                <input type=text name="image" size=15 class="form-control-sm" value="${vo.image}">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">우편번호</th>
               <td width=85%>
                <input type=text id="post" name="post" size=10 class="form-control-sm" readonly>
                <input type=button value="우편번호검색" class="btn-sm btn-danger" id="postBtn">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">주소</th>
               <td width=85%>
                <input type=text id="address" name="address" size=55 class="form-control-sm" readonly>
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">상세주소</th>
               <td width=85%>
                <input type=text size=55 class="form-control-sm">
               </td>
              </tr>
              
              <tr>
                <th class="text-center" style="color:gray"  width=20%>지역</th>
                <td width=80%>
                 <select name="loc" class="form-control-sm">
                   <option value="서울" selected>서울</option>
				      <option value="인천">인천</option>
				      <option value="경기">경기</option>
				      <option value="강원">강원</option>
				      <option value="부산">부산</option>
				      <option value="경남">경남</option>
				      <option value="대구">대구</option>
				      <option value="경북">경북</option>
				      <option value="울산">울산</option>
				      <option value="대전">대전</option>
				      <option value="충남">충남</option>
				      <option value="충북">충북</option>
				      <option value="광주">광주</option>
				      <option value="전남">전남</option>
				      <option value="전북">전북</option>
				      <option value="제주">제주</option>             
                 </select>
                </td>
               </tr>
               
               <tr>
                <th class="text-center" style="color:gray" width=30%>가까운 역,지역</th>
                <td width=70%>
                 <input type=text name="subway" size=20 class="form-control-sm" value="${vo.subway}">
                </td>
               </tr>
               
               <tr>
               <th width=15% class="text-center" style="color:gray">전화번호</th>
               <td width=85%>
                <input type=text name="phone" size=15 class="form-control-sm" value="${vo.phone}">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">영업시간</th>
               <td width=85%>
                <input type=text name="time" size=55 class="form-control-sm" value="${vo.time }">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">칵테일 바 소개</th>
               <td width=85%>
                <textarea rows="7" cols="57" name="profile" class="form-control-sm">"${vo.profile }"</textarea>
               </td>
              </tr>
              
              <tr>
               <td colspan="2" class="text-center">
                <input type=button value="수정" class="btn-sm btn-success" id="updateBtn">
                <input type=button value="취소" class="btn-sm btn-info"
                 onclick="javascript:history.back()"
                >
               </td>
              </tr>
             </table>
             </form>
            </div>
        </div>
    </section>
</body>
</html>