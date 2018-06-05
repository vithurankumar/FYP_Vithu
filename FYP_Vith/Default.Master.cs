using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Default1 : System.Web.UI.MasterPage
    {
        public string username = String.Empty;
        public string userrole = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"]!=null || Session["UserRole"] != null)
            {
                username = Session["Username"].ToString();
                userrole = Session["UserRole"].ToString();
            }
            
        }
    }
}