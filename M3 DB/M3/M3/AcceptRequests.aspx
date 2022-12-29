<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="AcceptRequests.aspx.cs" Inherits="M3.AcceptRequests" %>

<asp:Content ID="stadiumManagerAcceptRequest" ContentPlaceHolderID="stadiumManagerAcceptRequest" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Accept Request
            </div>
            <div class="card-body">
                <div class="dropdown show mb-3">
                    <asp:DropDownList ID="HostClubList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Host Club</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="dropdown show mb-3">
                    <asp:DropDownList ID="GuestClubList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Guest Club</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="startTime" runat="server" textmode="DateTimeLocal" class="form-control" placeholder="Start Time"></asp:TextBox>
                    <label for="startTime">Start Time</label>
                </div>
                <div>
                    <asp:Button ID="acceptRequest2" runat="server" CssClass="btn btn-outline-success" OnClick="acceptRequest2_Click" Text="Accept" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
