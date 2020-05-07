<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DHDetail.ascx.cs" Inherits="BTL.admin.DongHo.DHDetail" %>


<style type="text/css">
    .auto-style1 {
        width: 143px;
    }
    .auto-style2 {
        width: 145px;
    }
</style>

<asp:MultiView ID="mulDetailWatch" runat="server" ActiveViewIndex="0">
    <asp:View ID="v0" runat="server"><!--view để hiển thị dữ liệu-->
        <div class="DetailWatchTitle titile_watchs"><b>Danh sách các đồng hồ</b></div>
        <div class="btn_addNew"><asp:LinkButton ID="lnkUpdate" runat="server" CssClass="addNewDetailDH" OnClick="lnkAddNew_Click" >Thêm mới</asp:LinkButton></div>
        <asp:DropDownList ID="drpWatchCategory" CssClass="drpWatchCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpWatchCategory_SelectedIndexChanged"></asp:DropDownList>
        <asp:Repeater ID="rptWatchDetails" runat="server" OnItemCommand="rptWatchDetails_ItemCommand">
            <HeaderTemplate>
                <table style="width:100%;" class="rptHed tblDisplay" >
                    <tr  class="tbl_tr_title">
                        <td style="width:100px;">Image</td>
                        <td style="width:400px;">Mã Đồng Hồ</td>
                        <td style="width:100px;">giá</td>
                        <td style="width:100px;">giảm giá</td>
                        <td style="width:100px;">số lượng</td>
                        <td style="width:100px;">kiểu dáng</td>
                        <td style="width:100px;">Hiển thị</td>
                        <td></td>
                    </tr>
               
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="rptItem">
                        <td><img src='/images/<%#:Eval("urlPicture") %>' style="width:100px;"/></td>
                        <td><%#:Eval("code") %></td>
                        <td><%#:string.Format("{0:N0}", Eval("price")) %> đ</td>
                        <td><%#:Eval("sale") %> %</td>
                        <td><%#:Eval("quantity") %></td>
                        <td><%#:Eval("kieuDang") %></td>
                        <td><%#:Eval("active") %></td>
                        <td>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CommandArgument='<%#:Eval("chiTietDHid") %>'  CssClass="lnk">Cập nhật</asp:LinkButton><br /><br /><br />
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%#:Eval("chiTietDHid") %>' OnLoad="msgDel" CssClass="lnk">Xóa</asp:LinkButton>
                        </td>
                </tr>
                
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="rptAlt">
                         <td><img src='/images/<%#:Eval("urlPicture") %>' style="width:100px;" /></td>
                        <td><%#:Eval("code") %></td>
                        <td><%#:string.Format("{0:N0}", Eval("price")) %> đ</td>
                        <td><%#:Eval("sale") %> %</td>
                        <td><%#:Eval("quantity") %></td>
                        <td><%#:Eval("kieuDang") %></td>
                        <td><%#:Eval("active") %></td>
                        <td>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CommandArgument='<%#:Eval("chiTietDHid") %>'  CssClass="lnk">Cập nhật</asp:LinkButton><br /><br /><br />
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%#:Eval("chiTietDHid") %>' OnLoad="msgDel" CssClass="lnk">Xóa</asp:LinkButton>
                        </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            
        </asp:Repeater>   
        <asp:HiddenField ID="hdInsert" runat="server" />
        <asp:HiddenField ID="hdDetailID" runat="server" />
        <asp:HiddenField ID="hdImage" runat="server" />
        
    </asp:View> 
    <asp:View id="v1" runat="server"><!--view để thêm dữ liệu hoặc cập nhật-->
        <div class="DetailWatchTitle titile_watchs"><b>Thêm mới đồng hồ</b></div>
        <table style="width:100%;">
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Loại đồng hồ:</td>
                 <td ></td>
                 <td>
                     <asp:DropDownList ID="drpWatchCategory2" CssClass="drpWatchCategory drpWatchCategoryToAdd" runat="server"></asp:DropDownList>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Mã đồng hồ:</td>
                 <td></td>
                 <td>
                     <asp:TextBox ID="txtCode" runat="server" style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Giá:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtPrice" placeholder="(nhập số nguyên dương)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
             <tr class="tr_tblAddNew">
                <td class="auto-style2">Giảm giá:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtSale" placeholder="(nhập số thực từ 0 đến 100 - đơn vị %)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
             <tr class="tr_tblAddNew">
                <td class="auto-style2">Ảnh</td>
                 <td></td>
                 <td>
                     <asp:FileUpload ID="fUpImage" runat="server" />
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Số lượng:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtQuantity" placeholder="(nhập số nguyên dương)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Kiểu dáng:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtKieuDang" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Năng Lượng:</td>
                 <td></td>
                 <td>
                     <asp:TextBox ID="txtNangLuong" runat="server" style="width:500px"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Độ chịu Nước:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtDoChiuNuoc" placeholder="(nhập số nguyên dương - đơn vị ATM)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Chất liệu mặt:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtChatLieuMat" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Đường kính mặt:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtDuongKinhMat" placeholder="(nhập số thực lớn hơn 0 - đơn vị mm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Chất Liệu Dây:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtChatLieuDay" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Kích cỡ dây:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtSizeDay" placeholder="(nhập số thực lớn hơn 0 - đơn vị mm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Chất liệu vỏ:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtChatLieuVo" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Đường kính vỏ:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtDuongKinhVo" placeholder="(nhập số thực lớn hơn 0 - đơn vị mm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Thời gian bảo hành:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ID="txtTimeBaoHanh" placeholder="(nhập số thực lớn hơn 0 - đơn vị năm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
            </tr>           
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Có hiển thị ?:</td>
                 <td></td>
                 <td>
                     <asp:CheckBox ID="chkActive" runat="server" />
                 </td>
            </tr>   
            <tr class="tr_tblAddNew">
                <td class="auto-style2"></td>
                 <td></td>
                 <td>
                     <asp:Button ID="btnUpdate" runat="server" class="btnUpdateData" Text="Cập nhật" OnClick="btnUpdate_Click" />
                 </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>