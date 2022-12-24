<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="DeleteStadium.aspx.cs" Inherits="M3.DeleteStadium" %>


<asp:Content ID="systemAdminDeleteStadium" ContentPlaceHolderID="systemAdminDeleteStadium" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Delete Stadium
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="stadiumname" runat="server" Text="Stadium Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="stadname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="sname" runat="server" Text="Delete Stadium" OnClick="sname_Click" />
        </div>
            </div>
        </div>
    </div>

</asp:Content>
