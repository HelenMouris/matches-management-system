<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterFan.aspx.cs" Inherits="M3.RegisterFan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="name" runat="server" style="z-index: 1"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="usernameLabel" runat="server" Text="Username"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="username" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="passwordLabel" runat="server" Text="Password"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="nationalIdLabel" runat="server" Text="National Id"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="nationalId" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="phoneLabel" runat="server" Text="Phone Number"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="birthDateLabel" runat="server" Text="BirthDate"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="birthDate" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="addressLabel" runat="server" Text="Address"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="address" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="addFan" runat="server" Text="Register" OnClick="addFanClick" />
        </div>
    </form>
</body>
</html>
