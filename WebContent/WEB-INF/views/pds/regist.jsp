<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
</head>
<body> 
   <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
    		<div class="row mb-2">
    			<div class="col-sm-6">
	      			<h1>자료실</h1>
	      		</div>	      		
	    	
	       		
	       		<div class="col-sm-6">
			      <ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item"><a href="list.do"><i class="fa fa-dashboard"></i>자료실</a></li>
			        <li class="breadcrumb-item active">자료등록</li>		        
			      </ol>
		      	</div>
	     	</div>	     	
      	</div>
    </section>

    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">글등록</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm">
							<div class="row">							
								<div class="form-group col-sm-6">
									<label for="important">중요도</label>
									<select class="form-control" name="important" id="important">
										<option value="0">일반 글</option>
										<option value="1">중요 글</option>
									</select>
								</div>
								<div class="form-group col-sm-6">
									<label for="writer">작성자</label> 
									<input type="text" id="writer" readonly
										name="writer" class="form-control" value="${loginUser.id }">
								</div>
							</div>
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="content" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
							</div>
							<div class="form-group">								
								<div class="card card-outline card-success">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
										onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
						</form>
					</div><!--end card-body  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
	

<script>
	window.onload=function(){
		summernote_go($('#content'),'<%=request.getContextPath()%>');		
	}	
</script>   

<script>
	var dataNum = 0;
	
	function addFile_go(){
	
		if($('input[name="uploadFile"]').length >= 5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");
		
		$('.fileInput').append(div);
		
		dataNum++;
	}
	
	function remove_go(dataNum){
		$('div[data-no="'+ dataNum +'"]').remove();
	}
	
	function regist_go(){
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			if(file.value == ""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		}
		
		if($('input[name="title"]').val() == ""){
			alert("제목은 필수입니다.");
			$('input[name="title"]').focus();
			return;
		}
		
		$('form[role="form"]').submit();
	}
</script>
<%@ include file="/WEB-INF/include/footer.jsp"%> 