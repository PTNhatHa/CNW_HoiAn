<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <link href='https://fonts.googleapis.com/css?family=Outfit' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>
    <style>
        table{
            margin: auto auto;
            width: 22%;
        }
        td {
            border: none;
        }
    </style>
</head>
<body>
    <form name="formlogin" method="post" action="">
    <% String warning = (String) request.getAttribute("warning"); %>
        <table>
            <caption>Đăng nhập</caption>
            <tr>
                <td>Tên đăng nhập</td>
                <td>
                    <input type="text" name="Username" value="" required="required">
                </td>
            </tr>
            <tr>
                <td>Mật khẩu</td>
                <td>
                    <input type="password" name="Password" value="" required="required">
                </td>
            </tr>
            <tr>
             	<td colspan="2">
             	<% if(warning != null)
				{ %>
                        <span style="color: red;" id="warning"><%=warning %></span>
                <%} %>
                </td>
             </tr>
        </table>
        <table>
            <tr>
                <td style="text-align: center">
                    <input class="bt" type="submit" name="submit" value="OK">
                    <input class="bt" type="reset" name="reset" value="Reset">
                    <a href="javascript:history.back()"><input class="bt" type="button" name="" value="Back"></a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>