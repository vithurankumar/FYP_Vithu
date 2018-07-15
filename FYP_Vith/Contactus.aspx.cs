using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_Vith
{
    public partial class Contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["addfeedback"] != null)
            {
        
                string email = Request.Form["email"];
                string subject = Request.Form["subject"];
                string message = Request.Form["message"];

                string query = $"INSERT INTO Feedback (Subject, Email, Messages) VALUES ('{subject}','{email}','{message}')";
                helper.executeQuery(query);
                Response.Redirect("Contactus.aspx");
            }
        }
    }
}