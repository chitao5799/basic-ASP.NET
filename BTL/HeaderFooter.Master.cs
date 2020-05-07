using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BTL.KetNoiSQL;
namespace BTL
{
    public partial class HeaderFooter : System.Web.UI.MasterPage
    {
        clsDHforDisplay dh = new clsDHforDisplay();
        protected void Page_Load(object sender, EventArgs e)
        {
           
                get10NameTypeDH();
                List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
                int soLuong=0;
                foreach (clsGioHang sp in arr)
                {
                    soLuong += int.Parse(sp.number);
                }
                TotalWatchBuy.Text = soLuong.ToString();
                
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string search = "/DongHo.aspx?searchKeys=" + txtsearch.Text;
            Response.Redirect(search);
        
        }
        protected void get10NameTypeDH()
        {
            rptDropdownMenu.DataSource = dh.get10TypeDH();
            rptDropdownMenu.DataBind();
        }
    }
}