<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteClub.aspx.cs" Inherits="M3.DeleteClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="clubname" runat="server" Text="Club Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="cname" runat="server"></asp:TextBox>
            </div>
        <div>
            <asp:Button ID="deletec" runat="server" Text="Delete Club" OnClick="deletec_Click" />
        </div>
    </form>
</body>
</html>
