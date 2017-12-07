<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form enctype="multipart/form-data" name="excelUpload" method="post" id="uploadForm" action= "${pageContext.request.contextPath}/diagram/excel/6">
		        <div class="input-group">
		            <input type="text" class="form-control" readonly>
					<span class="input-group-btn">
					    <span class="btn btn-file" style="border-radius:4px;">
					        Choose File<input type="file" single id="excelFile" name="excelFile">
					    </span>
					</span>            
		        </div>			
				<p style="margin-top:29px;">관계도 이름</p>
				<input type="text" id="fileName" name="fileName">
				<input type="submit" class="btn active btn_blue" style="width:136px; height:36px; margin:30px 325px 0 325px;" value="관계도 등록">
</form>

</body>
</html>