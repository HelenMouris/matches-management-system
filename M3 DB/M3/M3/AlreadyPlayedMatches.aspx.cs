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
    public partial class AlreadyPlayedMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT hc.Name as HostClub , gc.Name as GuestClub , StartTime , EndTime FROM dbo.Match m inner join dbo.Club hc on m.HostClub = hc.ID inner join dbo.Club gc on gc.ID = m.GuestClub  WHERE StartTime < CURRENT_TIMESTAMP", conn);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            conn.Close();
        }
    }
}