using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Session["login"] = 0;
            Session["giohang"] = new List<clsGioHang>();
            //Session.Timeout = 60; // 60 is number of minutes
        }
    }
}