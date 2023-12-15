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
    <script>
        function checkID()
        {
            var ID = document.getElementById('ID_Catalogue').value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() 
            {
                if (this.readyState == 4 && this.status == 200) 
                {
                    document.getElementById("warning").innerHTML = xmlhttp.responseText;
                    if(this.responseText == "This id has already been used!")
                    {
                        document.getElementById('submit').disabled = true;
                        document.getElementById('Name_Catalogue').disabled = true;
                    }
                    else {
                        document.getElementById('submit').disabled = false;
                        document.getElementById('Name_Catalogue').disabled = false;
                    }
                }
            };
            xmlhttp.open("GET", "HoiAn_Servlet?catalogue=1&Add=1&checkIDCatalogue=" + ID, true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
    <form action="" method="post">
    <% String warning = (String) request.getAttribute("warning"); %>
        <div class="content">
            <table style="width: 50%;">
                <caption>Add Catalogue</caption>
                <tr>
                    <td style="width: 5%;">ID_Catalogue</td>
                    <td><input id="ID_Catalogue" name="ID_Catalogue" class="noidung" type="text" value="" placeholder="ID_Catalogue" required oninput="checkID()"></td>
                </tr>
                <tr>
                    <td style="width: 5%;">Name_Catalogue</td>
                    <td><input id="Name_Catalogue" name="Name_Catalogue" class="noidung" type="text" value="" placeholder="Name_Catalogue" required></td>
                </tr>               
                    <td>
                        <span style="color: red;" id="warning"></span>
                    </td>
                    <td class="action" style="width: 40%;">
                        <input id="submit" name="AddSave" class="bt" type="submit" value="Save">
                        <input class="bt" type="reset" name="" id="" value="Reset">
                        <a href="javascript:history.back()"><input class="bt" type="button" value="Back"></a>
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>