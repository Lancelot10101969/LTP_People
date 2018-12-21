<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Display_manually.aspx.vb" Inherits="WebApplication4.Display_manually" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        Dim cn As System.Data.SqlClient.SqlConnection
        cn = New System.Data.SqlClient.SqlConnection("Data Source=DESKTOP-J6T4116\SQLEXPRESS;Initial Catalog=LTP_Project;Integrated Security=True;user id=dbTest;password=Support06;")
        cn.Open()




        %>
    <form id="form1" runat="server">
    
        <div>

            <table>
                <tr><th>Person ID</th><th>First Name</th><th>Last Name</th><th>Gender</th></tr>




            </table>
        </div>
        
    </form>
</body>
</html>
