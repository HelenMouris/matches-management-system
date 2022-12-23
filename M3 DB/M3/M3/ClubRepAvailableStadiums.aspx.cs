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
    public partial class ClubRepAvailableStadiums : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchStadiums(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string startDate = date.Text; 

            conn.Open();
            var sql = String.Format("select * from viewAvailableStadiumsOn(@datetime)");
            SqlCommand availableStadiums = new SqlCommand(sql, conn);
            availableStadiums.Parameters.Add(new SqlParameter("@datetime", startDate));
            SqlDataReader rdr = availableStadiums.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }
    }
}