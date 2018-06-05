using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["register"]!= null)
            {
                try
                {
                    String email = Request.Form["email"];
                    String username = Request.Form["username"];
                    String password = Request.Form["password"];
                    String userRole = "Employee";
                    String query = "INSERT INTO Users (Username, Email, Password, UserRole) VALUES ('" + username + "','" + email + "','" + password + "','" + userRole + "')";
                    helper.executeQuery(query);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('"+ex+"');</script");
                }
                finally
                {
                    Response.Redirect("Login.aspx?registersuccess=true");
                }
            }

        }
    }
}