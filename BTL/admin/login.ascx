<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="BTL.admin.login" %>

<div id="login">
    <h1 id="welcomeToLoginAdmintrative">Chào mừng bạn đến với phần quản trị website!</h1>
    <div class="regionUserName">
        <div>Account:</div>
        <div><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></div>
    </div> 
    <div class="regionPassword">
        <div>Password:</div>
        <div>   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox> </div>
    </div>   
    <div class="buttonlogin">
        <asp:LinkButton ID="btnLoginAdmin" runat="server" Text="Login" OnClick="btnLogin_Click" ></asp:LinkButton>
    </div>
</div>
