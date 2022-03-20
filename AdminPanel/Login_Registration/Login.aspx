<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Content/js/bootstrap.min.js"></script>
    <script src="../../Content/js/bootstrap.bundle.js"></script>
</head>
<body>
    <form id="form1" runat="server" >

        <div>
            <br />
        </div>
        <div class="container card col-3">
            <h2 class="text-center">Multi User Address Book</h2>

            <h3 class="text-center">Login Panel</h3>
            <asp:Label ID="lblUsername" runat="server" Text="Label" class="col-12">Username:</asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" Class="form-control col-12"></asp:TextBox><br />

            <asp:Label ID="lblPassword" runat="server" Text="Label" class="col-12">Password:</asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" Class="form-control col-12" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="btnSubmit" runat="server" Class="btn btn-success col-12" Text="Login" OnClick="btnSubmit_Click"/>
            <br />
            <asp:Label ID="lblMeassage" runat="server" Text=""></asp:Label>

            <asp:HyperLink ID="hlRegistration" runat="server" NavigateUrl="~/AdminPanel/Login_Registration/Registration.aspx" Target="_blank">Click Here to Registration!!!</asp:HyperLink>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
