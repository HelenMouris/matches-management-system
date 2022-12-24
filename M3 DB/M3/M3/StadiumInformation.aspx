<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="StadiumInformation.aspx.cs" Inherits="M3.StadiumInformation" %>

<asp:Content ID="stadiumManagerStadiumInfo" ContentPlaceHolderID="stadiumManagerStadiumInfo" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Stadium Information
            </div>
            <div class="card-body">
            <div>
                <asp:GridView ID="GridView1" runat="server" Width="285px"></asp:GridView>
             </div>
            </div>
        </div>
    </div>
</asp:Content>
