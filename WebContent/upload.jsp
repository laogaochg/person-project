<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        function geTime() {
            var dateTime=new Date().getTime();
            console.log(document.getElementById("time"));
            document.getElementById("time").value="<%=new Date().getTime()%>";
        }
    </script>
</head>
<body>

<form name="Form2"
      action="<%=request.getContextPath()%>/springUpload.do" method="post"
      enctype="multipart/form-data">
    <h3>使用spring mvc提供的类的方法上传文件</h3>
    <input type="hidden" readonly="readonly" name="time" id="time"></br>
    <input type="file" name="file"/></br> <input type="submit" value="upload"
                                                 onclick="geTime()"/>
</form>

</body>
</html>