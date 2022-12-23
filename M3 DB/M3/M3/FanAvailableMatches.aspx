<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FanAvailableMatches.aspx.cs" Inherits="M3.FanAvailableMatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="dateLabel" runat="server" Text="Start Date"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="date" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="search" runat="server" Text="Search" OnClick="searchMatches" />
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
