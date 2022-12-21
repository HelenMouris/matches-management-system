<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="M3.SystemAdmin" %>

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
            top: 167px;
            left: 10px;
        }
        .auto-style5 {
            position: absolute;
            top: 267px;
            left: 9px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 300px;
            left: 10px;
        }
        .auto-style7 {
            position: absolute;
            top: 423px;
            left: 10px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 494px;
            left: 10px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 569px;
            left: 10px;
            z-index: 1;
        }
        .auto-style10 {
            position: absolute;
            top: 623px;
            left: 10px;
        }
        .auto-style11 {
            position: absolute;
            top: 751px;
            left: 10px;
            z-index: 1;
        }
        .auto-style12 {
            position: absolute;
            top: 794px;
            left: 10px;
        }
        .auto-style13 {
            position: absolute;
            top: 874px;
            left: 10px;
            z-index: 1;
            right: 963px;
        }
        .auto-style14 {
            position: absolute;
            top: 905px;
            left: 11px;
            z-index: 1;
        }
        .auto-style15 {
            position: absolute;
            top: 906px;
            left: 78px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Club Name:<br />
            <br />
            <asp:TextBox ID="clubName" runat="server" CssClass="auto-style1" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            Club Location:<br />
            <br />
            <asp:TextBox ID="clubLocation" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addclub" runat="server" CssClass="auto-style3" OnClick="addclub"  Style="z-index: 1" Text="Add Club" />
            <br />
            <br />
            <br />
            club name:<br />
            <br />
            <br />
            <br />
            <asp:TextBox ID="clubname2" runat="server" CssClass="auto-style5"></asp:TextBox>
            <asp:Button ID="deleteclub" runat="server" CssClass="auto-style6" OnClick="Deleteclub" Style="z-index: 1" Text="Deleteclub" />
            <br />
            <br />
            <br />
            <br />
            <br />
            Stadium name:<br />
            <br />
            <asp:TextBox ID="Stadiumname" runat="server" CssClass="auto-style7"></asp:TextBox>
            <br />
            <br />
            Stadium location:<br />
            <asp:TextBox ID="Stadiumlocation" runat="server" CssClass="auto-style8" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <br />
            <br />
            <br />
            Stadium Capacity:<br />
            <asp:TextBox ID="StadiumCapacity" runat="server" CssClass="auto-style9"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="AddStadium" runat="server" CssClass="auto-style10" OnClick="AddStadium" Style="z-index: 1" Text="AddStadium" />
            <br />
            <br />
            <br />
            <br />
            <br />
            Stadium name:<br />
            <br />
            <asp:TextBox ID="Stadiumname2" runat="server" CssClass="auto-style11"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="deleteStadium" runat="server" CssClass="auto-style12" OnClick="DeleteStadium" Style="z-index: 1" Text="DeleteStadium" />
            <br />
            <br />
            <br />
            NationalID:<br />
            <asp:TextBox ID="nationalid1" runat="server" CssClass="auto-style13"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Block" runat="server" CssClass="auto-style14" Text="Block" OnClick="block_Click" />
            <br />
            <asp:Button ID="Unblock" runat="server" CssClass="auto-style15" Text="unblock" OnClick="unblock_Click" />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
