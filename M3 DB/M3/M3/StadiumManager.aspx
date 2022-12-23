<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManager.aspx.cs" Inherits="M3.StadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="stadiumInfo" runat="server" Text="Stadium Information" OnClick="stadiumInfo_Click" />
        </div>
        <div>
            <asp:Button ID="viewRequests" runat="server" Text="View Requests" OnClick="viewRequests_Click" />
        </div>
        <div>
            <asp:Button ID="acceptRequest" runat="server" Text="Accept a Request" OnClick="acceptRequest_Click" />
        </div>
        <div>
            <asp:Button ID="rejectRequest" runat="server" Text="Reject a Request" OnClick="rejectRequest_Click" />
        </div>
        
    </form>
</body>
</html>
