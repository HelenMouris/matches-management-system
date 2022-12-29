<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepSendRequest.aspx.cs" Inherits="M3.ClubRepSendRequest" %>

<asp:Content ID="clubRepSendRequest" ContentPlaceHolderID="clubRepSendRequest" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color: white">
                Send Host Request
            </div>
            <div class="card-body">
                <div class="dropdown show mb-3">
                    <asp:DropDownList ID="StadiumList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Stadium</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="startTime" runat="server" textmode="DateTimeLocal" class="form-control" placeholder="Start Time"></asp:TextBox>
                    <label for="startTime">Start Time</label>
                </div>
                <div>
                    <asp:Button ID="sendRequest" runat="server" CssClass="btn btn-outline-success" OnClick="sendRequest_Click" Text="Send" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
