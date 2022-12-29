using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace M3
{
    public partial class ViewRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("StadiumManager"))
            {

                Response.Redirect("Login.aspx");

            }
            else
            {

                try
                {
                    string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);
                    SqlCommand cmd = new SqlCommand("select * from dbo.managerReceivedRequests(@managerUsername)", conn);
                    cmd.Parameters.AddWithValue("@managerUsername", Session["username"]);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                    conn.Close();
                }
                catch (Exception exception)
                {
                    Response.Write("<script>alert('please enter valid data')</script>");
                }
            }
        }

      
    }
}