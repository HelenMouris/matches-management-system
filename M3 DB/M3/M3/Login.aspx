<%@ Page Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M3.Login" %>


<asp:Content ID="login" ContentPlaceHolderID="login" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-6 text-center">
                <image>
                    <img width="500" height="500" alt="sports" src="assets\homeImage.png" />
                </image>
            </div>
            <div class="col-6 text-center">
                <div>
                    <asp:Label ID="usernameLogin" runat="server" Text="Username"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="username" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="passwordLogin" runat="server" Text="Password"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="password" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="signin" runat="server" CssClass="btn btn-dark" OnClick="login" Style="z-index: 1" Text="Login" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

