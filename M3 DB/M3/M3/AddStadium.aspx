<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="AddStadium.aspx.cs" Inherits="M3.AddStadium" %>

<asp:Content ID="systemAdminAddStadium" ContentPlaceHolderID="systemAdminAddStadium" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Add Stadium
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="sname" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                    <label for="sname">Name</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="slocation" runat="server" class="form-control" placeholder="Location"></asp:TextBox>
                    <label for="slocation">Location</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="scapacity" runat="server" class="form-control" placeholder="Capacity"></asp:TextBox>
                    <label for="scapacity">Capacity</label>
                </div>
                <div>
                    <asp:Button ID="addStad" runat="server" CssClass="btn btn-success" OnClick="addStad_Click" Text="Add" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
