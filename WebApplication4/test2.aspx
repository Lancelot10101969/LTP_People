<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="test2.aspx.vb" Inherits="WebApplication4.test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>


<body>



    <form id="form1" runat="server">
        <script language=javascript >
   
</script>

        <div>
                <p>Link 1</p>
<a data-toggle="modal" data-id="ISBN564541" title="Add this item" class="open-AddBookDialog btn btn-primary" href="#addBookDialog">test</a>

<p>&nbsp;</p>


<p>Link 2</p>
<a data-toggle="modal" data-id="ISBN-001122" title="Add this item" class="open-AddBookDialog btn btn-primary" href="#addBookDialog">test</a>

<div class="modal hide" id="addBookDialog">
 <div class="modal-header">
    <button class="close" data-dismiss="modal">×</button>
    <h3>Modal header</h3>
  </div>
    <div class="modal-body">
        <p>some content</p>
        <input type="text" name="bookId" id="bookId" value=""/>
    </div>
</div>
        </div>
    </form>
</body>
</html>
