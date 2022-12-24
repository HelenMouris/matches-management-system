<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="DeleteClub.aspx.cs" Inherits="M3.DeleteClub" %>

<asp:Content ID="systemAdminDeleteClub" ContentPlaceHolderID="systemAdminDeleteClub" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Delete Club
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="clubname" runat="server" Text="Club Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="cname" runat="server"></asp:TextBox>
            </div>
        <div>
            <asp:Button ID="deletec" runat="server" Text="Delete Club" OnClick="deletec_Click" />
        </div>
            </div>
        </div>
    </div>

</asp:Content>
