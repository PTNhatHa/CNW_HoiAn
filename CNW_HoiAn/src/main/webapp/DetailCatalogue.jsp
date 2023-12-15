<%@page import="model.bean.detail"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Catalogue</title>
    <link rel="stylesheet" href="style.css">
    <link href='https://fonts.googleapis.com/css?family=Outfit' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>
</head>
<body>
    <form action="" method="post">
    <% ArrayList<detail> listDetails = (ArrayList<detail>) request.getAttribute("listDetails");  %>
        <div class="content">
            <table>
                <caption><%= listDetails.get(0).getCatalogue().getName_Catalogue() %></caption>
                <tr class="tieude">
                    <td style="width: 10%;">ID_Detail</td>
                    <td style="width: 10%;">Title</td>
                    <td style="width: 15%;">Name</td>
                    <td style="width: 25%;">Content</td>
                    <td style="width: 15%;">Other</td>
                    <td style="width: 15%;">Image</td>
                    <td style="width: 10%;">Action</td>
                </tr>
                <!-- Để trong vòng for -->
                <% for(int i=0; i < listDetails.size(); i++)
                	{
                %>
                <tr>
                    <td style="width: 10%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listDetails.get(i).getID_Detail() %></p></td>
                    <td style="width: 10%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listDetails.get(i).getTitle() %></p></td>
                    <td style="width: 15%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listDetails.get(i).getName() %></p></td>
                    <td style="width: 25%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listDetails.get(i).getContent() %></p></td>
                    <td style="width: 15%;"><p class="noidung" style="white-space: pre-wrap; min-height: 1em;"><%= listDetails.get(i).getOther() %></p></td>
                    <td style="width: 15%;">
                    <% for(int j=0; j < listDetails.get(i).getListImages().size(); j++) 
                    	{
                   	%>
                    	<img src="<%= listDetails.get(i).getListImages().get(j).getImage() %>" alt="ảnh" style="width: 45%;">
                   	<%} %>
                    </td>
                    <td class="action" style="width: 10%;">
                        <a href=""><input class="bt" type="button" value="Update"></a>
                        <a href=""><input class="bt" type="button" value="Delete"></a>
                    </td>
                </tr>
                <%} %>
                <!--  -->
                <tr>
                    <td style="width: 10%;"></td>
                    <td style="width: 10%;"></td>
                    <td style="width: 15%;"></td>
                    <td style="width: 25%;"></td>
                    <td style="width: 15%;"></td>
                    <td style="width: 15%;"></td>
                    <td class="action" style="width: 10%;">
                        <!-- <a href="?catalogue=1&showid=<%= listDetails.get(0).getCatalogue().getID_Catalogue() %>&addDetail=1"> -->
                            <input name="addDetail" class="bt" type="submit" value="Add">
                        <!-- </a> -->
                        <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>