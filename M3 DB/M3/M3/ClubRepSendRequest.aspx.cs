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
        List<int> matches = new List<int>();
        string clubRepClubName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("ClubRepresentative"))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                try
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
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available stadiums')</script>");
                }

            }
        }

        protected void sendRequest_Click(object sender, EventArgs e)
        {
            try
            {
                sendRequestHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }

        }

        protected void sendRequestHelper(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                if (string.IsNullOrWhiteSpace(StadiumList.SelectedValue) || string.IsNullOrWhiteSpace(startTime.Text) || StadiumList.SelectedValue.Equals("Select Stadium"))
                    throw new Exception("all fields are required");

                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.getMatch2(@host, @start)", conn);
                cmd.Parameters.AddWithValue("@host", clubRepClubName);
                cmd.Parameters.AddWithValue("@start", DateTime.Parse(startTime.Text));
                SqlDataReader rdr2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr2.Read())
                {
                    matches.Add(rdr2.GetInt32(rdr2.GetOrdinal("ID")));
                }
                conn.Close();

                if (matches.Count == 0)
                    throw new Exception("match not found");
                try
                {
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

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('sent successfully');window.location ='ClubRepresentative.aspx';", true);
                }
                catch (Exception exception)
                {
                    throw new Exception("couldn't send request");
                }
            }
            catch (Exception exception)
            {
                throw new Exception("match not found or not all fields are filled");
            }

        }
    }
}