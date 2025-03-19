<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일바 추가하기</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" style="width:800px;margin:0px auto">
            <form method=post action="../cocktailbar/cocktailbarboard_insert_ok.do" name="frm" id="frm">
             <table class="table">
              
              <tr>
               <th width=30% class="text-center" style="color:gray">칵테일바 이름</th>
               <td width=70%>
                <input type=text name="name" id="name" size=15 class="form-control-sm">
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
                <input type=text id="addr1" name="addr1" size=55 class="form-control-sm" readonly>
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">상세주소</th>
               <td width=85%>
                <input type=text name="addr2" size=55 class="form-control-sm">
               </td>
              </tr>
              
              <tr>
                <th class="text-center" style="color:gray"  width=20%>지역</th>
                <td width=80%>
                 <select>
                  <option value="loc" selected>서울</option>
                  <option value="loc" selected>인천</option>
                  <option value="loc" selected>경기</option>
                  <option value="loc" selected>강원</option>
                  <option value="loc" selected>부산</option>
                  <option value="loc" selected>경남</option>
                  <option value="loc" selected>대구</option>
                  <option value="loc" selected>경북</option>
                  <option value="loc" selected>울산</option>
                  <option value="loc" selected>대전</option>
                  <option value="loc" selected>충남</option>
                  <option value="loc" selected>충북</option>
                  <option value="loc" selected>경북</option>
                  <option value="loc" selected>광주</option>
                  <option value="loc" selected>전남</option>
                  <option value="loc" selected>전북</option>
                  <option value="loc" selected>제주</option>                  
                 </select>
                </td>
               </tr>
               
               <tr>
                <th class="text-center" width=30%>가까운 지역</th>
                <td width=70%>
                 <input type=text name=subway id=subway size=20
                  class="form-control-sm" required>
                </td>
               </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">영업시간</th>
               <td width=85%>
                <input type=text name="time" size=55 class="form-control-sm">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">이메일</th>
               <td width=85%>
                <input type=text name="email" size=55 class="form-control-sm">
               </td>
              </tr>
              
              
              
              <tr>
               <th width=15% class="text-center" style="color:gray">사진</th>
               <td width=85%>
                <input type=text name="image" size=15 class="form-control-sm">
               </td>
              </tr>
              
              <tr>
               <th width=15% class="text-center" style="color:gray">소개</th>
               <td width=85%>
                <textarea rows="7" cols="57" name="content"></textarea>
               </td>
              </tr>
              
              <tr>
               <td colspan="2" class="text-center">
                <input type=button value="입력" class="btn-sm btn-success" id="joinBtn">
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