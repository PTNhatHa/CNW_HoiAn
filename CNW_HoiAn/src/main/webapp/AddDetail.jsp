<%@page import="model.bean.catalogue"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Detail</title>
    <link rel="stylesheet" href="style.css">
    <link href='https://fonts.googleapis.com/css?family=Outfit' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>
    <script>
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
            cell1.innerHTML = "<input name='" + ID_Image + "' class='noidung' type='text' value='" + ID_Image + "' placeholder='ID_Image'>";
			cell2.innerHTML = "<input name='" + img + "' class='noidung' type='text' value='" + img + "' placeholder='link img'>";
            cell3.innerHTML = "<input name='" + des + "' class='noidung' type='text' value='" + des + "' placeholder='link img'>";
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
        <% String warning = (String) request.getAttribute("warning"); 
        	String warningimg = (String) request.getAttribute("warningimg"); 
        	catalogue ctl = (catalogue) request.getAttribute("ctl");
        %>
            <div class="content">
                <table style="width: 50%;">
                    <caption>Add Detail for <%= ctl.getName_Catalogue() %></caption>
                    <tr>
                        <td style="width: 5%;">ID_Detail</td>
                        <td><input name="ID_Detail" class="noidung" type="text" value="" placeholder="ID_Detail" required></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Title</td>
                        <td><input name="Title" class="noidung" type="text" value="" placeholder="Title"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Name</td>
                        <td><input name="Name" class="noidung" type="text" value="" placeholder="Name"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Content</td>
                        <td><textarea name="Content" class="noidung" type="text" value="" placeholder="Content" required></textarea></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Other</td>
                        <td><input name="Other" class="noidung" type="text" value="" placeholder="Other"></td>
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
                                    <tr>
                                        <td colspan="2">
                                            <input name="maxCounts" class="noidung" type="text" value=0 hidden>
                                            <% if(warningimg != "")
                                            { %>
                                                <span style="color: red;" id="warning"><%=warningimg %></span>
                                            <%} %>
                                        </td>
                                        <td>
                                            Number of images
                                            <input name="rowCounts" class="noidung" type="text" value=0>
                                        </td>
                                        <td><input class="bt" type="button" value="Add" onclick="addImg()"></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
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
                            <input name="SaveAddDetail" class="bt" type="submit" value="Save">
                            <input class="bt" type="reset" name="" id="" value="Reset">
                            <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
</body>
</html>