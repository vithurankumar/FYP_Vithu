using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["registersuccess"] != null)
            {
                Response.Write("<script>alert('register successfull');</script");
            }

            if(Request.QueryString["login"] != null)
            {
                String username = Request.Form["username"];
                String password = Request.Form["password"];
                bool loginResult = new helper().Login(username, password);
                if(loginResult == true)
                {
                    String userRole = Session["UserRole"].ToString();
                    if (userRole.Equals("Employee"))
                    {
                        Response.Redirect("Default.aspx");
                    }
                    if (userRole.Equals("HR"))
                    {
                        Response.Redirect("HRDefault.aspx");

                    }
                    if (userRole.Equals("Admin"))
                    {
                        Response.Redirect("AdminDefault.aspx");
                    }
                }
            }
        }
    }
}