<%@page import="model.bean.catalogue"%>
<%@page import="java.util.ArrayList"%>
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
        <div class="content">
            <table>
                <caption>Catalogue</caption>
                <tr class="tieude">
                    <td style="width: 30%;">ID_Catalogue</td>
                    <td style="width: 30%;">Name_Catalogue</td>
                    <td style="width: 40%;">Action</td>
                </tr>
                <!-- Để trong vòng for -->
                <% ArrayList<catalogue> listCatalogues = (ArrayList<catalogue>) request.getAttribute("listCatalogues"); 
                	for(int i=0; i < listCatalogues.size(); i++)
                	{
                %>
                <tr>
                    <td style="width: 30%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listCatalogues.get(i).getID_Catalogue() %></p></td>
                    <td style="width: 30%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listCatalogues.get(i).getName_Catalogue() %></p></td>
                    <td class="action" style="width: 40%;">
                        <a href="?catalogue=1&updateid=<%= listCatalogues.get(i).getID_Catalogue() %>"><input class="bt" type="button" value="Update"></a>
                        <a href="?catalogue=1&deleteid=<%= listCatalogues.get(i).getID_Catalogue() %>"><input class="bt" type="button" value="Delete"></a>
                        <a href="?catalogue=1&showid=<%= listCatalogues.get(i).getID_Catalogue() %>"><input class="bt" type="button" value="Show detail"></a>
                    </td>
                </tr>
                <%} %>
                <!--  -->
                <tr>
                    <td style="width: 30%;"></td>
                    <td style="width: 30%;"></td>
                    <td class="action" style="width: 40%;">
                        <input name="Add" class="bt" type="submit" value="Add">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>