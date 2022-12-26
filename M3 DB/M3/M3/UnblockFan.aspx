<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="UnblockFan.aspx.cs" Inherits="M3.UnblockFan" %>

<asp:Content ID="systemAdminUnblockFan" ContentPlaceHolderID="systemAdminUnblockFan" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Unblock Fan
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="natID" runat="server" class="form-control" placeholder="National Id"></asp:TextBox>
                    <label for="natID">National Id</label>
                </div>
                <div>
                    <asp:Button ID="unblockbutton" runat="server" CssClass="btn btn-success" OnClick="unblockbutton_Click" Text="Unblock" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
