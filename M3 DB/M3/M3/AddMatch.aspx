<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMatch.aspx.cs" Inherits="M3.AddMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="hostclublabel" runat="server" Text="Host Club"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="hostClub" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="guestclublabel" runat="server" Text="Guest Club"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="guestClub" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="starttimelabel" runat="server" Text="Start Time"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="startTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="endtimelabel" runat="server" Text="End Time"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="endTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="addMatch2" runat="server" Text="Add Match" OnClick="addMatch2_Click" />
        </div>
    </form>
</body>
</html>
