<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="DeleteStadium.aspx.cs" Inherits="M3.DeleteStadium" %>


<asp:Content ID="systemAdminDeleteStadium" ContentPlaceHolderID="systemAdminDeleteStadium" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Delete Stadium
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="stadname" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                    <label for="stadname">Name</label>
                </div>
                <div>
                    <asp:Button ID="deletes" runat="server" CssClass="btn btn-danger" OnClick="sname_Click" Text="Delete" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
