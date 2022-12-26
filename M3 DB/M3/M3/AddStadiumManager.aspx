<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/RegisterMaster.Master" CodeBehind="AddStadiumManager.aspx.cs" Inherits="M3.AddStadiumManager" %>

<asp:Content ID="registerStadiumManager" ContentPlaceHolderID="registerStadiumManager" runat="server">

    <div class="card-header bg-success">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a id="sam" class="nav-link" href="/AddSportsAssociationManager.aspx" style="color: white">Sports Association Manager</a>
            </li>
            <li class="nav-item">
                <a id="clubRep" class="nav-link" href="/RegisterClubRepresentative.aspx" style="color: white">Club Representative</a>
            </li>
            <li class="nav-item">
                <a id="stadiumMan" class="nav-link active" href="/AddStadiumManager.aspx" style="color: #008443">Stadium Manager</a>
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
        <div class="form-floating mb-3">
            <asp:TextBox ID="stadium" runat="server" class="form-control" placeholder="Stadium"></asp:TextBox>
            <label for="stadium">Stadium</label>
        </div>
        <div>
            <asp:Button ID="addManager" runat="server" CssClass="btn btn-success" OnClick="addManager_Click" Text="Register" />
        </div>
    </div>
</asp:Content>
