<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/FanMaster.Master" CodeBehind="FanPurchaseTicket.aspx.cs" Inherits="M3.FanPurchaseTicket" %>

<asp:Content ID="fanPurchaseTicket" ContentPlaceHolderID="fanPurchaseTicket" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Purchase Tickets
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="nationalID" runat="server" class="form-control" placeholder="National Id"></asp:TextBox>
                    <label for="nationalID">National Id</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="hostClub" runat="server" class="form-control" placeholder="Host Club"></asp:TextBox>
                    <label for="hostClub">Host Club</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="guestClub" runat="server" class="form-control" placeholder="Guest Club"></asp:TextBox>
                    <label for="guestClub">Guest Club</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="startTime" runat="server" class="form-control" placeholder="Start Time"></asp:TextBox>
                    <label for="startTime">Start Time</label>
                </div>
                <div>
                    <asp:Button ID="purchaseTicket" runat="server" CssClass="btn btn-success" Text="Purchase Ticket" OnClick="purchaseTicket_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
