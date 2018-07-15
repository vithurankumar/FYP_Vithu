using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Admin_Default : System.Web.UI.Page
    {
        public SqlDataReader sdr;   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"]!= null && Session["UserRole"].ToString()=="Administrator")
            {
                String query = "SELECT * FROM Feedback";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
                if (Request.QueryString["deletefeedback"] != null)
                {
                    string fid = Request.QueryString["deletefeedback"];
                    string query2 = $"DELETE FROM Feedback WHERE F_id={fid}";
                    helper.executeQuery(query2);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}