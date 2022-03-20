<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Login_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Content/js/bootstrap.min.js"></script>
    <script src="../../Content/js/bootstrap.bundle.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div style="margin-left: 40px">
            <h2 class="text-center">Multi User Address Book</h2>

            <h3 align="center">User Registration Form</h3>
            
            <br />
            <asp:Label ID="lblName" runat="server" Text="Label" >User Name:</asp:Label>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="txtUserName" CssClass="alert-danger " Display="None"  BorderStyle="Solid"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtUserName" runat="server" Class="form-control"></asp:TextBox><br />

             <asp:Label ID="lblPassword" runat="server" Text="Label">Password:</asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" Class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txtPassword" CssClass="alert-danger" Display="None" BorderStyle="Solid"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPassword" runat="server"  ErrorMessage="Enter Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character" sage="RegularExpressionValidator" ControlToValidate="txtPassword" CssClass="alert-danger" Display="None" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!%*?&amp;]{8,}" BorderStyle="Solid"></asp:RegularExpressionValidator>
            <br />

            <asp:Label ID="lblMobile" runat="server" Text="Label">Mobile No:</asp:Label>
            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Enter Valid Mobile No" ControlToValidate="txtMobile" Display="None"  CssClass="alert-danger" BorderStyle="Solid"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Enter Indian Mobile No" ControlToValidate="txtMobile" CssClass="alert-danger" Display="None" ValidationExpression="^[6-9][0-9]{9}$" BorderStyle="Solid"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtMobile" runat="server" Class="form-control"></asp:TextBox><br />

             <asp:Label ID="lblEmail" runat="server" Text="Label">Email:</asp:Label>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txtEmail" CssClass="alert-danger" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" BorderStyle="Solid"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtEmail" runat="server" Class="form-control"></asp:TextBox><br />

            <asp:Label ID="lblDisplayName" runat="server" Text="Label">Display Name:</asp:Label>
            <asp:RequiredFieldValidator ID="rfvDisplayName" runat="server" ErrorMessage="Enter Valid Mobile No" ControlToValidate="txtDisplayName" Display="None"  CssClass="alert-danger" BorderStyle="Solid"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtDisplayName" runat="server" Class="form-control" ></asp:TextBox><br />

            <asp:ValidationSummary ID="vsForm" runat="server" BorderStyle="Solid" CssClass="alert-danger" />
            <br />
            <asp:Button ID="btnSave" runat="server" Class="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnReset" runat="server" Class="btn btn-dark" Text="Reset" OnClick="btnReset_Click" />
            <asp:HyperLink ID="hlRegistration" runat="server" NavigateUrl="~/AdminPanel/Login_Registration/Login.aspx">Click Here For Login</asp:HyperLink>
            <asp:Label ID="lblMessage" runat="server" CssClass="alert-success"></asp:Label>
        </div>
    </form>
</body>
</html>
