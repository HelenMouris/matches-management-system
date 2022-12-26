<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="StadiumManager.aspx.cs" Inherits="M3.StadiumManager" %>

<asp:Content ID="stadiumManagerStadium" ContentPlaceHolderID="stadiumManagerStadium" runat="server">
    <div>
        <asp:Button ID="stadiumInfo" runat="server" Text="Stadium Information" OnClick="stadiumInfo_Click" />
    </div>
    <div>
        <asp:Button ID="viewRequests" runat="server" Text="View Requests" OnClick="viewRequests_Click" />
    </div>
    <div>
        <asp:Button ID="acceptRequest" runat="server" Text="Accept a Request" OnClick="acceptRequest_Click" />
    </div>
    <div>
        <asp:Button ID="rejectRequest" runat="server" Text="Reject a Request" OnClick="rejectRequest_Click" />
    </div>
</asp:Content>
