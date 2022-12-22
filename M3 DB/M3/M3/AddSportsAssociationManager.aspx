<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSportsAssociationManager.aspx.cs" Inherits="M3.AddSportsAssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 41px;
            left: 4px;
            z-index: 1;
        }
    </style>
</head>
<body style="height: 206px">
    <form id="form1" runat="server">
     <div>
         <asp:Label ID="namelabel" runat="server" Text="Name"></asp:Label>
     </div>
        <div>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="usernamelabel" runat="server" Text="Username"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="passwordlabel" runat="server" Text="Password"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="addAssociationManager" runat="server" Text="Add Sports Association Manager" OnClick="addAssociationManager_Click" />
        </div>

        
    </form>
       
    </body>
</html>
