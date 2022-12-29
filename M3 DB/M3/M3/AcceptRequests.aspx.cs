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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("StadiumManager"))
            {
                Response.Redirect("Login.aspx");
            }
            else
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
        }

        protected void acceptRequest2_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

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

                Response.Redirect("StadiumManager.aspx");
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }
        }
    }
}