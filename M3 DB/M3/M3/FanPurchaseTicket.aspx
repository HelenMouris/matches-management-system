<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/FanMaster.Master" CodeBehind="FanPurchaseTicket.aspx.cs" Inherits="M3.FanPurchaseTicket" %>

<asp:Content ID="fanPurchaseTicket" ContentPlaceHolderID="fanPurchaseTicket" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Purchase Tickets
            </div>
            <div class="card-body">
                <div class="dropdown show mb-3">
                    <asp:DropDownList ID="HostClubList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Host Club</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="dropdown show mb-3">
                    <asp:DropDownList ID="GuestClubList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Guest Club</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="startTime" runat="server" textmode="DateTimeLocal" class="form-control" placeholder="Start Time"></asp:TextBox>
                    <label for="startTime">Start Time</label>
                </div>
                <div>
                    <asp:Button ID="purchaseTicket" runat="server" CssClass="btn btn-outline-success" Text="Purchase" OnClick="purchaseTicket_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
