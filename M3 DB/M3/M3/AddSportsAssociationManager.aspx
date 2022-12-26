<%@ Page Language="C#" MasterPageFile="~/RegisterMaster.Master" AutoEventWireup="true" CodeBehind="AddSportsAssociationManager.aspx.cs" Inherits="M3.AddSportsAssociationManager" %>


<asp:Content ID="registerSam" ContentPlaceHolderID="registerSam" runat="server">

    <div class="card-header bg-success">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a id="sam" class="nav-link active" href="/AddSportsAssociationManager.aspx" style="color: #008443">Sports Association Manager</a>
            </li>
            <li class="nav-item">
                <a id="clubRep" class="nav-link" href="/RegisterClubRepresentative.aspx" style="color: white">Club Representative</a>
            </li>
            <li class="nav-item">
                <a id="stadiumMan" class="nav-link" href="/AddStadiumManager.aspx" style="color: white">Stadium Manager</a>
            </li>
            <li class="nav-item">
                <a id="fan" class="nav-link" href="/RegisterFan.aspx" style="color: white">Fan</a>
            </li>
        </ul>
    </div>
    <div class="card-body">
        <div class="form-floating mb-3">
            <asp:TextBox ID="name" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
            <label for="name">Name</label>
        </div>
        <div class="form-floating mb-3">
            <asp:TextBox ID="username" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
            <label for="username">Username</label>
        </div>
        <div class="form-floating mb-3">
            <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
            <label for="password">Password</label>
        </div>
        <div>
            <asp:Button ID="addAssociationManager" runat="server" CssClass="btn btn-success" OnClick="addAssociationManager_Click" Text="Register" />
        </div>
    </div>
</asp:Content>
