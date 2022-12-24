<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/RegisterMaster.Master" CodeBehind="RegisterClubRepresentative.aspx.cs" Inherits="M3.RegisterClubRepresentative" %>


<asp:Content ID="registerClubRep" ContentPlaceHolderID="registerClubRep" runat="server">
        <div>
            <div>
                <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="name" runat="server" style="z-index: 1"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="usernameLabel" runat="server" Text="Username"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="username" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="passwordLabel" runat="server" Text="Password"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="clubNameLabel" runat="server" Text="Club Name"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="clubname" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="addclubrepresentative" runat="server" Text="Register" OnClick="addClubRepresentative" />
        </div>

</asp:Content>