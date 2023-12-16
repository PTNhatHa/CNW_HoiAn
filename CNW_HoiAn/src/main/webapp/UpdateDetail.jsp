<%@page import="model.bean.image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.detail"%>
<%@page import="model.bean.catalogue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% detail dt = (detail) request.getAttribute("dt");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Detail</title>
    <link rel="stylesheet" href="styleAdmin.css">
    <script>
        function checkID_Img()
        {
            var row = event.target.parentNode.parentNode.rowIndex;
            var id = "ID_Image" + row;
            var img = "img" + row;
            var des = "des" + row;
            var ID = document.getElementById(id).value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() 
            {
                if (this.readyState == 4 && this.status == 200) 
                {
                    document.getElementById("warning").innerHTML = xmlhttp.responseText;
                    if(this.responseText == "This id_image has already been used!")
                    {
                        document.getElementById('submit').disabled = true;
                        document.getElementById(img).disabled = true;
                        document.getElementById(des).disabled = true;
                    }
                    else {
                        document.getElementById('submit').disabled = false;
                        document.getElementById(img).disabled = false;
                        document.getElementById(des).disabled = false;
                    }
                }
            };
            xmlhttp.open("GET", "HoiAn_Servlet?catalogue=1&showid=" + <%= dt.getCatalogue().getID_Catalogue() %> + "&updateDetailID=" + <%= dt.getID_Detail() %> + "&checkIDImg=" + ID, true);
            xmlhttp.send();
        }
        function addImg() {
            document.getElementsByName("maxCounts")[0].value = parseInt(document.getElementsByName("maxCounts")[0].value) + 1;
            var index = document.getElementsByName("maxCounts")[0].value;
			var table = document.getElementById("myimg");
            var rowCount = table.rows.length - 1;
            document.getElementsByName("rowCounts")[0].value = rowCount;
            var row = table.insertRow(rowCount);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var ID_Image = "ID_Image" + index;
            var img = "img" + index;
            var des = "des" + index;
            cell1.innerHTML = "<input id='" + ID_Image + "' name='" + ID_Image + "' class='noidung' type='text' value='' placeholder='ID_Image' required oninput=\"checkID_Img()\">";
			cell2.innerHTML = "<input id='" + img + "' name='" + img + "' class='noidung' type='text' value='' placeholder='link img'>";
            cell3.innerHTML = "<input id='" + des + "' name='" + des + "' class='noidung' type='text' value='' placeholder='description img'>";
			cell4.innerHTML = "<input class='bt' type='button' value='Delete' onclick='deleteRow(this)'>";
		}
        function deleteRow(btn) {
			var row = btn.parentNode.parentNode;
			row.parentNode.deleteRow(row.rowIndex);
            document.getElementsByName("rowCounts")[0].value = document.getElementsByName("rowCounts")[0].value - 1;
		}
    </script>
</head>
<body>
    <form action="" method="post">
            <div class="content">
                <table style="width: 50%;">
                    <caption>Update detail of <%= dt.getCatalogue().getName_Catalogue() %></caption>
                    <tr>
                        <td style="width: 5%;">ID_Detail</td>
                        <td><input name="ID_Detail" class="noidung" type="text" value="<%= dt.getID_Detail() %>" placeholder="ID_Detail" readonly></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Title</td>
                        <td><input name="Title" class="noidung" type="text" value="<%= dt.getTitle() %>" placeholder="Title"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Name</td>
                        <td><input name="Name" class="noidung" type="text" value="<%= dt.getName() %>" placeholder="Name"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Content</td>
                        <td><textarea name="Content" class="noidung" type="text" placeholder="Content" required><%= dt.getContent() %></textarea></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Other</td>
                        <td><input name="Other" class="noidung" type="text" value="<%= dt.getOther() %>" placeholder="Other"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Image</td>
                        <td>
                            <div>
                                <table id="myimg" style="margin: auto;">
                                    <tr>
                                        <td style="width: 5%;">ID_Image</td>
                                        <td style="width: 45%;">Link Image</td>
                                        <td style="width: 45%;">Description</td>
                                        <td style="width: 5%;"></td>
                                    </tr>
                                    <!-- vòng lặp -->
									<% ArrayList<image> img = dt.getListImages();
										if(img.size() > 0)
										{
											for(int i=0; i < img.size(); i++)
											{
												%>
												<tr>
                                                    <td><input class='noidung' type='text' value='<%= img.get(i).getID_Image() %>' readonly></td>
                                                    <td><input class='noidung' type='text' value='<%= img.get(i).getImage() %>' placeholder='link img'></td>
                                                    <td><input class='noidung' type='text' value='<%= img.get(i).getDescription() %>' placeholder='description img'></td>
                                                    <td><a href="?catalogue=1&showid=<%= dt.getCatalogue().getID_Catalogue() %>&deleteImage=<%= img.get(i).getID_Image() %>&imgIDDetail=<%= img.get(i).getID_Detail() %>"><input class='bt' type='button' value='Delete'></a></td>
                                                </tr>
												<%
											}
										}
									%>
                                    <!--  -->
                                    <tr>
                                        <td colspan="2">
                                            <input name="maxCounts" class="noidung" type="text" value=<%= img.size() %> hidden>
                                            <span style="color: red;" id="warning"></span>
                                        </td>
                                        <td>
                                            Number of images
                                            <input name="rowCounts" class="noidung" type="text" value=<%= img.size() %>>
                                        </td>
                                        <td><input class="bt" type="button" value="Add" onclick="addImg()"></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                        <td colspan="2" class="action" style="width: 40%;">
                            <input name="SaveUpdateDetail" class="bt" type="submit" value="Save">
                            <input class="bt" type="reset" name="" id="" value="Reset">
                            <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
</body>
</html>