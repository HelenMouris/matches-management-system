<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/FanMaster.Master" CodeBehind="FanAvailableMatches.aspx.cs" Inherits="M3.FanAvailableMatches" %>


<asp:Content ID="fanAvailableMatches" ContentPlaceHolderID="fanAvailableMatches" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 40rem;">
            <div class="card-header bg-success" style="color: white">
                Available Matches
            </div>
            <div class="card-body">
        <div>
            <div>
                <asp:Label ID="dateLabel" runat="server" Text="Start Date"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="date" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="search" runat="server" Text="Search" OnClick="searchMatches" />
            </div>
            <div>
                <asp:GridView ID="GridView1" Width="600px" runat="server"></asp:GridView>
            </div>
        </div>
            </div>
        </div>
    </div>

</asp:Content>
