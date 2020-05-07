using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BTL.KetNoiSQL;
namespace BTL
{
    public partial class ChiTietWatch : System.Web.UI.Page
    {
        string id = "";
        clsDHforDisplay dh = new clsDHforDisplay();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["NameDHid"];
                if(id!=null)
                LoadDetailProduct();
                else {
                    Response.Write("<script>alert('rất tiếc đã xảy ra lỗi');<script/>");
                    Response.Redirect("/");
                    }
            
        }
       
        
        void LoadDetailProduct()
        {
            DataTable dt = new DataTable();
            dt = dh.getInforDHbyID(int.Parse(id));
            if (dt.Rows.Count > 0)
            {
                lnkNameTypeDH.Text = dt.Rows[0]["nameTypeDH"].ToString();
                lnkNameTypeDH.Attributes.Add("href", "/DongHo.aspx?searchByTypeID=" + dt.Rows[0]["typeDHid"].ToString());
                ltImage.Text = "<img src='/images/" + dt.Rows[0]["urlPicture"].ToString() + "' />";
                ltNameDH.Text = dt.Rows[0]["nameTypeDH"].ToString()+" "+ dt.Rows[0]["code"].ToString();
                ltPrice.Text = string.Format("{0:N0}",long.Parse(dt.Rows[0]["price"].ToString()));
                //ltImage_MuaNgay.Text = "<img src='/images/Capture17.png' />";
                ltImage_MuaTraGop.Text= "<img src='/images/Capture18.png' />";
                ltThuongHieu.Text = dt.Rows[0]["xuatXu"].ToString();
                ltXuatXu.Text = dt.Rows[0]["xuatXu"].ToString();
                ltKieuDang.Text = dt.Rows[0]["kieuDang"].ToString();
                ltNangLuong.Text = dt.Rows[0]["nangLuong"].ToString();
                ltDoChiuNuoc.Text = dt.Rows[0]["doChiuNuoc"].ToString();
                ltChatLieuMat.Text = dt.Rows[0]["chatLieuMat"].ToString();
                ltDuongKinhMat.Text = dt.Rows[0]["duongKinhMat"].ToString();
                ltChatLieuDay.Text = dt.Rows[0]["chatLieuDay"].ToString();
                ltSizeDay.Text = dt.Rows[0]["sizeDay"].ToString();
                ltHangSanXuat2.Text = dt.Rows[0]["hangSanXuat"].ToString();
                ltChatLieuDay2.Text = dt.Rows[0]["chatLieuDay"].ToString();
                ltChatLieuMat2.Text = dt.Rows[0]["chatLieuMat"].ToString();
                ltChatLieuVo2.Text = dt.Rows[0]["chatLieuVo"].ToString();
                ltDuongKinhVo2.Text = dt.Rows[0]["duongKinhVo"].ToString();
                ltDoChongNuoc2.Text = dt.Rows[0]["doChiuNuoc"].ToString();
                ltBaoHanh2.Text = dt.Rows[0]["timeBaoHanh"].ToString();
                ltNangLuong2.Text = dt.Rows[0]["nangLuong"].ToString();
                ltThuongHieu2.Text = dt.Rows[0]["xuatXu"].ToString();
                ltThuongHieuChiTiet.Text = dt.Rows[0]["thuongHieu"].ToString();
                btnMua.CommandArgument = dt.Rows[0]["chiTietDHid"].ToString();
                rptDHLienQuan.DataSource = dh.get6DHbyTypeID(int.Parse(dt.Rows[0]["typeDHid"].ToString()));
                rptDHLienQuan.DataBind();
            }
        }
        protected void btnMua_Click(object sender, EventArgs e)
        {
            string id = ((ImageButton)sender).CommandArgument.ToString();
            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            DataTable dt = new DataTable();
            dt = dh.getInforDHbyID(int.Parse(id));
            if (arr.Count == 0)
            {
                arr = new List<clsGioHang>();
                arr.Add(new clsGioHang() { id = dt.Rows[0]["chiTietDHid"].ToString(), img = dt.Rows[0]["urlPicture"].ToString(), name = dt.Rows[0]["nameTypeDH"].ToString() + " " + dt.Rows[0]["code"].ToString(), price = dt.Rows[0]["price"].ToString(), totalMoney = dt.Rows[0]["price"].ToString(), number = "1" });
                Session["giohang"] = arr;
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                bool isChoosed = false;
                foreach (clsGioHang sp in arr)
                {
                    if (sp.id == id)
                    {
                        sp.number = (Int32.Parse(sp.number) + 1).ToString();
                        sp.totalMoney = (long.Parse(sp.totalMoney) +  long.Parse(sp.price)).ToString();
                        isChoosed = true;
                        break;
                    }
                }
                if (isChoosed == false)
                {
                    arr.Add(new clsGioHang() { id = dt.Rows[0]["chiTietDHid"].ToString(), img = dt.Rows[0]["urlPicture"].ToString(), name = dt.Rows[0]["nameTypeDH"].ToString() + " " + dt.Rows[0]["code"].ToString(), price = dt.Rows[0]["price"].ToString(), totalMoney = dt.Rows[0]["price"].ToString(), number = "1" });

                    Session["giohang"] = arr;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    Session["giohang"] = arr;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}