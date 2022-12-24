<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="RejectRequests.aspx.cs" Inherits="M3.RejectRequests" %>

<asp:Content ID="stadiumManagerRejectRequest" ContentPlaceHolderID="stadiumManagerRejectRequest" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Reject Request
            </div>
            <div class="card-body">
    <div>
            <asp:Label ID="usernamelabel" runat="server" Text="Username:"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="hostclublabel" runat="server" Text="Host Club Name"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="hostClub" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="guestclublabel" runat="server" Text="Guest Club Name"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="guestClub" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="starttimelabel" runat="server" Text="Start Time (YYYY/MM/DD HH:MM:SS)"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="startTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="rejectRequest2" runat="server" Text="Reject Request" OnClick="rejectRequest2_Click" />
        </div>
    </div>
        </div>
    </div>
</asp:Content>

