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
    public partial class AcceptRequests : System.Web.UI.Page
    {
        List<int> matches = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("StadiumManager"))
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
                    while (rdr.Read())
                    {
                        string current = rdr.GetString(rdr.GetOrdinal("Name"));
                        ListItem l = new ListItem(current, current);
                        HostClubList.Items.Add(l);
                        GuestClubList.Items.Add(l);
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available clubs')</script>");
                }
            }
        }

        protected void acceptRequest2_Click(object sender, EventArgs e)
        {
            try
            {
                acceptRequest2Helper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }
        }

        protected void acceptRequest2Helper(object sender, EventArgs e)
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
                SqlCommand cmd = new SqlCommand("select * from dbo.getRequest(@host, @guest, @start)", conn);
                cmd.Parameters.AddWithValue("@host", HostClubList.SelectedValue);
                cmd.Parameters.AddWithValue("@guest", GuestClubList.SelectedValue);
                cmd.Parameters.AddWithValue("@start", DateTime.Parse(startTime.Text));
                SqlDataReader rdr2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr2.Read())
                {
                    matches.Add(rdr2.GetInt32(rdr2.GetOrdinal("ID")));
                }
                conn.Close();

                if (matches.Count == 0)
                    throw new Exception("request not found");
                try
                {
                    String user = Session["username"].ToString();
                    String hostname = HostClubList.SelectedValue;
                    String guestname = GuestClubList.SelectedValue;
                    DateTime starttime = DateTime.Parse(startTime.Text);


                    SqlCommand acceptRequestProcedure = new SqlCommand("acceptRequest", conn);
                    acceptRequestProcedure.CommandType = CommandType.StoredProcedure;
                    acceptRequestProcedure.Parameters.Add(new SqlParameter("@stadiumManagerUserName", user));
                    acceptRequestProcedure.Parameters.Add(new SqlParameter("@hostClubName", hostname));
                    acceptRequestProcedure.Parameters.Add(new SqlParameter("@guestClubName", guestname));
                    acceptRequestProcedure.Parameters.Add(new SqlParameter("@startTime", starttime));

                    conn.Open();
                    acceptRequestProcedure.ExecuteNonQuery();
                    conn.Close();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('accepted successfully');window.location ='StadiumManager.aspx';", true);
                }
                catch (Exception exception)
                {
                    throw new Exception("couldn't accept request");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("request not found or not all fields were filled");
            }
        }
    }
}