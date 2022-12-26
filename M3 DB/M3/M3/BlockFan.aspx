<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="BlockFan.aspx.cs" Inherits="M3.BlockFan" %>

<asp:Content ID="systemAdminBlockFan" ContentPlaceHolderID="systemAdminBlockFan" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Block Fan
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="natID" runat="server" class="form-control" placeholder="National Id"></asp:TextBox>
                    <label for="natID">National Id</label>
                </div>
                <div>
                    <asp:Button ID="blockbutton" runat="server" CssClass="btn btn-danger" OnClick="blockbutton_Click" Text="Block" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
