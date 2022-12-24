<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepSendRequest.aspx.cs" Inherits="M3.ClubRepSendRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="clublabel" runat="server" Text="Club you are Representing"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="club" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumlabel" runat="server" Text="Stadium"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="stadium" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="starttimelabel" runat="server" Text="Start Time"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="startTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="sendRequest" runat="server" Text="Send Request" OnClick="sendRequest_Click" />
        </div>
    </form>
</body>
</html>
