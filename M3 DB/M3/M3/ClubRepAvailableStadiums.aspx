<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepAvailableStadiums.aspx.cs" Inherits="M3.ClubRepAvailableStadiums" %>


<asp:Content ID="clubRepAvailableStadiums" ContentPlaceHolderID="clubRepAvailableStadiums" runat="server">
        <div>
            <div>
                <asp:Label ID="dateLabel" runat="server" Text="Start Date"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="date" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="search" runat="server" Text="Search" OnClick="searchStadiums" />
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
</asp:Content>
