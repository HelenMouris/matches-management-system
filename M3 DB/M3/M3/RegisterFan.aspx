<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/RegisterMaster.Master" CodeBehind="RegisterFan.aspx.cs" Inherits="M3.RegisterFan" %>


<asp:Content ID="registerClubRep" ContentPlaceHolderID="registerClubRep" runat="server">
    <div class="card-header bg-success">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a id="sam" class="nav-link" href="/AddSportsAssociationManager.aspx" style="color: white">Sports Association Manager</a>
            </li>
            <li class="nav-item">
                <a id="clubRep" class="nav-link" href="/RegisterClubRepresentative.aspx" style="color: white">Club Representative</a>
            </li>
            <li class="nav-item">
                <a id="stadiumMan" class="nav-link" href="/AddStadiumManager.aspx" style="color: white">Stadium Manager</a>
            </li>
            <li class="nav-item">
                <a id="fan" class="nav-link active" href="/RegisterFan.aspx" style="color: #008443">Fan</a>
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
            <asp:TextBox ID="nationalId" runat="server" class="form-control" placeholder="National Id"></asp:TextBox>
            <label for="nationalId">National Id</label>
        </div>
        <div class="form-floating mb-3">
            <asp:TextBox ID="phone" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox>
            <label for="phone">Phone Number</label>
        </div>
        <div class="form-floating mb-3">
            <asp:TextBox ID="birthDate" runat="server" class="form-control" placeholder="Birthdate"></asp:TextBox>
            <label for="birthDate">Birthdate</label>
        </div>
        <div class="form-floating mb-3">
            <asp:TextBox ID="address" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
            <label for="address">Address</label>
        </div>
        <div>
            <asp:Button ID="addFan" runat="server" CssClass="btn btn-success" OnClick="addFanClick" Text="Register" />
        </div>
    </div>
</asp:Content>
