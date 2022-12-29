﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SystemAdminMaster.Master" CodeBehind="SystemAdmin.aspx.cs" Inherits="M3.SystemAdmin" %>

<asp:Content ID="systemAdmin" ContentPlaceHolderID="systemAdmin" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 30rem;">
            <div class="card-header bg-success" style="color:white">
                Home
            </div>
            <div class="card-body">
                <div  class="m-3">
                    <asp:Label id="name" runat="server"></asp:Label>
                </div>
                <div class="m-3">
                    <asp:Label id="type" runat="server">Account Type: System Admin</asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
