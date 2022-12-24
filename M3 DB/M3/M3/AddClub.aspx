<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="AddClub.aspx.cs" Inherits="M3.AddClub" %>

<asp:Content ID="systemAdminAddClub" ContentPlaceHolderID="systemAdminAddClub" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Add Club
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="clubname" runat="server" Text="Club Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="cname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="clublocation" runat="server" Text="Club Location:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="clocation" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="AddsClub" runat="server" Text="Add Club" OnClick="AddsClub_Click" />
        </div>
            </div>
        </div>
    </div>

</asp:Content>
