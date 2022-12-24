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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("Fan"))
            {

                Response.Redirect("Login.aspx");

            }
        }

        protected void purchaseTicket_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String nationalIDNumber = nationalID.Text;
            String hostname = hostClub.Text;
            String guestname = guestClub.Text;
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
    }
}