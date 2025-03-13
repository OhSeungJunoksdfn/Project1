<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
	<section class="">
		<div class="container">
			
			<div class="row">
				<div class="col-md-12 text-center mb-5">
					<h2 class="display-4" onclick="handleTest()">자유게시판</h2>
					
					<div class="hero__search__form" style="float:none;width:100%;margin-bottom:20px">
                            <form action="#">
                                <div class="hero__search__categories" style="width:120px;float:left;text-align:left;padding-left:25px;padding-top:13px">
                                    일상
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="Seach" style="float:left">
                            </form>
                    </div>
                    <div style="height=:200px;float:none">
                    	<select >
						<option value="일상">일상</option>
						<option value="일상">일상</option>
						<option value="일상">일상</option>
						<option value="일상">일상</option>
						<option value="일상">일상</option>
						<option value="일상">일상</option>
						</select>
                    </div>
                    
					<div id="editor" style="height: 500px;">
						<p>Hello World!</p>
						<p>
							Some initial <strong>bold</strong> text
						</p>
						<p>
							<br />
						</p>
					</div>
					<script type="text/javascript" src="quil.js?v=<%=System.currentTimeMillis() %>"></script>
					<div style="margin-top:20px">
						<span><a href="#" class="site-btn" style="float:left">목록</a> </span>
						<span><button onclick="javascript:history.back()" class="site-btn ml-3" style="float:right">완료</button> </span>
						<span><button onclick="javascript:history.back()" class="site-btn" style="float:right">취소</button> </span>
						
					</div>
					
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>