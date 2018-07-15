using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Employee_Add_Enquiries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] != null && Session["Username"] != null && Session["UserRole"].ToString() == "Employee")
            {
                string username = Session["Username"].ToString();
                string email = helper.getUserEmail(username);
                string empid = helper.getEmployeeId(email);
                if (Request.QueryString["addenquiries"] != null)
                {
                    string sendto = Request.Form["sendto"];
                    string category = Request.Form["category"];
                    string subject = Request.Form["subject"];
                    string messages = Request.Form["messages"];

                    string query = $"INSERT INTO Enquiries (Emp_id, Subject, Email, Messages, Category, Sending_to) VALUES ('{empid}','{subject}','{email}','{messages}','{category}','{email}')";
                    helper.executeQuery(query);
                    Response.Redirect("Employee_Add_Enquiries.aspx");
                }
            }
        }
    }
}