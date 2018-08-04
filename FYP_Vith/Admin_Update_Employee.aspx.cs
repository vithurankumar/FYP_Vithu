using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Admin_Update_Employee : System.Web.UI.Page
    {
        
        public string fullname = "";
        public string gender = "";
        public string contact = "";
        public string email = "";
        public string datejoin = "";
        public string position = "";
        public string salary = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "Administrator")
            {
                if (Request.QueryString["editid"] != null)
                {
                    string empid = Request.QueryString["editid"];
                    String query = $"Select * From Employees WHERE Emp_id={empid}";
                    SqlConnection conn = helper.getConnection();
                    conn.Open();
                    SqlCommand cm = new SqlCommand(query, conn);
                    SqlDataReader sdr = cm.ExecuteReader();
                    while (sdr.Read())
                    {
                        fullname = sdr["Fullname"].ToString();
                        gender = sdr["Gender"].ToString();
                        contact = sdr["Contact"].ToString();
                        email = sdr["Email"].ToString();
                        datejoin = sdr["Date_of_join"].ToString();
                        position = sdr["Position"].ToString();
                        salary = sdr["Salary"].ToString();
                    }
                }
                if (Request.QueryString["edit"] != null)
                {
                    string empid = Request.QueryString["editid"];
                    String name = Request.Form["name"];
                    String gender = Request.Form["gender"];
                    String contact = Request.Form["contact"];
                    String queryedit = $"UPDATE Employees SET Fullname='{name}',Gender='{gender}',Contact='{contact}' WHERE Emp_id={empid}";
                    helper.executeQuery(queryedit);
                    Response.Redirect("Admin_Manage_Employee.aspx?editinfotrue=true");
                }
                if (Request.QueryString["changepass"] != null)
                {
                    string empid = Request.QueryString["editid"];
                    String newpass = Request.Form["password"];
                    String queryedit = $"UPDATE Users SET Password='{newpass}' WHERE Id={empid}";
                    helper.executeQuery(queryedit);
                    Response.Redirect("Admin_Manage_Employee.aspx?changepasstrue=true");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}