using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Manager_Manage_Employee : System.Web.UI.Page
    {
        public SqlDataReader sdr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "HRM")
            {
                String query = $"SELECT * FROM Employees";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();

                if (Request.QueryString["editemployee"] != null)
                {
                    String empid = Request.Form["empid"];
                    String position = Request.Form["position"];
                    String salary = Request.Form["salary"];
                    String addition = Request.Form["addition"];
                    int newsalary = Convert.ToInt32(salary) + Convert.ToInt32(addition);
                    String queryedit = $"UPDATE Employees SET Position='{position}',Salary='{newsalary}' WHERE Emp_id={empid}";
                    helper.executeQuery(queryedit);
                    Response.Redirect("Manager_Manage_Employee.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}