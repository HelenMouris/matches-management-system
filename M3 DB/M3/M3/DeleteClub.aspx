<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="DeleteClub.aspx.cs" Inherits="M3.DeleteClub" %>

<asp:Content ID="systemAdminDeleteClub" ContentPlaceHolderID="systemAdminDeleteClub" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Delete Club
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="cname" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                    <label for="cname">Name</label>
                </div>
                <div>
                    <asp:Button ID="deletec" runat="server" CssClass="btn btn-danger" OnClick="deletec_Click" Text="Delete" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
