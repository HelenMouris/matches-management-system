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
    public partial class ClubRepSendRequest : System.Web.UI.Page
    {
        string clubRepClubName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("ClubRepresentative"))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("select * from dbo.clubNameFromUsername(@clubRepUsername)", conn);
                cmd.Parameters.AddWithValue("@clubRepUsername", Session["username"]);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    clubRepClubName = reader.GetString(reader.GetOrdinal("Name"));
                }
                conn.Close();
                conn.Open();
                var sql = String.Format("select * from dbo.allStadiums");
                SqlCommand allStadiums = new SqlCommand(sql, conn);
                SqlDataReader rdr = allStadiums.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    string current = rdr.GetString(rdr.GetOrdinal("Name"));
                    ListItem l = new ListItem(current, current);
                    StadiumList.Items.Add(l);
                }
                conn.Close();
            }
        }

        protected void sendRequest_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String clubname = clubRepClubName;
            String stadiumname = StadiumList.SelectedValue;
            DateTime starttime = DateTime.Parse(startTime.Text);
            


            SqlCommand addHostRequestProcedure = new SqlCommand("addHostRequest", conn);
            addHostRequestProcedure.CommandType = CommandType.StoredProcedure;
            addHostRequestProcedure.Parameters.Add(new SqlParameter("@clubname", clubname));
            addHostRequestProcedure.Parameters.Add(new SqlParameter("@stadiumname", stadiumname));
            addHostRequestProcedure.Parameters.Add(new SqlParameter("@startingtime", starttime));
            

            conn.Open();
            addHostRequestProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("ClubRepresentative.aspx");
        }
    }
}