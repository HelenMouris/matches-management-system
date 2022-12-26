<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SportsAssocManagerMaster.Master" CodeBehind="SportsAssociationManager.aspx.cs" Inherits="M3.SportsAssociationManager" %>

<asp:Content ID="sportsAssocManager" ContentPlaceHolderID="sportsAssocManager" runat="server">
    <div>
        <asp:Button ID="addMatch" runat="server" Text="Add a Match" OnClick="addMatch_Click" />
    </div>
    <div>
        <asp:Button ID="deleteMatch" runat="server" Text="Delete a Match" OnClick="deleteMatch_Click" />
    </div>
    <div>
        <asp:Button ID="viewUpcomingMatches" runat="server" Text="View Upcoming Matches" OnClick="viewUpcomingMatches_Click" />
    </div>
    <div>
        <asp:Button ID="viewAlreadyPlayedMatches" runat="server" Text="View Already Played Matches" OnClick="viewAlreadyPlayedMatches_Click" />
    </div>
    <div>
        <asp:Button ID="clubsNeverPlayed" runat="server" Text="View Clubs who never played each other " OnClick="clubsNeverPlayed_Click" />
    </div>
</asp:Content>

