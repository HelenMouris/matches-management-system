<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssociationManager.aspx.cs" Inherits="M3.SportsAssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 62px;
            height: 15px;
        }
        .auto-style2 {
            position: absolute;
            top: 37px;
            left: 11px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 95px;
            left: 10px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 150px;
            left: 10px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 186px;
            left: 10px;
        }
        .auto-style6 {
            position: absolute;
            top: 265px;
            left: 10px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 321px;
            left: 10px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 378px;
            left: 10px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 436px;
            left: 10px;
            z-index: 1;
        }
        .auto-style10 {
            position: absolute;
            top: 471px;
            left: 10px;
        }
        .auto-style11 {
            position: absolute;
            top: 472px;
            left: 142px;
            z-index: 1;
        }
        .auto-style12 {
            position: absolute;
            top: 474px;
            left: 286px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            Name:<br />
            <asp:TextBox ID="name1" runat="server" CssClass="auto-style2"></asp:TextBox>
            <br />
            <br />
            Username:<br />
            <asp:TextBox ID="username2" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="password3" runat="server" CssClass="auto-style4"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="AddAssociationManager" runat="server" CssClass="auto-style5" Style="z-index: 1" OnClick="addAssociationManager_Click" Text="addAssociationManager" />
            <br />
            <br />
            <br />
            HostClubName:<br />
            <asp:TextBox ID="HostClubName1" runat="server" CssClass="auto-style6"></asp:TextBox>
            <br />
            <br />
            GuestClubName:<br />
            <asp:TextBox ID="GuestClubName2" runat="server" CssClass="auto-style7"></asp:TextBox>
            <br />
            <br />
            StartTime:<br />
            <asp:TextBox ID="StartTime3" runat="server" CssClass="auto-style8"></asp:TextBox>
            <br />
            <br />
            EndTime:<br />
            <asp:TextBox ID="EndTime4" runat="server" CssClass="auto-style9"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addmatch" runat="server" CssClass="auto-style10" OnClick="Addmatch" Style="z-index: 1" Text="Add Match" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="UpcomingMatches" runat="server" CssClass="auto-style12" OnClick="upcomingMatches" Text="upcoming Matches" />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <asp:Button ID="deletematch" runat="server" CssClass="auto-style11" OnClick="Deletematch" Text="Delete Match" />
    </form>
</body>
</html>
