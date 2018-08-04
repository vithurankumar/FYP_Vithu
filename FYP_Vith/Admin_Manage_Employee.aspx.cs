using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Admin_Manage_Employee : System.Web.UI.Page
    {
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["UserRole"].ToString() == "Administrator")
            {
                String query = "Select * From Employees";
                SqlConnection conn = helper.getConnection();
                conn.Open();
                SqlCommand cm = new SqlCommand(query, conn);
                sdr = cm.ExecuteReader();
                if (Request.QueryString["addemployee"] != null)
                {
                    String name = Request.Form["name"];
                    String email = Request.Form["email"];
                    String gender = Request.Form["gender"];
                    String username = Request.Form["username"];
                    String contact = Request.Form["contact"];
                    String password = Request.Form["password"];
                    String datejoin = Request.Form["datejoin"];
                    String position = Request.Form["position"];
                    String salary = Request.Form["salary"];
                    String queryaddemp = $"INSERT INTO Employees (Fullname,Gender,Contact,Email,Date_of_join,Position,Salary) VALUES ('{name}','{gender}','{contact}'" +
                        $",'{email}','{datejoin}','{position}',{salary})";
                    String queryadduser = $"INSERT INTO Users (Username,Email,Password,UserRole) VALUES ('{username}','{email}','{password}','Employee')";
                    helper.executeQuery(queryaddemp);
                    helper.executeQuery(queryadduser);
                    Response.Redirect("Admin_Manage_Employee.aspx");
                }

                if (Request.QueryString["delete"] != null)
                {
                    string emp_id = Request.QueryString["delete"];
                    string email = Request.QueryString["email"];
                    String querydeleteemp = $"DELETE FROM Employees WHERE Emp_id={emp_id}";
                    String querydeleteuser = $"DELETE FROM Users WHERE Email={email}";
                    helper.executeQuery(querydeleteemp);
                    helper.executeQuery(querydeleteuser);
                    Response.Redirect("Admin_Manage_Employee.aspx");
                }
                if (Request.QueryString["changepasstrue"] != null)
                {
                    Response.Write("<script>alert('change password success')</script>");
                }
                if (Request.QueryString["changeinfotrue"] != null)
                {
                    Response.Write("<script>alert('change info success')</script>");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}