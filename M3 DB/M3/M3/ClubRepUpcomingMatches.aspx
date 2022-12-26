<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepUpcomingMatches.aspx.cs" Inherits="M3.ClubRepUpcomingMatches" %>

<asp:Content ID="clubRepUpcomingMatches" ContentPlaceHolderID="clubRepUpcomingMatches" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 60rem;">
            <div class="card-header bg-success" style="color: white">
                Upcoming Matches 
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
