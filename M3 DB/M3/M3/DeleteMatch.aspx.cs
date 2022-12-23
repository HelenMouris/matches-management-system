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
    public partial class DeleteMatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deleteMatch2_Click(object sender, EventArgs e)
        {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String hostname = hostClub.Text;
                String guestname = guestClub.Text;
                DateTime starttime = DateTime.Parse(startTime.Text);
                DateTime endtime = DateTime.Parse(endTime.Text);


                SqlCommand deletenewmatchProcedure = new SqlCommand("deleteMatch", conn);
                deletenewmatchProcedure.CommandType = CommandType.StoredProcedure;
                deletenewmatchProcedure.Parameters.Add(new SqlParameter("@hostclub", hostname));
                deletenewmatchProcedure.Parameters.Add(new SqlParameter("@guestclub", guestname));
                deletenewmatchProcedure.Parameters.Add(new SqlParameter("@starttime", starttime));
                deletenewmatchProcedure.Parameters.Add(new SqlParameter("@endtime", endtime));

                conn.Open();
                deletenewmatchProcedure.ExecuteNonQuery();
                conn.Close();
            
        }
    }
}