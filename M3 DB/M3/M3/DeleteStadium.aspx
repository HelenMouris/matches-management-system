<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteStadium.aspx.cs" Inherits="M3.DeleteStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="stadiumname" runat="server" Text="Stadium Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="stadname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="sname" runat="server" Text="Delete Stadium" OnClick="sname_Click" />
        </div>
    </form>
</body>
</html>
