<%@ Page Language="C#" MasterPageFile="~/RegisterMaster.Master" AutoEventWireup="true" CodeBehind="AddSportsAssociationManager.aspx.cs" Inherits="M3.AddSportsAssociationManager" %>


<asp:Content ID="registerSam" ContentPlaceHolderID="registerSam" runat="server">

    <div>
        <asp:Label ID="namelabel" runat="server" Text="Name"></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="usernamelabel" runat="server" Text="Username"></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="passwordlabel" runat="server" Text="Password"></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="password" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="addAssociationManager" runat="server" Text="Add Sports Association Manager" OnClick="addAssociationManager_Click" />
    </div>

</asp:Content>
