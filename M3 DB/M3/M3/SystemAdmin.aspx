<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="M3.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style6 {
            position: absolute;
            top: 147px;
            left: 12px;
            z-index: 1;
        }
        .auto-style16 {
            position: absolute;
            top: 63px;
            left: 10px;
            z-index: 1;
        }
        .auto-style17 {
            position: absolute;
            top: 231px;
            left: 10px;
        }
        .auto-style18 {
            position: absolute;
            top: 303px;
            left: 10px;
        }
        .auto-style19 {
            position: absolute;
            top: 411px;
            left: 10px;
        }
        .auto-style20 {
            position: absolute;
            top: 476px;
            left: 10px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <div>
            <asp:Button ID="addclub" runat="server" CssClass="auto-style16" Text="AddClub" OnClick="addclub_Click" />
            </div>
            <br />
            <div>
            <asp:Button ID="deleteclub" runat="server" CssClass="auto-style6" OnClick="Deleteclub" Text="Deleteclub" />
                </div>
            <br />
            <br />
            <br />
            <div>
            <asp:Button ID="addstadium" runat="server" CssClass="auto-style17" style="z-index: 1" Text="AddStadium" OnClick="addstadium_Click" />
            </div>
            <br />
        <div>
            <asp:Button ID="deletestadium" runat="server" CssClass="auto-style18" style="z-index: 1" Text="DeleteStadium" OnClick="deletestadium_Click" />
        </div>
            <br />
            <br />
            <br />
        <div>
            <asp:Button ID="block" runat="server" CssClass="auto-style19" style="z-index: 1" Text="Block" OnClick="block_Click" />
        </div>
        <div>
            <asp:Button ID="unblock" runat="server" CssClass="auto-style20" Text="Unblock" OnClick="unblock_Click" />
        </div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
