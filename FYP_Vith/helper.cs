using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FYP_Vith
{
    public class helper
    {
        public static SqlConnection getConnection()
        {
            SqlConnection conn = null;

            conn = new SqlConnection(@"Data Source=.;Initial Catalog=VIth;Integrated Security=True");
            return conn;
        }

        public static void executeQuery(String strQuery)
        {


            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(strQuery, conn);
            cmd.ExecuteNonQuery();
            closeConnection(conn);

        }
        public static void closeConnection(SqlConnection conn)
        {

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

        }

        public bool isUserExist(String username)
        {
            String query = "SELECT Username FROM Users where Username='" + username + "'";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            bool flag = false;
            if (sdr.HasRows)
            {
                flag = true;
            }
            closeConnection(conn);
            return flag;
        }
        public bool isEmailExists(String email)
        {
            String query = "SELECT Email FROM Users where Email='" + email + "'";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            bool flag = false;
            if (sdr.HasRows)
            {
                flag = true;
            }
            closeConnection(conn);
            return flag;
        }

        public bool Login(String username, string password)
        {

            String query = "SELECT Username, UserRole FROM Users where Username = '" + username + "' and Password = '" + password + "';";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            bool flag = false;
            if (sdr.HasRows)
            {
                flag = true;
                System.Web.HttpContext.Current.Session["Username"] = username;

                while (sdr.Read())
                {
                    System.Web.HttpContext.Current.Session["UserRole"] = sdr["UserRole"].ToString();
                }

            }
            closeConnection(conn);
            return flag;
        }

        public static string getUserId(string username)
        {
            string result = "";
            String query = "SELECT Id FROM Users where Username='" + username + "'";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                result = sdr["Id"].ToString();
            }
            closeConnection(conn);
            return result;
        }

        public static string getUserEmail(string username)
        {
            string result = "";
            String query = "SELECT Email FROM Users where Username='" + username + "'";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                result = sdr["Email"].ToString();
            }
            closeConnection(conn);
            return result;
        }

        public static string getEmployeeId(string empid)
        {
            string result = "";
            String query = "SELECT Emp_id FROM Employees where Emp_id='" + empid + "'";
            SqlConnection conn = getConnection();
            conn.Open();
            SqlCommand cm = new SqlCommand(query, conn);
            SqlDataReader sdr = cm.ExecuteReader();
            while (sdr.Read())
            {
                result = sdr["Emp_id"].ToString();
            }
            closeConnection(conn);
            return result;
        }
    }
}