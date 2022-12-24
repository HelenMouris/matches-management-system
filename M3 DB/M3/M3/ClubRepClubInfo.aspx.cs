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
    public partial class ClubRepClubInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //we will know the username from session 
            //and we will use it to get club info
            //for now let's assume we have the username

            string username = "ahlyrep";
            string clubName = "";
            string clubLocation;

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
            var sql2 = String.Format("select * from allCLubs where [Name] = '{0}' ", clubName);
            SqlCommand clubs = new SqlCommand(sql2, conn);
            SqlDataReader rdr2 = clubs.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr2.Read())
            {
                clubLocation = rdr2.GetString(rdr2.GetOrdinal("Location"));

                clubInfoName.Text = "Name: " + clubName;
                clubInfoLocation.Text = "Location: " + clubLocation;
            }

            conn.Close();
        }
    }
}