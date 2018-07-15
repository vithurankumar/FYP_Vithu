using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Employee_Default : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "Employee")
            {

                String query = $"SELECT a.Month, a.Year, a.Overtime, a.Medical, a.Bonus, a.Deduct_pay,a.Deduct_leave_days, a.Total, e.Fullname,e.Salary FROM Allowances a INNER JOIN Employees e ON a.Emp_id=e.Emp_id ORDER BY Month,Year DESC;";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
            }
        }
    }
}