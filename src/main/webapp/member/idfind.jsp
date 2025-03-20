<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>
	
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
    <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
    <script type="text/javascript">
    
  $(function(){
	  $( "#tabs" ).tabs();
	  $('#emailBtn').click(function(){
	    	let name=$('#e_name').val()
	    	if(name.trim()==="")
	    	{
	    		$('#e_name').focus()
	    		$('#result_email').html('<font color="red">이름을 입력하세요</font>')
	    		return
	    	}
	    	let email=$('#email').val()
	    	if(email.trim()==="")
	    	{
	    		$('#email').focus()
	    		$('#result_email').html('<font color="red">이메일을 입력하세요</font>')
	    		return
	    	}
	    	$.ajax({
	    		type:'post',
	    		url:'../member/idfind_ok.do',
	    		data:{"name":name,"email":email},
	    		success:function(result){
	    			if(result==='no')
	    			{
	    				$('#result_email').html('<h3><font color="red">이름이나 이메일이 존재하지 않습니다</font></h3>')
	    				$('#e_name').val("")
	    				$('#email').val("")
	    				$('#e_name').focus()
	    			}
	    			else
	    			{
	    				$('#result_email').html('<h3><font color="blue">'+result+'</font></h3>')
	    			}
	    			
	    		},
	    		error:function(request,status,error){
	    			console.log(error)
	    		}
	    	})
	    })
  })
  </script>
  <style type="text/css">
  #tabs{
    width: 600px;
  }
  </style>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>아이디 찾기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../main/main.do"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">food-list Page</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" style="width:800px;margin:0px auto">
              <div id="tabs">

	  <div id="tabs-1">
	    <table class="table">
	     <tr>
	      <td width=20%>이름</td>
	      <td width=80%>
	       <input type=text class="input-sm" name="name" size=50 id="e_name">
	      </td>
	     </tr>
	     <tr>
	      <td width=20%>이메일</td>
	      <td width=80%>
	        <input type=text class="input-sm" name="email" size=50 id="email">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	        <input type=button class="btn-sm btn-primary" value="검색" id="emailBtn">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	       <span id="result_email"></span>
	      </td>
	     </tr>
	    </table>
	  </div>
	  <div id="tabs-2">
	    <table class="table">
	     <tr>
	      <td width=20%>이름</td>
	      <td width=80%>
	       <input type=text class="input-sm" name="name" size=50 id="p_name">
	      </td>
	     </tr>
	     <tr>
	      <td width=20%>전화번호</td>
	      <td width=80%>
	        <input type=text class="input-sm" name="phone" size=50 id="phone">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	        <input type=button class="btn-sm btn-primary" value="검색" id="phoneBtn">
	      </td>
	     </tr>
	     <tr>
	      <td class="text-center" colspan="2">
	       <span id="result_phone"></span>
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