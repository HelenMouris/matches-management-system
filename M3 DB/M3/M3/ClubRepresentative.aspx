<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClubRepresentative.aspx.cs" Inherits="M3.ClubRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 53px;
            left: 10px;
        }
        .auto-style2 {
            position: absolute;
            top: 129px;
            left: 10px;
        }
        .auto-style3 {
            position: absolute;
            top: 224px;
            left: 10px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 348px;
            left: 9px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 300px;
            left: 10px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Name:<br />
            <br />
            <asp:TextBox ID="name" runat="server" CssClass="auto-style1" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            Username:<br />
            <br />
            <asp:TextBox ID="username" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            Password:<br />
            <br />
            <asp:TextBox ID="password" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addclubrepresentative" runat="server" CssClass="auto-style4" Text="Add Club Representative" OnClick="addClubRepresentative" />
            Club Name:<br />
            <br />
            <asp:TextBox ID="clubname" runat="server" CssClass="auto-style6"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
