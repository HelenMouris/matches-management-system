<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SportsAssocManagerMaster.Master" CodeBehind="AlreadyPlayedMatches.aspx.cs" Inherits="M3.AlreadyPlayedMatches" %>

<asp:Content ID="sportsAssocManagerAlreadyPlayedMatches" ContentPlaceHolderID="sportsAssocManagerAlreadyPlayedMatches" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Already Played Matches
            </div>
            <div class="card-body">
        <div>
            <asp:GridView ID="GridView1" runat="server" Width="600px"></asp:GridView>
        </div>
            </div>
        </div>
    </div>

</asp:Content>
