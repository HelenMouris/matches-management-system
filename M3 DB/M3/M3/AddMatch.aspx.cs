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
        List<int> matches = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SportsAssociationManager"))
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
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available clubs')</script>");
                } 
            }
        }

        protected void addMatch2_Click(object sender, EventArgs e)
        {
            try
            {
                addMatch2Helper(sender,  e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }
        }

        protected void addMatch2Helper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(HostClubList.SelectedValue) || string.IsNullOrWhiteSpace(GuestClubList.SelectedValue)
                || string.IsNullOrWhiteSpace(startTime.Text) || string.IsNullOrWhiteSpace(endTime.Text)
                || HostClubList.SelectedValue.Equals("Select Club") || GuestClubList.SelectedValue.Equals("Select Club"))
                throw new Exception("all fields are required");

            if (DateTime.Parse(startTime.Text) >= DateTime.Parse(endTime.Text))
            {
                throw new Exception("Invalid dates");
            }

            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.isAlreadyPlaying(@host, @guest, @start, @end)", conn);
                cmd.Parameters.AddWithValue("@host", HostClubList.SelectedValue);
                cmd.Parameters.AddWithValue("@guest", GuestClubList.SelectedValue);
                cmd.Parameters.AddWithValue("@start", DateTime.Parse(startTime.Text));
                cmd.Parameters.AddWithValue("@end", DateTime.Parse(endTime.Text));
                SqlDataReader rdr2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr2.Read())
                {
                    matches.Add(rdr2.GetInt32(rdr2.GetOrdinal("ID")));
                }
                conn.Close();

                if (matches.Count > 0)
                    throw new Exception("club aready playing at the same time");

                try
                {

                    String hostname = HostClubList.SelectedValue;
                    String guestname = GuestClubList.SelectedValue;
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

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('added sucessfully');window.location ='SportsAssociationManager.aspx';", true);
                }
                catch (Exception exception)
                {
                    throw new Exception("insertion failed");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("insertion failed, club might be playing at the same time");
            }
        }
    }
}