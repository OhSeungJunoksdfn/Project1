<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원수정</title>
	
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="stylesheet" href="../shadow/css/shadowbox.css">
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
    $(function(){
    	
    	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#address').val(data.address)
					}
				}).open()
			})
    		
    	})
    })
    </script>
</head>
<body>

<!-- 

        ID             NOT NULL VARCHAR2(20)  
		PWD            NOT NULL VARCHAR2(30)  
		NAME           NOT NULL VARCHAR2(51)  
		SEX            NOT NULL CHAR(6)       
		EMAIL                   VARCHAR2(100) 
		BIRTHDAY       NOT NULL VARCHAR2(10)  
		POST           NOT NULL VARCHAR2(10)  
		ADDRESS        NOT NULL VARCHAR2(100) 
		ADDRESS_DETAIL          VARCHAR2(100) 
		REGDATE                 DATE          
		COMENT                  CLOB          
		ADMIN                   VARCHAR2(1)   
		LOGIN                   VARCHAR2(1)   
		PHONE                   VARCHAR2(13)  
		AVATAR                  VARCHAR2(100) 
		
		 -->
    <!-- Checkout Section Begin -->
    <div class="login-container1">
    <section class="checkout spad">
            <div class="checkout__form" style="text-align:center;">
                <h4 >회원수정</h4>
             </div>
                 <form method=post action="../member/join_update_ok.do" name="frm" id="frm">
                    <div class="row">
                        <div class="col-lg-12">
                           <!-- <div class="row">   -->
                           
                           <div class="checkout__input">

                                <input type="hidden" name="id" value="${vo.id}">
                           </div>
                           
                           <div class="checkout__input">
                                <p>패스워드<span>*</span></p>
                                <input type="password"name="pwd" id="pwd">
                           </div>


                           <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input type="text" name="name" id="name" value="${vo.name }">
                           </div>
                           
                           <th width=15% class="text-center" style="color:gray">성별<br></th>
				                <br>
				                <td width=85%>
				                <input type="radio" name="sex" value="남자" ${vo.sex == '남자' ? 'checked' : ''}>남자
				                <input type="radio" name="sex" value="여자" ${vo.sex == '여자' ? 'checked' : ''}>여자
				             </td>

                           <div class="checkout__input">
                                <p>이메일<span>*</span></p>
                                <input type="text" name="email" value="${vo.email }">
                           </div>
				                
				            <div class="checkout__input">
                            	<p>생년월일<span>*</span></p>
                                <input type="date" name="birthday" class="form-control-sm" value="${vo.birthday }">
                            </div>
                            <div class="checkout__input">
                                <br><p>우편주소<span>*</span></p>
                                <input type=text id="post" name="post" class="form-control-sm" placeholder="우편주소" value="${vo.post }" readonly>
                                <input type=button value="우편번호검색" class="btn-sm btn-danger" id="postBtn">
                            </div>
                            
                            <div class="checkout__input">
                            	<p>주소<span>*</span></p>
                                <input type="text" id="address" name="address" placeholder="주소" class="form-control-sm" value="${vo.address }" readonly>
                                <input type="text" name="address_detail" placeholder="상세주소" value="${vo.address_detail }">
                            </div>
                            <div class="checkout__input">
                                <p>소개<span>*</span></p>
                                <input type="text" name="coment" placeholder="자기소개 및 관심사를 알려주세요." value="${vo.coment }">
                       		</div> 
                             <div class="checkout__input">
                                     <p>전화번호<span>*</span></p>
                                     <select name="phone1" class="form-control-sm">
                                     <option>010</option>
						              </select>
						              <input type=text name="phone2" value="${vo.phone }">
                             </div>
							    <div class="checkout__input">
							        <p>프로필 사진</p>
							        <input type="file" name="avatar" id="avatar" accept="image/*">
							        <br>
							        <img id="preview" src="#" alt="미리보기" style="max-width: 150px; display: none;">
							    </div>
   
                         <div class="checkout__input__checkbox">
                            <label for="acc">
                                  동의합니다.
                                  <input type="checkbox" id="acc">
                              <span class="checkmark"></span>
                             </label>
                         </div>
                            <p>수정에 동의하시면 체크해주세요.</p>
                      </div>
                      </div>
                      <br>

                      <div class="col-lg-12 col-md-6 text-center">
                      		<input type="submit" value="회원수정" class="btn-sm btn-primary" id="joinBtn">
                      		<input type=button value="취소" class="btn-sm btn-warning" onclick="javascript:history.back()">

					  </div>
                 
                </form>
    </section>
    </div>
    <!-- Checkout Section End -->


    <!-- Js Plugins -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/mixitup.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>

 

</body>

</html>