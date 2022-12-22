<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnblockFan.aspx.cs" Inherits="M3.UnblockFan" %>

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
            <asp:Button ID="unblockbutton" runat="server" Text="Unblock Fan" OnClick="unblockbutton_Click" />
        </div>
    </form>
</body>
</html>
