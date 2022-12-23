<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddClub.aspx.cs" Inherits="M3.AddClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
            <asp:Label ID="clubname" runat="server" Text="Club Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="cname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="clublocation" runat="server" Text="Club Location:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="clocation" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="AddsClub" runat="server" Text="Add Club" OnClick="AddsClub_Click" />
        </div>
    </form>
</body>
</html>
