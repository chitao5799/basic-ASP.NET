using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BTL.KetNoiSQL;

namespace BTL.admin
{
    public partial class login : System.Web.UI.UserControl
    {
        controlAdmin admin = new controlAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUserName.Text.Trim()) && !string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                /* admin1:12345   hoặc  ad2:12345 hoặc ad3:ad3    hoặc ad1:ad1*/
                DataTable dt = new DataTable();
                dt = admin.Login(txtUserName.Text.Trim(), txtPassword.Text.Trim());
                if (dt.Rows.Count > 0)
                {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("administrator.aspx");
                }
                else
                {
                    Response.Redirect("administrator.aspx");
                }
            }
        }
    }
}