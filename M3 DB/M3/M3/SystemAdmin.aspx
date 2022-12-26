<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="SystemAdmin.aspx.cs" Inherits="M3.SystemAdmin" %>

<asp:Content ID="systemAdmin" ContentPlaceHolderID="systemAdmin" runat="server">
    <div>
        <div>
            <asp:Button ID="addclub" runat="server" Text="AddClub" OnClick="addclub_Click" />
        </div>

        <div>
            <asp:Button ID="deleteclub" runat="server" OnClick="Deleteclub" Text="Deleteclub" />
        </div>

        <div>
            <asp:Button ID="addstadium" runat="server" Text="AddStadium" OnClick="addstadium_Click" />
        </div>

        <div>
            <asp:Button ID="deletestadium" runat="server" Text="DeleteStadium" OnClick="deletestadium_Click" />
        </div>

        <div>
            <asp:Button ID="block" runat="server" Text="Block" OnClick="block_Click" />
        </div>
        <div>
            <asp:Button ID="unblock" runat="server" Text="Unblock" OnClick="unblock_Click" />
        </div>
    </div>
</asp:Content>
