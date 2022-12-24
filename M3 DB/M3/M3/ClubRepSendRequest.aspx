<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepSendRequest.aspx.cs" Inherits="M3.ClubRepSendRequest" %>

<asp:Content ID="clubRepSendRequest" ContentPlaceHolderID="clubRepSendRequest" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 20rem;">
            <div class="card-header bg-success" style="color: white">
                Send Request
            </div>
            <div class="card-body">
        <div>
            <asp:Label ID="clublabel" runat="server" Text="Club you are Representing"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="club" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="stadiumlabel" runat="server" Text="Stadium"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="stadium" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="starttimelabel" runat="server" Text="Start Time"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="startTime" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="sendRequest" runat="server" Text="Send Request" OnClick="sendRequest_Click" />
        </div>
            </div>
        </div>
    </div>
</asp:Content>
