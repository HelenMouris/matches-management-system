<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="BlockFan.aspx.cs" Inherits="M3.BlockFan" %>

<asp:Content ID="systemAdminBlockFan" ContentPlaceHolderID="systemAdminBlockFan" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Block Fan
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="nID" runat="server" Text="National ID:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="natID" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="blockbutton" runat="server" Text="Block Fan" OnClick="blockbutton_Click" />
        </div>
            </div>
        </div>
    </div>

</asp:Content>
