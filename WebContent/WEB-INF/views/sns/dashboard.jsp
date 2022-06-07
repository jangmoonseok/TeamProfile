<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${dataMap.pageMaker }" var="pageMaker"/>
<c:set value="${dataMap.pdsList }" var="pdsList"/>
<c:set value="${pageMaker.cri }" var="cri"/>
<head>
	<style>
		a{
			color:black;
		}
	</style>
</head>
	<section class="content-header">
		  	<div class="container-fluid">
		  		<div class="row md-2">
		  			<div class="col-sm-6">
		  				<h1>SNS</h1>  				
		  			</div>
		  			<div class="col-sm-6">
		  				<ol class="breadcrumb float-sm-right" style="color:white;">
				        <li class="breadcrumb-item">
				        	<a href="list.do">
					        	<i class="fa fa-dashboard"></i>SNS
					        </a>
				        </li>
				        <li class="breadcrumb-item active">
				        	HOME
				        </li>		        
		    	  </ol>
		  			</div>
		  		</div>
		  	</div>
	</section>
	<hr>
	 
	 <!-- Main content -->
    <section class="content">		
		<div class="row">
			<div class="col-lg-6 importantPds">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">
						중요 자료
						</h3>
						<div class="card-tools">
							<ul class="pagination pagination-sm">
								<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="page">
									<li class="page-item ${page eq cri.page ? 'active' : ''}">
										<a class="page-link" href="javascript:dashBoardList_go(${page }, 'pds')">
										${page }
										</a>
									</li>
								</c:forEach>
								<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
							</ul>
						</div>
					</div>
					
					<div class="card-body">
						<table class="table table-bordered text-center">
							<tr style="font-size:0.95em;">
								<th style="width:10%;">번 호</th>
								<th style="width:40%;">제 목</th>
								<th style="">첨부파일</th>
								<th style="width:15%;">작성자</th>
								<th>등록일</th>
								<th style="width:10%;">조회수</th>
							</tr>	
							<c:forEach items="${pdsList }" var="pds">
								<tr style='font-size:0.85em;'>
									<td>${pds.pno }</td>
									<td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden;
												 white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:OpenWindow('<%=request.getContextPath() %>/pds/detail.do?from=list&pno=${pds.pno }','상세보기',800,700);">
											<span class="col-sm-12 ">${pds.title }</span>
										</a>
										<c:if test="${pds.important eq 1 }">								
											<span class="material-symbols-outlined" style="font-size: 18px; position: absolute; color:red;">
												star
											</span>
										</c:if>	
									</td>
									<td>
										<c:if test="${!empty pds.pfileList }">
											<i class="nav-icon fas fa-file"></i>
										</c:if>
										<c:if test="${empty pds.pfileList }">
											<span>-</span>
										</c:if>
									</td>
									<td>${pds.writer }</td>
									<td>
										<fmt:formatDate value="${pds.regDate }" pattern="yyyy-MM-dd"/>
									</td>
									<td><span class="badge bg-red">${pds.viewcnt }</span></td>
								</tr>
							</c:forEach>	
						</table>
					</div>
				</div>
			</div>
			
		</div>
		
    </section>
<%@ include file="/WEB-INF/include/footer.jsp"%>