<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SportsAssocManagerMaster.Master" CodeBehind="ClubsNeverPlayed.aspx.cs" Inherits="M3.ClubsNeverPlayed" %>

<asp:Content ID="sportsAssocManagerClubsNeverPlayed" ContentPlaceHolderID="sportsAssocManagerClubsNeverPlayed" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Clubs Never Played 
            </div>
            <div class="card-body">
                <div>
                    <asp:GridView ID="GridView1" runat="server" Width="600px"></asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
