<%@page import="model.bean.detail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.catalogue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styleUser.css">
</head>
<body>
    <form action="">
    <% 
    	ArrayList<detail> listDetails = (ArrayList<detail>) request.getAttribute("listDetails");
     	catalogue ctl = (catalogue) request.getAttribute("ctl");  
     	ArrayList<String> listTitle = new ArrayList<String>();
     	for(int i=0; i<listDetails.size(); i++)
     	{
     		if(listTitle.contains(listDetails.get(i).getTitle()))
     		{
     			continue;
     		}
     		else
     		{
     			listTitle.add(listDetails.get(i).getTitle());
     		}
     	}
     %>
        <section class="section2">
            <div class="section2-content">
                <p class="title"><%= ctl.getName_Catalogue() %></p>
                <% 
                	for(int t=0; t<listTitle.size(); t++)
                	{
                		int dem=0;
	                	for(int i=0; i<listDetails.size(); i++)
	                	{ 
	                		if(listTitle.get(t).equals(listDetails.get(i).getTitle()))
	                		{
	                			dem=dem+1;
	                		%>
			                <div class="diadiem-post">
			                	<% if(dem==1){ %>
			                    	<p class="subtitle" style=""><%= listDetails.get(i).getTitle() %></p>
			                    <%} %>
			                    <div class="post"> <!--Loop-->
			                        <p style="font-weight: 900; margin-top: 24px; font-size: 20px;"><%= listDetails.get(i).getName() %></p>
			                        <p class="content-post" style="margin: 5px 0; font-size: 16px;"><%= listDetails.get(i).getContent() %></p>
			                        <% if(!listDetails.get(i).getOther().equals("")) 
			                        {%>
			                        	<p class="content-post" style="margin: 0 0 5px 0; font-weight: 900">Address:<%= listDetails.get(i).getOther() %></p>
			                        <%} %>
			                        <% for(int j=0; j < listDetails.get(i).getListImages().size(); j++) 
			                    	{
			                        	Integer s = 100/listDetails.get(i).getListImages().size();
			                   		%>
			                    		<img class="content-img" src="<%= listDetails.get(i).getListImages().get(j).getImage() %>" alt="image" style="width: <%= s%>%;">
			                   		<%} %>
			                    </div>
			                </div>
                <%			}
	                	} 
                	}
                %>
            </div>
        </section>
    </form>
</body>
</html>