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
    public partial class ClubRepUpcomingMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //we will know the username from session 
            //and we will use it to get club info
            //for now let's assume we have the username

            string username = "ahlyrep";
            string clubName = "";

            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            var sql = String.Format("select * from allClubRepresentatives where [username] = '{0}' ", username);
            SqlCommand clubRepresentatives = new SqlCommand(sql, conn);

            conn.Open();
            SqlDataReader rdr = clubRepresentatives.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                clubName = rdr.GetString(rdr.GetOrdinal("Club"));
            }
            conn.Close();

            conn.Open();
            var sql2 = String.Format("select * from upcomingMatchesOfClub(@clubName)");
            SqlCommand upcomingMatches = new SqlCommand(sql2, conn);
            upcomingMatches.Parameters.Add(new SqlParameter("@clubName", clubName));
            SqlDataReader rdr2 = upcomingMatches.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr2;
            GridView1.DataBind();
            conn.Close();

        }
    }
}