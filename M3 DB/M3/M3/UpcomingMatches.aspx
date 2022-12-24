<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SportsAssocManagerMaster.Master" CodeBehind="UpcomingMatches.aspx.cs" Inherits="M3.UpcomingMatches" %>

<asp:Content ID="sportsAssocManagerUpcomingMatches" ContentPlaceHolderID="sportsAssocManagerUpcomingMatches" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Upcoming Matches
            </div>
            <div class="card-body">
        <div>
            <asp:GridView ID="GridView1" Width="600px" runat="server" CssClass="auto-style1">
            </asp:GridView>
        </div>
            </div>
        </div>
    </div>

</asp:Content>
