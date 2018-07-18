using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Admin_Enquiries : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "Administrator")
            {
                String query = "SELECT * FROM Enquiries WHERE Sending_to='Admin'";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
                if (Request.QueryString["status"] != null)
                {
                    string eid = Request.QueryString["eid"];
                    string status = Request.QueryString["status"];
                    string querystatus = $"UPDATE Enquiries SET Status='{status}' WHERE Enq_id={eid}";
                    helper.executeQuery(querystatus);
                    Response.Redirect("Admin_Enquiries.aspx");
                }
                if (Request.QueryString["delete"] != null)
                {
                    string eid = Request.QueryString["eid"];
                    string querydelete = $"DELETE FROM Enquiries WHERE Enq_id={eid}";
                    helper.executeQuery(querydelete);
                    Response.Redirect("Admin_Enquiries.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}