<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/StadiumManagerMaster.Master" CodeBehind="ViewRequests.aspx.cs" Inherits="M3.ViewRequests" %>

<asp:Content ID="stadiumManagerViewRequests" ContentPlaceHolderID="stadiumManagerViewRequests" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 60rem;">
            <div class="card-header bg-success text-center" style="color: white">
                Host Requests
            </div>
            <div class="card-body">
                <div class="form-group">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" Width="100%"
                            CssClass="table table-bordered table-condensed table-responsive"
                            runat="server">
                            <HeaderStyle BackColor="#212529" Font-Bold="true" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <RowStyle BackColor="#f5f5f5" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
