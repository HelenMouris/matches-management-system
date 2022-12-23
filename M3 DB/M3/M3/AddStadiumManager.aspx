<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStadiumManager.aspx.cs" Inherits="M3.AddStadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="namelabel" runat="server" Text="Name"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="usernamelabel" runat="server" Text="Username"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="passwordlabel" runat="server" Text="Password"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumlabel" runat="server" Text="Stadium"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="stadium" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="addManager" runat="server" Text="Add Stadium Manager" OnClick="addManager_Click" />
        </div>
    </form>
</body>
</html>
