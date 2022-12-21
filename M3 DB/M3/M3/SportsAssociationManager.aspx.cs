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
    public partial class SportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addAssociationManager_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String sname = name1.Text;
            String susername = username2.Text;
            String spassword = password3.Text;
           

            SqlCommand addAssociationManagerProcedure = new SqlCommand(" addAssociationManager ", conn);
            addAssociationManagerProcedure.CommandType = CommandType.StoredProcedure;
            addAssociationManagerProcedure.Parameters.Add(new SqlParameter("@name", sname));
            addAssociationManagerProcedure.Parameters.Add(new SqlParameter("@username", susername));
            addAssociationManagerProcedure.Parameters.Add(new SqlParameter("@password", spassword));




            conn.Open();
            addAssociationManagerProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void Addmatch(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String hostname = HostClubName1.Text;
            String guestname = GuestClubName2.Text;
            DateTime starttime = DateTime.Parse(StartTime3.Text);
            DateTime endtime = DateTime.Parse(EndTime4.Text);


            SqlCommand addnewmatchProcedure = new SqlCommand(" addNewMatch ", conn);
            addnewmatchProcedure.CommandType = CommandType.StoredProcedure;
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@hostclub", hostname));
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@guestclub", guestname));
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@starttime", starttime));
            addnewmatchProcedure.Parameters.Add(new SqlParameter("@endtime", endtime));

            conn.Open();
            addnewmatchProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void Deletematch(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String hostname = HostClubName1.Text;
            String guestname = GuestClubName2.Text;
            DateTime starttime = DateTime.Parse(StartTime3.Text);
            DateTime endtime = DateTime.Parse(EndTime4.Text);


            SqlCommand deletenewmatchProcedure = new SqlCommand(" deleteMatch ", conn);
            deletenewmatchProcedure.CommandType = CommandType.StoredProcedure;
            deletenewmatchProcedure.Parameters.Add(new SqlParameter("@hostclub", hostname));
            deletenewmatchProcedure.Parameters.Add(new SqlParameter("@guestclub", guestname));
            deletenewmatchProcedure.Parameters.Add(new SqlParameter("@starttime", starttime));
            deletenewmatchProcedure.Parameters.Add(new SqlParameter("@endtime", endtime));

            conn.Open();
            deletenewmatchProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void upcomingMatches(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String hostname = HostClubName1.Text;
            String guestname = GuestClubName2.Text;
            DateTime starttime = DateTime.Parse(StartTime3.Text);
            DateTime endtime = DateTime.Parse(EndTime4.Text);


            SqlCommand upcomingmatchfunction= new SqlCommand(" upcomingMatchesOfClub ", conn);
            /*  upcomingmatchfunction.CommandType = CommandType.StoredProcedure;
              upcomingmatchfunction.Parameters.Add(new SqlParameter("@hostclub", hostname));
              upcomingmatchfunction.Parameters.Add(new SqlParameter("@guestclub", guestname));
              upcomingmatchfunction.Parameters.Add(new SqlParameter("@starttime", starttime));
              upcomingmatchfunction.Parameters.Add(new SqlParameter("@endtime", endtime)); */



            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.upcomingMatchesOfClub", conn);
            conn.Open();
            IDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                
            }
            

            conn.Close();
        }
    }
}