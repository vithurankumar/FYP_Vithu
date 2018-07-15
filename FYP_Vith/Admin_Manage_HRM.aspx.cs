using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Admin_Manage_HRM : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "Administrator")
            {
                String query = "SELECT * FROM Users WHERE UserRole='HRM'";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
                if (Request.QueryString["addhrm"] != null)
                {
    
                    String email = Request.Form["email"];                   
                    String username = Request.Form["username"];        
                    String password = Request.Form["password"];          
                    String queryadduser = $"INSERT INTO Users (Username,Email,Password,UserRole) VALUES ('{username}','{email}','{password}','HRM')";
                    helper.executeQuery(queryadduser);
                    Response.Redirect("Admin_Manage_HRM.aspx");
                }

                if (Request.QueryString["delete"] != null)
                {
                    string UID = Request.QueryString["delete"];
                    String querydeleteuser = $"DELETE FROM Users WHERE Id={UID}";
                    helper.executeQuery(querydeleteuser);
                    Response.Redirect("Admin_Manage_HRM.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}