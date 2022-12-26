<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/RegisterMaster.Master" CodeBehind="RegisterClubRepresentative.aspx.cs" Inherits="M3.RegisterClubRepresentative" %>


<asp:Content ID="registerClubRep" ContentPlaceHolderID="registerClubRep" runat="server">
    <div class="card-header bg-success">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a id="sam" class="nav-link" href="/AddSportsAssociationManager.aspx" style="color: white">Sports Association Manager</a>
            </li>
            <li class="nav-item">
                <a id="clubRep" class="nav-link active" href="/RegisterClubRepresentative.aspx" style="color: #008443">Club Representative</a>
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
        <div class="form-floating mb-3">
            <asp:TextBox ID="clubname" runat="server" class="form-control" placeholder="Club"></asp:TextBox>
            <label for="clubname">Club</label>
        </div>
        <div>
            <asp:Button ID="addclubrepresentative" runat="server" CssClass="btn btn-success" OnClick="addClubRepresentative" Text="Register" />
        </div>
    </div>
</asp:Content>
