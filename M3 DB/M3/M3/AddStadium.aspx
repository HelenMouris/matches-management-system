<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStadium.aspx.cs" Inherits="M3.AddStadium" %>

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
            <asp:TextBox ID="sname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumloc" runat="server" Text="Stadium Location:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="slocation" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumcap" runat="server" Text="Stadium Capacity:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="scapacity" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="addStad" runat="server" Text="Add Stadium" OnClick="addStad_Click" />
        </div>
    </form>
</body>
</html>
