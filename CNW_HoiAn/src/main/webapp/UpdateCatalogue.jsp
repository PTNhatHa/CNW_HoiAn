<%@page import="model.bean.catalogue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue</title>
    <link rel="stylesheet" href="styleAdmin.css">
</head>
<body>
    <form action="" method="post">
    <% catalogue ctl = (catalogue) request.getAttribute("ctl"); %>
        <div class="content">
            <table style="width: 50%;">
                <caption>Add Catalogue</caption>
                <tr>
                    <td style="width: 5%;">ID_Catalogue</td>
                    <td><input name="ID_Catalogue" class="noidung" type="text" value="<%= ctl.getID_Catalogue() %>" readonly></td>
                </tr>
                <tr>
                    <td style="width: 5%;">Name_Catalogue</td>
                    <td><input name="Name_Catalogue" class="noidung" type="text" value="<%= ctl.getName_Catalogue() %>"></td>
                </tr>
                    <td colspan="2" class="action" style="width: 40%;">
                        <input name="SaveUpdate" class="bt" type="submit" value="Update">
                        <input class="bt" type="reset" name="" id="" value="Reset">
                        <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>