<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepUpcomingMatches.aspx.cs" Inherits="M3.ClubRepUpcomingMatches" %>

<asp:Content ID="clubRepUpcomingMatches" ContentPlaceHolderID="clubRepUpcomingMatches" runat="server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="form-group">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1"  Width="100%"
                        CssClass="table table-bordered table-condensed table-responsive table-hover"
                        runat="server">
                        <AlternatingRowStyle BackColor="White" />
                        <HeaderStyle BackColor="#008443" Font-Bold="true" Font-Size="Larger" ForeColor="White" />
                        <RowStyle BackColor="#f5f5f5" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
