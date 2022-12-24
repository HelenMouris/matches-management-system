<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="ViewRequests.aspx.cs" Inherits="M3.ViewRequests" %>

<asp:Content ID="stadiumManagerViewRequests" ContentPlaceHolderID="stadiumManagerViewRequests" runat="server">

        <div class="card" >
            <div class="card-header bg-success text-center" style="color: white">
                The Requests
            </div>
            <div class="card-body"> 
        <div>
            <asp:GridView ID="GridView1" runat="server" Width="1000px">
            </asp:GridView>
        </div>
            </div>
        </div>
   

</asp:Content>
