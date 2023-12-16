<%@page import="model.bean.catalogue"%>
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
    <link rel="stylesheet" href="styleAdmin.css">
</head>
<body>
    <form action="" method="post">
        <div class="content">
            <table>
            <% catalogue ctl = (catalogue) request.getAttribute("ctl");  %>
                <caption><%= ctl.getName_Catalogue() %></caption>
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
                <% ArrayList<detail> listDetails = (ArrayList<detail>) request.getAttribute("listDetails");  
                	if(listDetails.size() > 0)
                	{
	                 	for(int i=0; i < listDetails.size(); i++)
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
                    	<img src="<%= listDetails.get(i).getListImages().get(j).getImage() %>" alt="ảnh" style="width: 100%;">
                   	<%} %>
                    </td>
                    <td class="action" style="width: 10%;">
                        <a href="?catalogue=1&showid=<%= listDetails.get(i).getCatalogue().getID_Catalogue() %>&updateDetailID=<%= listDetails.get(i).getID_Detail() %>"><input class="bt" type="button" value="Update"></a>
                        <a href="?catalogue=1&showid=<%= listDetails.get(i).getCatalogue().getID_Catalogue() %>&deleteDetailID=<%= listDetails.get(i).getID_Detail() %>"><input class="bt" type="button" value="Delete"></a>
                    </td>
                </tr>
                <%}} %>
                <!--  -->
                <tr>
                    <td style="width: 10%;"></td>
                    <td style="width: 10%;"></td>
                    <td style="width: 15%;"></td>
                    <td style="width: 25%;"></td>
                    <td style="width: 15%;"></td>
                    <td style="width: 15%;"></td>
                    <td class="action" style="width: 10%;">
                            <input name="addDetail" class="bt" type="submit" value="Add">
                        <!-- </a> -->
                        <a href="indexAdmin.jsp" target="_parent"><input class="bt" type="button" value="Home"></a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>