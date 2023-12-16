<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Header User</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<form action="" method="post">
        <div class="header">
            <div class="menu">
                <div class="menuu">
                    <a href="HoiAn_Servlet?mod=1" target="centeruser"><input type="button" value="Introduction"></a>
                    <a href="HoiAn_Servlet?mod=2" target="centeruser"><input type="button" value="Transportation"></a>
                    <a href="HoiAn_Servlet?mod=3" target="centeruser"><input type="button" value="Location"></a>
                    <a href="HoiAn_Servlet?mod=4" target="centeruser"><input type="button" value="Cuisine"></a>
                    <a href="HoiAn_Servlet?mod=5" target="centeruser"><input type="button" value="Accomodation"></a>
                </div>
                <div class="login">
                    <a href="HoiAn_Servlet?dangnhap=1" target="_parent"><input type="button" value="Admin"></a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>