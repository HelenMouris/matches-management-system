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
    public partial class FanPurchaseTicket : System.Web.UI.Page
    {
        List<int> matches = new List<int>();
        string fanNationalId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("Fan"))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                try
                {
                    string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    conn.Open();
                    var sql = String.Format("select * from dbo.allCLubs");
                    SqlCommand allClubs = new SqlCommand(sql, conn);
                    SqlDataReader rdr = allClubs.ExecuteReader(CommandBehavior.CloseConnection);
                    if (HostClubList.Items.Count <= 1)
                    {
                        while (rdr.Read())
                        {
                            string current = rdr.GetString(rdr.GetOrdinal("Name"));
                            ListItem l = new ListItem(current, current);
                            HostClubList.Items.Add(l);
                            GuestClubList.Items.Add(l);
                        }
                    }
                    conn.Close();
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("select * from dbo.nationalIdFromUsername(@fanUsername)", conn);
                    cmd.Parameters.AddWithValue("@fanUsername", Session["username"]);
                    SqlDataReader rdr2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (rdr2.Read())
                    {
                        fanNationalId = rdr2.GetString(rdr2.GetOrdinal("NationalID"));
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available matches')</script>");
                }

            }
        }

        protected void purchaseTicket_Click(object sender, EventArgs e)
        {
            try
            {
                purchaseTicketHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }

        }

        protected void purchaseTicketHelper(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                if (string.IsNullOrWhiteSpace(HostClubList.SelectedValue) || string.IsNullOrWhiteSpace(GuestClubList.SelectedValue)
                    || string.IsNullOrWhiteSpace(startTime.Text)
                    || HostClubList.SelectedValue.Equals("Select Club") || GuestClubList.SelectedValue.Equals("Select Club"))
                    throw new Exception("all fields are required");

                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.getMatch2(@host, @start)", conn);
                cmd.Parameters.AddWithValue("@host", HostClubList.SelectedValue);
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

                    String nationalIDNumber = fanNationalId;
                    String hostname = HostClubList.SelectedValue;
                    String guestname = GuestClubList.SelectedValue;
                    DateTime starttime = DateTime.Parse(startTime.Text);

                    SqlCommand purchaseTicketProcedure = new SqlCommand("purchaseTicket", conn);
                    purchaseTicketProcedure.CommandType = CommandType.StoredProcedure;
                    purchaseTicketProcedure.Parameters.Add(new SqlParameter("@nationalId", nationalIDNumber));
                    purchaseTicketProcedure.Parameters.Add(new SqlParameter("@hostClubName", hostname));
                    purchaseTicketProcedure.Parameters.Add(new SqlParameter("@guestClubName", guestname));
                    purchaseTicketProcedure.Parameters.Add(new SqlParameter("@startTime", starttime));


                    conn.Open();
                    purchaseTicketProcedure.ExecuteNonQuery();
                    conn.Close();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('purchased successfully');window.location ='Fan.aspx';", true);
                }
                catch (Exception exception)
                {
                    throw new Exception("purchase failed");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("match not found or not all fields were filled");
            }
        }
    }
}