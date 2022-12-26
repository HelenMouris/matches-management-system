<%@ Page Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M3.Login" %>


<asp:Content ID="login" ContentPlaceHolderID="login" runat="server">
    <div class="container">
        <div class="row align-items-center ">
            <div class="col-6 mt-5">
                <div class="d-flex justify-content-center"">  
                    <image>
                        <img width="500" height="500" alt="sports" src="assets\homeImage.png" />
                    </image>
                </div>
            </div>
            <div class="col-6 mt-5">
                <div class="d-flex justify-content-center text-center">
                    <div class="card" style="width: 30rem;">
                        <div class="card-header bg-success" style="color:white">
                            Welcome
                        </div>
                        <div class="card-body">
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="username" runat="server" class="form-control" placeholder="username"></asp:TextBox>
                                <label for="username">Username</label>
                            </div>
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="password" runat="server" class="form-control" placeholder="password" type="password"></asp:TextBox>
                                <label for="password">Password</label>
                                <input type="checkbox" onclick="myFunction()" class="mt-3"><span style="font-size: 14px"> Show Password</span>
                            </div>
                            <div class="mb-3">
                                <asp:Button ID="signin" runat="server" CssClass="btn btn-success" OnClick="login" Style="z-index: 1" Text="Login" />
                            </div>
                             <div class="mb-3">
                                <span>Don't have an account? </span><a href="/AddSportsAssociationManager.aspx">Register</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function myFunction() {
            var x = document.getElementById("login_password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</asp:Content>

