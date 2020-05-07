<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adminControl.ascx.cs" Inherits="BTL.admin.adminControl" %>
<div class="wrapAminLogined">
    <div class="nameAminLogined">Quản trị viên:<p><%=Session["username"] %></p></div>
    <div><asp:LinkButton ID="lnkExit" runat="server" OnClick="lnkExit_Click">Thoát</asp:LinkButton></div>
</div>
<div class="wrapper" style="width:100%;">
        <div class="menu_side_left" style="width:200px;margin-right:20px;">
            <ul id="menu">          
                <li><a href="../administrator.aspx">Quản trị</a>  </li>
                <li><a href="administrator.aspx?choose=products">Các Sản phẩm</a></li>
                <li><a href="administrator.aspx?choose=userAdmin">Admin</a></li>
                <li><a href="administrator.aspx?choose=userClient">Người dùng</a></li>
                <li><a href="administrator.aspx?choose=comments">Comment</a> </li>
            </ul>
        </div>
        <div>
            <asp:PlaceHolder ID="LoadRegionAdmin" runat="server"></asp:PlaceHolder>
        </div>
</div>
