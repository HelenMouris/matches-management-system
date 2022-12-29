<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="AddClub.aspx.cs" Inherits="M3.AddClub" %>

<asp:Content ID="systemAdminAddClub" ContentPlaceHolderID="systemAdminAddClub" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Add Club
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="cname" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                    <label for="cname">Name</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="clocation" runat="server" class="form-control" placeholder="Location"></asp:TextBox>
                    <label for="clocation">Location</label>
                </div>
                <div>
                    <asp:Button ID="AddsClub" runat="server" CssClass="btn btn-outline-success" OnClick="AddsClub_Click" Text="Add" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
