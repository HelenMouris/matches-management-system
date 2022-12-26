<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ClubRepMaster.Master" CodeBehind="ClubRepAvailableStadiums.aspx.cs" Inherits="M3.ClubRepAvailableStadiums" %>


<asp:Content ID="clubRepAvailableStadiums" ContentPlaceHolderID="clubRepAvailableStadiums" runat="server">
    <div class="d-flex justify-content-center text-center m-3">
        <div class="card" style="width: 60rem;">
            <div class="card-header bg-success" style="color: white">
                Available Stadiums 
            </div>
            <div class="card-body">
                <div class=" d-flex row">
                    <div class="form-floating mb-3 col-6">
                        <asp:TextBox ID="date" runat="server" class="form-control" placeholder="Date"></asp:TextBox>
                        <label for="date">Date</label>
                    </div>
                    <div class="col-6">
                        <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-outline-success" OnClick="searchStadiums" />
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
