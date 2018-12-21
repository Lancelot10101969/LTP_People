<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DisplayAllEmployees.aspx.vb" Inherits="WebApplication4.DisplayAllEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body>
    <form id="form1" runat="server">

        <br /><br /><br />
        <center>

        <div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal">Launch demo modal</button>
        </div>
        </center>




<div class="modal" id="basicExampleModal" role="contentinfo" aria-labelledby="exampleModalLabel"  >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="person_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="person_id" HeaderText="person_id" ReadOnly="True" SortExpression="person_id" />
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                <asp:BoundField DataField="state_id" HeaderText="state_id" SortExpression="state_id" />
                <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LTP_ProjectConnectionString %>" 
            InsertCommand="INSERT INTO [person] ([person_id], [first_name], [last_name], [state_id], [gender], [dob]) VALUES (@person_id, @first_name, @last_name, @state_id, @gender, @dob)" 
            SelectCommand="SELECT * FROM [person]" 
            UpdateCommand="UPDATE [person] SET [first_name] = @first_name, [last_name] = @last_name, [state_id] = @state_id, [gender] = @gender, [dob] = @dob WHERE [person_id] = @person_id">
            <DeleteParameters>
                <asp:Parameter Name="person_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="person_id" Type="Int32" />
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="state_id" Type="Int32" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="dob" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="state_id" Type="Int32" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="dob" Type="DateTime" />
                <asp:Parameter Name="person_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-warning" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-success">Save changes</button>
      </div>
    </div>
  </div>
</div>




    </form>
</body>
</html>
