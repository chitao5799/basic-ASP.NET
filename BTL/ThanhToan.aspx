<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="BTL.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ThanhToan.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapThanhToan" class="wrapper"  style="width:92vw;max-width: 1257px;margin: 0 auto;">
        <div class="wrapInput">
            <span class="titleInput">Họ tên:</span>
            <input type="text" id="inputHoTen" class="inputText" name="" placeholder="Nhập họ tên" value="" />
        </div> 
		<div class="wrapInput">
            <span class="titleInput">Email:</span>
            <input type="text" id="inputEmail" class="inputText" name="" placeholder="Nhập email" value="" />
        </div> 
        <div class="wrapInput">
            <span class="titleInput">SĐT:</span>
            <input type="text" id="inputSDT" class="inputText" name="" placeholder="Nhập số điện thoại" value="" />
        </div> 
        <div class="wrapInput">
            <span class="titleInput">Địa chỉ:</span>
            <input type="text" id="inputDiaChi" class="inputText" name="" placeholder="Nhập địa chỉ" value="" />
        </div> 
        <div id="wrapBtn">
            <a href="./TrangChu.aspx" onclick="return checkInput()"><span id="btnDat">Đặt</span></a> 
            <span id="btnHuy">Hủy</span>
        </div>
    </div>
    <script type="text/javascript">
        let hoTen = document.getElementById('inputHoTen');
        let Email = document.getElementById('inputEmail');
        let SDT = document.getElementById('inputSDT');
        let DiaChi = document.getElementById('inputDiaChi');
        let dat = document.getElementById('btnDat');
        let huy = document.getElementById('btnHuy');
        function checkInput() {
            if (hoTen.value.toString().trim()=== '') {
                alert('Họ tên không được để trống');
                return false;
            }
            if (Email.value.toString().trim() === '') {
                alert('Email không được để trống');
                return false;
            }
            if (SDT.value.toString().trim() === '') {
                alert('Số điện thoại không được để trống');
                return false;
            }
            if (DiaChi.value.toString().trim() === '') {
                alert('Địa chỉ không được để trống');
                return false;
            }
            var eArr = Email.value.toString().trim().split('@');
            if (eArr.length !== 2) {
                alert('Email không hợp lệ');
                return false;
            }
            return true;
        }
        //dat.addEventListener('click', function () {
        //    checkInput();
           
        //});
    </script>
</asp:Content>
