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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("ClubRepresentative"))
            {

                Response.Redirect("Login.aspx");

            }
        }

        protected void sendRequest_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String clubname = club.Text;
                String stadiumname = stadium.Text;
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
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }

        }
    }
}