<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAdmin.ascx.cs" Inherits="BTL.admin.Users.UserAdmin" %>
<div class="wrap_users">
    <div class="DieuKhienAdmin">
        <div  class="btnAminAdd">
            <asp:LinkButton ID="btnAminAdd" runat="server"   OnClick="btnAddNew_Click">Thêm mới</asp:LinkButton>
        </div>
        <div class="btnAminEditInfor">
            <asp:LinkButton ID="btnEditInforAdmin"  runat="server" OnClick="btnEditInfor_Click">Sửa thông tin cá nhân</asp:LinkButton>
        </div>
        <asp:HiddenField ID="hdInsert" runat="server" />
        <asp:HiddenField ID="hdImage" runat="server" />
        <asp:HiddenField ID="hdUserID" runat="server" />
    </div>
    <table style="width:100%" class="tblUsersAdmin">
         <tr>
            <td style="width:100px">Account:</td>
            <td style="width:10px"></td>
            <td><asp:TextBox ID="txtAcc" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:100px">Họ và tên:</td>
            <td style="width:10px"></td>
            <td><asp:TextBox ID="txtAdminName" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td style="width:100px">Giới tính:</td>
            <td style="width:10px"></td>
            <td>
                <asp:DropDownList ID="drpGioiTinh" runat="server">
                    <asp:ListItem Value="0">Nam</asp:ListItem>
                    <asp:ListItem Value="1">Nữ</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
         <tr>
                <td style="width:100px">Ảnh đại diện:</td>
                 <td style="width:10px"></td>
                 <td>
                     <asp:FileUpload ID="fUpImage" runat="server" />
                 </td>
            </tr>
        <tr>
            <td style="width:100px">Password:</td>
            <td style="width:10px"></td>
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:100px">Địa chỉ:</td>
            <td style="width:10px"></td>
            <td><asp:TextBox ID="txtDiaChi" runat="server" ></asp:TextBox></td>
        </tr>
         <tr>
            <td style="width:100px">Điện thoại:</td>
            <td style="width:10px"></td>
            <td><asp:TextBox ID="txtDT" runat="server" ></asp:TextBox></td>
        </tr>
         <tr>
            <td style="width:100px">email:</td>
            <td style="width:10px"></td>
            <td><asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:100px"></td>
            <td style="width:10px"></td>
            <td><asp:Button ID="btnUpdate" runat="server" class="btnUpdateData" Text="Cập nhật" OnClick="btnUpdate_Click" /> </td><!---->
        </tr>
    </table>
</div>