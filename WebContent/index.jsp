<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script>
	if('${loginUser.name}'){
		location.href = "pds/list.do";
	}else{
		location.href="common/loginForm.do";
	}
</script>