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
        <section class="section2">
            <div class="section2-content">
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
                <p class="title"><%= ctl.getName_Catalogue() %></p>
                <% 
                	for(int t=0; t<listTitle.size(); t++)
                	{
                		int dem=0;%>
                		<div style="position: relative; margin-bottom: 24px; text-align: left">
	                	<%for(int i=0; i<listDetails.size(); i++)
	                	{ 
	                		if(listTitle.get(t).equals(listDetails.get(i).getTitle()))
	                		{
	                			dem=dem+1;
								if(dem == 1)
		                			{ %>
	                    				<p class="subtitle"><%= listDetails.get(i).getTitle() %></p>
	                                <%} %>
			                        <div class="short-post">
			                            <div class="short-post-content">
			                                <p class="short-post-title"><%= listDetails.get(i).getName() %></p>
			                                <p class="short-post-text"><%= listDetails.get(i).getContent() %></p>
			                                <p class="short-post-title" style="font-size: 15px;">Address:</p>
			                                <p class="short-post-text" style="margin-left: 25px;"><%= listDetails.get(i).getOther() %></p>        
		                        		</div>
		                        		<img src="<%= listDetails.get(i).getListImages().get(0).getImage() %>" alt="">
		                        	</div>
                				
	                <%		}
		                }
	                	if(dem%2 != 0)
	                	{ %>
	                		<div class="short-post-fake"></div>
	                <%	}
	                	%>
	                	</div>
                	<%}  %>
            </div>
        </section>
    </form>
</body>
</html>