<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="AcceptRequests.aspx.cs" Inherits="M3.AcceptRequests" %>

<asp:Content ID="stadiumManagerAcceptRequest" ContentPlaceHolderID="stadiumManagerAcceptRequest" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Accept Request
            </div>
            <div class="card-body">
                <div class="form-floating mb-3">
                    <asp:TextBox ID="username" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                    <label for="username">Username</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="hostClub" runat="server" class="form-control" placeholder="Host Club"></asp:TextBox>
                    <label for="hostClub">Host Club</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="guestClub" runat="server" class="form-control" placeholder="Guest Club"></asp:TextBox>
                    <label for="guestClub">Guest Club</label>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="startTime" runat="server" class="form-control" placeholder="Start Time"></asp:TextBox>
                    <label for="startTime">Start Time</label>
                </div>
                <div>
                    <asp:Button ID="acceptRequest2" runat="server" CssClass="btn btn-success" OnClick="acceptRequest2_Click" Text="Accept" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
