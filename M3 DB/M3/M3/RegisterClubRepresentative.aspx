<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterClubRepresentative.aspx.cs" Inherits="M3.RegisterClubRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="name" runat="server" style="z-index: 1"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="usernameLabel" runat="server" Text="Username"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="username" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="passwordLabel" runat="server" Text="Password"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="clubNameLabel" runat="server" Text="Club Name"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="clubname" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="addclubrepresentative" runat="server" Text="Register" OnClick="addClubRepresentative" />
        </div>
    </form>
</body>
</html>
