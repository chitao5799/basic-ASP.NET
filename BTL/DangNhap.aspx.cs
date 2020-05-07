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
    public partial class DangNhap : System.Web.UI.Page
    {
        userKhachHang ukh = new userKhachHang();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected bool checkInput()
        {
                if (string.IsNullOrEmpty(txtAccount.Text.Trim()))
            {
                Response.Write("<script>alert('Tên tài khoản không được để trống');</script>");
                return false;
            }
            if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                Response.Write("<script>alert('Mật khẩu không được để trống');</script>");
                return false;
            }
            return true;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (checkInput() == true)
            {
                DataTable tb = new DataTable();
                tb = ukh.DangNhap(txtAccount.Text.Trim(), txtPassword.Text.Trim());
                if (tb.Rows.Count > 0)
                {
                    Session["loginAccount"] = txtAccount.Text.Trim();
                    Session["userName"] = tb.Rows[0]["userName"];
                    Response.Redirect("/TrangChu.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác');</script>");
                    return;
                }
              
              
            }
        }
    }
}