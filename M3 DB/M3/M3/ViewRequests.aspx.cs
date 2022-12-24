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
    public partial class ViewRequests : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SELECT cr.Name as ClubRepresentative,c2.Name as HostClub, c.Name as GuestClub, m.StartTime, m.EndTime, hr.status from HostRequest as hr inner join StadiumManager as sm on hr.StadiumManager = sm.ID inner join ClubRepresentative as cr on hr.ClubRepresentative = cr.ID inner join Match as m on hr.Match_ID = m.ID inner join Club as c on m.GuestClub = c.ID INNER JOIN Club as c2 on m.HostClub = c2.ID where sm.username = @stadiumManagerName", conn);
                cmd.Parameters.AddWithValue("@stadiumManagerName", Session["username"]);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                conn.Close();
            }
        }

      
    }
}