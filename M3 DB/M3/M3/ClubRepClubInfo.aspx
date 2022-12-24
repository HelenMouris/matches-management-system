<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepClubInfo.aspx.cs" Inherits="M3.ClubRepClubInfo" %>

<asp:Content ID="clubRepClubInfo" ContentPlaceHolderID="clubRepClubInfo" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color:white">
                Club Information
            </div>
            <div class="card-body">
                <div>
                    <asp:Label ID="clubInfoName" runat="server" />
                </div>
                <div>
                    <asp:Label ID="clubInfoLocation" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
