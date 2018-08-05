using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Manager_Allowance_Details : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        public string hrmusername = "";
        public string hrmemail = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "HRM")
            {
                hrmusername = Session["Username"].ToString();
                hrmemail = helper.getUserEmail(hrmusername);
                if (Request.QueryString["viewid"] != null)
                {
                    string alid = Request.QueryString["viewid"];
                    String query = $"Select a.*, e.* From Allowances a INNER JOIN Employees e ON a.Emp_id=e.Emp_id WHERE a.AL_id={alid}";
                    SqlConnection conn = helper.getConnection();
                    conn.Open();
                    SqlCommand cm = new SqlCommand(query, conn);
                    sdr = cm.ExecuteReader();
                }
                else
                {
                    Response.Redirect("Manager_Manage_Allowance.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}