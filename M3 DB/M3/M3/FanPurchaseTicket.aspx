<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/FanMaster.Master" CodeBehind="FanPurchaseTicket.aspx.cs" Inherits="M3.FanPurchaseTicket" %>

<asp:Content ID="fanPurchaseTicket" ContentPlaceHolderID="fanPurchaseTicket" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Purchase Tickets
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="nationidlabel" runat="server" Text="National ID Number"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="nationalID" runat="server"></asp:TextBox>
        </div>
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
            <asp:Button ID="purchaseTicket" runat="server" Text="Purchase Ticket" OnClick="purchaseTicket_Click" />
        </div>
            </div>
        </div>
    </div>

</asp:Content>
