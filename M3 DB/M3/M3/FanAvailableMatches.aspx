<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/FanMaster.Master" CodeBehind="FanAvailableMatches.aspx.cs" Inherits="M3.FanAvailableMatches" %>


<asp:Content ID="fanAvailableMatches" ContentPlaceHolderID="fanAvailableMatches" runat="server">
    <div class="d-flex justify-content-center text-center mt-3">
        <div class="card" style="width: 60rem;">
            <div class="card-header bg-success" style="color: white">
                Available Matches
            </div>
            <div class="card-body">
                <div class=" d-flex row">
                    <div class="mb-3">
                        <label for="date" class="mb-3" style="text-align:left !important">Please choose a Date</label>
                        <div class="input-group">
                            <asp:TextBox ID="date" runat="server" TextMode="DateTimeLocal" class="form-control" placeholder="Date"></asp:TextBox>
                            <span class="input-group-btn m-2">
                                <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-outline-success" OnClick="searchMatches" />
                            </span>
                        </div>
                    </div>
                </div>
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
