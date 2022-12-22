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
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addClub(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String cName = clubName.Text;
            String cLocation = clubLocation.Text;

            SqlCommand addClubProcedure = new SqlCommand("addClub", conn);
            addClubProcedure.CommandType = CommandType.StoredProcedure;
            addClubProcedure.Parameters.Add(new SqlParameter("@name", cName));
            addClubProcedure.Parameters.Add(new SqlParameter("@location", cLocation));

            conn.Open();
            addClubProcedure.ExecuteNonQuery();
            conn.Close();


        }

        protected void Deleteclub(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String cName = clubname2.Text;
            

            SqlCommand deleteClubProcedure = new SqlCommand("deleteClub", conn);
            deleteClubProcedure.CommandType = CommandType.StoredProcedure;
            deleteClubProcedure.Parameters.Add(new SqlParameter("@clubname", cName));
    

            conn.Open();
            deleteClubProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void addStadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String sName = Stadiumname.Text;
            String slocation = Stadiumlocation.Text;
            String scapacity = StadiumCapacity.Text;

            SqlCommand addstadiumProcedure = new SqlCommand("addStadium", conn);
            addstadiumProcedure.CommandType = CommandType.StoredProcedure;
            addstadiumProcedure.Parameters.Add(new SqlParameter("@name", sName));
            addstadiumProcedure.Parameters.Add(new SqlParameter("@location", slocation));
            addstadiumProcedure.Parameters.Add(new SqlParameter("@capacity", scapacity));


            conn.Open();
            addstadiumProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void DeleteStadium(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String sName = Stadiumname2.Text;
           
            SqlCommand deletestadiumProcedure = new SqlCommand(" deleteStadium", conn);
            deletestadiumProcedure.CommandType = CommandType.StoredProcedure;
            deletestadiumProcedure.Parameters.Add(new SqlParameter("@name", sName));
          


            conn.Open();
            deletestadiumProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void block_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String nationalid = nationalid1.Text;

            SqlCommand blockProcedure = new SqlCommand(" blockFan", conn);
            blockProcedure.CommandType = CommandType.StoredProcedure;
            blockProcedure.Parameters.Add(new SqlParameter("@nationalid", nationalid));



            conn.Open();
            blockProcedure.ExecuteNonQuery();
            conn.Close();
        }

        protected void unblock_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String nationalid = nationalid1.Text;

            SqlCommand unblockProcedure = new SqlCommand(" unblockFan", conn);
            unblockProcedure.CommandType = CommandType.StoredProcedure;
            unblockProcedure.Parameters.Add(new SqlParameter("@nationalid", nationalid));



            conn.Open();
           unblockProcedure.ExecuteNonQuery();
            conn.Close();
        }
    }
}