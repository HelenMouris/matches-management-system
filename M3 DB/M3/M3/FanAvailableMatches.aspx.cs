using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class FanAvailableMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("Fan"))
            {

                Response.Redirect("Login.aspx");

            }

        }

        protected void searchMatches(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            var sql = String.Format("select * from availableMatchesToAttend(@datetime)");
            SqlCommand availableMatches = new SqlCommand(sql, conn);
            availableMatches.Parameters.Add(new SqlParameter("@datetime", DateTime.Parse(date.Text)));
            SqlDataReader rdr = availableMatches.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }
    }
}