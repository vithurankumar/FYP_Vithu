using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class HRDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["textyea"] != null)
            {
                string text = Request.Form["txt"];
                Response.Write("<script>alert('"+text+"')</script>");
            }
        }
    }
}