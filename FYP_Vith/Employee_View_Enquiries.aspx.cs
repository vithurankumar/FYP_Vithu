using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Employee_View_Enquiries : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["Username"] != null && Session["UserRole"].ToString() == "Employee")
            {
                string username = Session["Username"].ToString();
                string empemail = helper.getUserEmail(username);
                string empid = helper.getEmployeeId(empemail);
                String query = $"SELECT * FROM Enquiries WHERE Emp_id={empid}";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
            }
            
        }
    }
}