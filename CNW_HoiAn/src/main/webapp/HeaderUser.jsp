<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Header User</title>
    <link rel="stylesheet" href="style.css">
    <link href='https://fonts.googleapis.com/css?family=Outfit' rel='stylesheet'>
</head>
<body>
	<form action="" method="post">
        <div class="header">
            <div class="menu">
                <div class="menuu">
                    <a><input type="button" value="Giới thiệu"></a>
                    <a><input type="button" value="Phương tiện"></a>
                    <a><input type="button" value="Địa điểm"></a>
                    <a><input type="button" value="Ẩm thực"></a>
                    <a><input type="button" value="Nơi ở"></a>
                </div>
                <div class="login">
                    <a href="HoiAn_Servlet?dangnhap=1" target="_parent"><input type="button" value="Đăng nhập"></a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>