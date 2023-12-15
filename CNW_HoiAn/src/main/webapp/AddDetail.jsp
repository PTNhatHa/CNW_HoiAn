<%@page import="model.bean.catalogue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% catalogue ctl = (catalogue) request.getAttribute("ctl");%>
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
        function checkID_Detail()
        {
            var ID = document.getElementById('ID_Detail').value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() 
            {
                if (this.readyState == 4 && this.status == 200) 
                {
                    document.getElementById("warning").innerHTML = xmlhttp.responseText;
                    if(this.responseText == "This id_detail has already been used!")
                    {
                        document.getElementById('submit').disabled = true;
                        document.getElementById('Title').disabled = true;
                        document.getElementById('Name').disabled = true;
                        document.getElementById('Content').disabled = true;
                        document.getElementById('Other').disabled = true;
                        document.getElementById('Add').disabled = true;
                    }
                    else {
                        document.getElementById('submit').disabled = false;
                        document.getElementById('Title').disabled = false;
                        document.getElementById('Name').disabled = false;
                        document.getElementById('Content').disabled = false;
                        document.getElementById('Other').disabled = false;
                        document.getElementById('Add').disabled = false;
                    }
                }
            };
            xmlhttp.open("GET", "HoiAn_Servlet?catalogue=1&showid=" + <%= ctl.getID_Catalogue() %> + "&addDetail=1&checkIDDetail=" + ID, true);
            xmlhttp.send();
        }
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
            xmlhttp.open("GET", "HoiAn_Servlet?catalogue=1&showid=" + <%= ctl.getID_Catalogue() %> + "&addDetail=1&checkIDImg=" + ID, true);
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
                    <caption>Add Detail for <%= ctl.getName_Catalogue() %></caption>
                    <tr>
                        <td style="width: 5%;">ID_Detail</td>
                        <td><input id="ID_Detail" name="ID_Detail" class="noidung" type="text" value="" placeholder="ID_Detail" required oninput="checkID_Detail()"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Title</td>
                        <td><input id="Title" name="Title" class="noidung" type="text" value="" placeholder="Title"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Name</td>
                        <td><input id="Name" name="Name" class="noidung" type="text" value="" placeholder="Name"></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Content</td>
                        <td><textarea id="Content" name="Content" class="noidung" type="text" value="" placeholder="Content" required></textarea></td>
                    </tr>
                    <tr>
                        <td style="width: 5%;">Other</td>
                        <td><input id="Other" name="Other" class="noidung" type="text" value="" placeholder="Other"></td>
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
                                            <span style="color: red;" id="warning"></span>
                                        </td>
                                        <td>
                                            Number of images
                                            <input name="rowCounts" class="noidung" type="text" value=0>
                                        </td>
                                        <td><input id="Add" class="bt" type="button" value="Add" onclick="addImg()"></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: red;" id="warning"></span>
                        </td>
                        <td class="action" style="width: 40%;">
                            <input id="submit" name="SaveAddDetail" class="bt" type="submit" value="Save">
                            <input class="bt" type="reset" name="" id="" value="Reset">
                            <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
</body>
</html>