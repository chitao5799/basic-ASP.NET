<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DHCategory.ascx.cs" Inherits="BTL.admin.DongHo.DHCategory" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<div class="titile_watchs">Danh Sách Các Loại Đồng Hồ</div>
<asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
    <asp:View ID="v1" runat="server">
        <div class="btn_addNew">
                <asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click">Thêm mới</asp:LinkButton>
         </div>
        <div>
           <asp:Repeater ID="rptDHCategory" runat="server" OnItemCommand="rptDHCategory_ItemCommand">
                <HeaderTemplate>
                    <table style="width:100%;" class="tblDisplay">
                        <tr class="tbl_tr_title">
                            <td style="width:300px;">Loại Đồng Hồ</td>
                            <td style="width:300px;">Xuất xứ</td>
                            <td style="width:300px;">Hãng Sản Xuất</td>
                            <td></td>
                        </tr>          
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CommandArgument='<%#Eval("typeDHid") %>'> <%#:Eval("nameTypeDH") %></asp:LinkButton></td>
                        <td><%#:Eval("xuatXu") %></td>
                        <td><%#:Eval("hangSanXuat") %></td>
                        <td><asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%#Eval("typeDHid") %>' OnLoad="messageDelete">Xóa</asp:LinkButton></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                  </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        
    </asp:View>
    <asp:View ID="v2" runat="server">
        <asp:HiddenField ID="hdCategoryID" runat="server" />
        <asp:HiddenField ID="hdInsert" runat="server" />
        <table>
            <tr class="tr_tblAddNew">
                <td class="td_CateDH_title_addNew" style=" width: 120px;">Loại Đồng Hồ:</td>
                <td><asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="tr_tblAddNew">
               <td class="td_CateDH_title_addNew" style=" width: 120px;">Xuất Xứ:</td>
                <td><asp:TextBox ID="txtXuatxu" runat="server"></asp:TextBox></td>                
            </tr>
            <tr class="tr_tblAddNew">
                <td class="td_CateDH_title_addNew" style=" width: 120px;">Hãng sản xuất:</td>
                <td><asp:TextBox ID="txtHSX" runat="server"></asp:TextBox></td> 
            </tr>
            <tr class="tr_tblAddNew">
                <td class="td_CateDH_title_addNew" style=" width: 120px;">Thương hiệu:</td>
                 <td>
                     <FTB:FreeTextBox ID="txtContent" runat="server"></FTB:FreeTextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td></td>
                <td><asp:Button ID="btnSave" runat="server" class="btnUpdateData" Text="Cập nhật" OnClick="btnSave_Click"/></td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>