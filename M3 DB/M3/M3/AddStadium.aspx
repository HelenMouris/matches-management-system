<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="AddStadium.aspx.cs" Inherits="M3.AddStadium" %>

<asp:Content ID="systemAdminAddStadium" ContentPlaceHolderID="systemAdminAddStadium" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Add Stadium
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="stadiumname" runat="server" Text="Stadium Name:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="sname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumloc" runat="server" Text="Stadium Location:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="slocation" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumcap" runat="server" Text="Stadium Capacity:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="scapacity" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="addStad" runat="server" Text="Add Stadium" OnClick="addStad_Click" />
        </div>
            </div>
        </div>
    </div>

</asp:Content>
