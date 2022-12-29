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
        string fanNationalId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("Fan"))
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
        }

        protected void purchaseTicket_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

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

                Response.Redirect("Fan.aspx");
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }

        }
    }
}