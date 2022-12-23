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
    public partial class StadiumInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT s.ID , s.Name, s.Status , s.Location , s.Capacity From dbo.Stadium s INNER JOIN StadiumManager sm ON sm.Stadium = s.ID WHERE sm.username = @stadiumManagerName ", conn);
            cmd.Parameters.AddWithValue("@stadiumManagerName", "shahdsharaf");
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            conn.Close();
        }
    }
}