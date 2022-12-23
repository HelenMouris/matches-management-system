<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockFan.aspx.cs" Inherits="M3.BlockFan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="nID" runat="server" Text="National ID:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="natID" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="blockbutton" runat="server" Text="Block Fan" OnClick="blockbutton_Click" />
        </div>
    </form>
</body>
</html>
