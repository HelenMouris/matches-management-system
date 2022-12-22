<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssociationManager.aspx.cs" Inherits="M3.SportsAssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style12 {
            position: absolute;
            top: 15px;
            left: 10px;
            z-index: 1;
            width: 112px;
        }
        .auto-style13 {
            height: 127px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
