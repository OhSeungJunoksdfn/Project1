<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>칵테일바 추가하기</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html">Vegetables</a>
                            <span>Vegetable’s Package</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" style="width:800px;margin:0px auto">
             <form method="post" action="../board/board_insert_ok.do">
              <table class="table">
               <tr>
                <th class="text-center table-warning" width=20%>칵테일바 이름</th>
                <td width=80%>
                 <input type=text name=name id=name size=20
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>주소</th>
                <td width=80%>
                 <input type=text name=address id=address size=50
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>칵테일바 번호</th>
                <td width=80%>
                 <input type=text name=phone id=phone size=20
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>사진주소</th>
                <td width=80%>
                 <input type=text name=pwd id=pwd size=20
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>칵테일바 소개</th>
                <td width=80%>
                 <input type=text name=pwd id=pwd size=20
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>영업시간</th>
                <td width=80%>
                 <input type=text name=pwd id=pwd size=20
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                <th class="text-center table-warning" width=20%>지역</th>
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
                <th class="text-center table-warning" width=20%>가까운 역,지역</th>
                <td width=80%>
                 <input type=text name=subway id=subway size=20
                  class="form-control-sm" required>
                </td>
               </tr>
               
               <tr>
                 <td colspan="2" class="text-center">
                  <input type=submit value="글쓰기" class="btn-outline-primary btn-sm">
                  <input type=button value="취소" class="btn-outline-danger btn-sm"
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