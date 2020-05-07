<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="ChiTietWatch.aspx.cs" Inherits="BTL.ChiTietWatch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ChiTietWatch.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="wrapper" id="WrapDetailWatch"  style="width:92vw;max-width: 1257px;margin: 0 auto;">
    <div class="container">
		<div class="head_Title">
			<a href="/">Trang chủ</a>
			<span>></span>
            <asp:LinkButton ID="lnkNameTypeDH" runat="server"></asp:LinkButton>
		</div>
        <div class="ctdh1">
			<div class="wrap_image fl-left">
				<a href="#"><asp:Literal ID="ltImage" runat="server"></asp:Literal></a> 
			</div>
			<div class="ctdh2">
				<div class="nameDH">
					<asp:Literal ID="ltNameDH" runat="server"></asp:Literal>
				</div>
				<div class="content_head fl-left">
					Giá bán: <font color="red" size="+2"><asp:Literal ID="ltPrice" runat="server"></asp:Literal> đ</font><br/>
                    <asp:ImageButton ID="btnMua" src="/images/Capture17.png" runat="server" CommandArgument="" OnClick="btnMua_Click"/>
					<a href="#"><asp:Literal ID="ltImage_MuaTraGop" runat="server"></asp:Literal></a><br/>
					<b>Thông số kỹ thuật</b>
					<p></p>
					<div class="tskt">
						<div class="fl-left tskt1">Thương Hiệu:</div>
						<div><asp:Literal ID="ltThuongHieu" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Xuất xứ:</div>
						<div><asp:Literal ID="ltXuatXu" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt">
						<div class="fl-left tskt1">Kiểu dáng:</div>
						<div><asp:Literal ID="ltKieuDang" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Năng lượng:</div>
						<div><asp:Literal ID="ltNangLuong" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt ">
						<div class="fl-left tskt1">Độ chịu nước:</div>
						<div><asp:Literal ID="ltDoChiuNuoc" runat="server"></asp:Literal> ATM</div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Chất liệu mặt:</div>
						<div><asp:Literal ID="ltChatLieuMat" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt">
						<div class="fl-left tskt1">Đường kính mặt</div>
						<div><asp:Literal ID="ltDuongKinhMat" runat="server"></asp:Literal> mm</div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Chất liệu dây:</div>
						<div><asp:Literal ID="ltChatLieuDay" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt ">
						<div class="fl-left tskt1">Size dây:</div>
						<div><asp:Literal ID="ltSizeDay" runat="server"></asp:Literal> mm</div>
					</div>
				</div>
				<div class=" fl-right menu_Choose_right">
					<div><b>Chọc cửa hàng gần bạn nhất</b></div>
					<div >
						<select class="chooses" name="Chọn thành phố">
							<option>Chọn thành phố</option>
						</select>
					</div>
					<div>
						<select class="chooses" name="Chọn quẩn huyện">
							<option>Chọn quẩn huyện</option>
						</select>
					</div>
					<div><p>Danh sách cửa hàng</p>.....</div>
			</div>
			</div>
		</div>
		<div class="chiTiet">
			<div class="chiTiet_Title"><b>Chi tiết sản phẩm</b></div>
			<div class="chiTiet_content">
				<span>Hãng sản xuất:</span> <asp:Literal ID="ltHangSanXuat2" runat="server"></asp:Literal><br/>
				<span>Chất liệu dây: </span> <asp:Literal ID="ltChatLieuDay2" runat="server"></asp:Literal><br/>
				<span>Chất liệu mặt: </span><asp:Literal ID="ltChatLieuMat2" runat="server"></asp:Literal><br/>
				<span>Chất liệu vỏ: </span><asp:Literal ID="ltChatLieuVo2" runat="server"></asp:Literal><br/>
				<span>Đường kính vỏ: </span><asp:Literal ID="ltDuongKinhVo2" runat="server"></asp:Literal> mm<br/>
				<span>Chống nước: </span><asp:Literal ID="ltDoChongNuoc2" runat="server"></asp:Literal> ATM<br/>
				<span>Bảo hành: </span><asp:Literal ID="ltBaoHanh2" runat="server"></asp:Literal> năm<br/>
				<span>Năng lượng sử dụng: </span><asp:Literal ID="ltNangLuong2" runat="server"></asp:Literal><br/>
				<span>Thương hiệu: </span><asp:Literal ID="ltThuongHieu2" runat="server"></asp:Literal><br/>
				<span>Tư vấn và đặt hàng: </span>098.668.xxxx<br/>
				<span>Thanh toán: </span>Trực tiếp khi nhận sản phẩm<br/>
			</div>
		</div>
		
		<div class="gioiThieu">
			<div class="gioiThieu_Title"><span>Giới thiệu thương hiệu</span></div>
			<div class="ThuongHieuChiTiet">
				<asp:Literal ID="ltThuongHieuChiTiet" runat="server"></asp:Literal>
			</div>
			<div class="wrap_comment">
				<div class="number_comment"><b>0 Comments</b></div>
				<div class="img_comment"><img src="#"/></div>
				<div class="text_comment"><input type="text" placeholder="Add a comment..." /></div>
				<div class="post_comment"><button type="button">Post</button></div>
		   </div>     
            <div class="DHKhac_title"><span>Sản Phẩm Khác</span></div>
            <asp:Repeater ID="rptDHLienQuan" runat="server">
                <HeaderTemplate>
                    <div class="DHKhac">
                      
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="wrap-item-DHKhac">
                        <div class="item-DHKhac fl-left">
                            <a  title='<%#:Eval("nameTypeDH") %> <%#:Eval("code") %>' href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>' >
                                <img src='./images/<%#:Eval("urlPicture") %>' />
                            </a><br>
                            <a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>' class="nameProductDongHo"><span><%#:Eval("nameTypeDH") %><br><%#:Eval("code") %></span></a>
                            <input type="button" value='<%#:string.Format("{0:N0}", Eval("price")) %> đ'>
                        </div>
                    </div>              
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>      
		</div>
	</div>

    </div>
</asp:Content>
