<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpcomingMatches.aspx.cs" Inherits="M3.UpcomingMatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 486px;
            height: 133px;
            position: absolute;
            top: 15px;
            left: 10px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="auto-style1">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
