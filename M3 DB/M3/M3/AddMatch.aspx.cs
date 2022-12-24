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
    public partial class AddMatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SportsAssociationManager"))
            {

                Response.Redirect("Login.aspx");

            }
        }

        protected void addMatch2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String hostname = hostClub.Text;
            String guestname = guestClub.Text;
            DateTime starttime = DateTime.Parse(startTime.Text);
            DateTime endtime = DateTime.Parse(endTime.Text);


            SqlCommand addnewmatchProcedure = new SqlCommand("addNewMatch", conn);
            addnewmatchProcedure.CommandType = CommandType.StoredProcedure;
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@hostclub", hostname));
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@guestclub", guestname));
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@starttime", starttime));
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@endtime", endtime));

            conn.Open();
            addnewmatchProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SportsAssociationManager.aspx");
        }

    }
}