<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="StadiumManager.aspx.cs" Inherits="M3.StadiumManager" %>

<asp:Content ID="stadiumManagerStadium" ContentPlaceHolderID="stadiumManagerStadium" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Home
            </div>
            <div class="card-body">
                <div class="m-3">
                    <asp:Label ID="name" runat="server"></asp:Label>
                </div>
                <div class="m-3">
                    <asp:Label ID="type" runat="server">Account Type: Stadium Manager</asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
