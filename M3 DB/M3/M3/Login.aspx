<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 66px;
            left: 12px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 148px;
            left: 10px;
        }
        .auto-style3 {
            position: absolute;
            top: 186px;
            left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please Log in:<br />
            Username:<br />
            <br />
            <br />
            <asp:TextBox ID="username" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            Password:<br />
            <br />
            <asp:TextBox ID="password" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="signin" runat="server" CssClass="auto-style3" OnClick="login" Style="z-index: 1" Text="Login" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
