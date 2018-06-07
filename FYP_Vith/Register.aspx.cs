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
            if (Request.QueryString["register"] != null)
            {
                String email = Request.Form["email"];
                String username = Request.Form["username"];
                String password = Request.Form["password"];
                String userRole = "Employee";
                bool isUserExist = new helper().isUserExist(username);
                bool isEmailExist = new helper().isEmailExists(email);
                if (!isUserExist)
                {
                    if (!isEmailExist)
                    {
                        String query = "INSERT INTO Users (Username, Email, Password, UserRole) VALUES ('" + username + "','" + email + "','" + password + "','" + userRole + "')";
                        helper.executeQuery(query);
                        Response.Redirect("Login.aspx?registersuccess=true");
                    }
                    else
                    {
                        Response.Write("<script>alert('Email already exists!');</script");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Username already exists!');</script");
                }

            }

        }
    }
}