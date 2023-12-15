<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue</title>
    <link rel="stylesheet" href="style.css">
    <link href='https://fonts.googleapis.com/css?family=Outfit' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>
</head>
<body>
    <form action="" method="post">
    <% String warning = (String) request.getAttribute("warning"); %>
        <div class="content">
            <table style="width: 50%;">
                <caption>Add Catalogue</caption>
                <tr>
                    <td style="width: 5%;">ID_Catalogue</td>
                    <td><input name="ID_Catalogue" class="noidung" type="text" value="" placeholder="ID_Catalogue" required></td>
                </tr>
                <tr>
                    <td style="width: 5%;">Name_Catalogue</td>
                    <td><input name="Name_Catalogue" class="noidung" type="text" value="" placeholder="Name_Catalogue" required></td>
                </tr>
                
             	<% if(warning != "")
				{ %>
					<tr>
	             		<td colspan="2">
                        	<span style="color: red;" id="warning"><%=warning %></span>
                        </td>
             		</tr>
                <%} %>
                    <td colspan="2" class="action" style="width: 40%;">
                        <input name="AddSave" class="bt" type="submit" value="Save">
                        <input class="bt" type="reset" name="" id="" value="Reset">
                        <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>