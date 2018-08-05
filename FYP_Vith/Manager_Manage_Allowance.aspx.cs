using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Manager_Manage_Allowance : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        public Dictionary<string, string> allemployees;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "HRM")
            {
                allemployees = new helper().getAllEmployees();
                String query = "Select a.*, e.* From Allowances a INNER JOIN Employees e ON a.Emp_id=e.Emp_id";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
                if (Request.QueryString["addallowance"] != null)
                {
                    string empsal = Request.Form["empid"];
                    string[] empsals = empsal.Split(',');
                    string empid = empsals[0];
                    string year = Request.Form["year"];
                    string month = Request.Form["month"];
                    string overtime = Request.Form["overtime"];
                    string medical = Request.Form["medical"];
                    string bonus = Request.Form["bonus"];
                    string dirdeduct = Request.Form["dirdeduct"];
                    string leavedays = Request.Form["leavedays"];
                    string totbonus = Request.Form["totbonus"];
                    string totdeduct = Request.Form["totdeduct"];
                    string grosssal = Request.Form["grosssal"];
                    string addallquery = $"INSERT INTO Allowances (Emp_id, Month, Year, Overtime, Medical, Bonus, Bonuses, Deduct_pay, Deduct_leave_days, " +
                        $"Deduct_total, Total) VALUES ({empid},'{month}','{year}','{overtime}','{medical}','{bonus}','{totbonus}','{dirdeduct}','{leavedays}', " +
                        $"'{totdeduct}','{grosssal}')";
                    helper.executeQuery(addallquery);
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