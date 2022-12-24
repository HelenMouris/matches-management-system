<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SportsAssocManagerMaster.Master" CodeBehind="DeleteMatch.aspx.cs" Inherits="M3.DeleteMatch" %>

<asp:Content ID="sportsAssocManagerDeleteMatch" ContentPlaceHolderID="sportsAssocManagerDeleteMatch" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Delete Match
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="hostclublabel" runat="server" Text="Host Club"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="hostClub" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="guestclublabel" runat="server" Text="Guest Club"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="guestClub" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="starttimelabel" runat="server" Text="Start Time"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="startTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="endtimelabel" runat="server" Text="End Time"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="endTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="deleteMatch2" runat="server" Text="Delete Match" OnClick="deleteMatch2_Click" />
        </div>
            </div>
        </div>
        </div>

</asp:Content>
