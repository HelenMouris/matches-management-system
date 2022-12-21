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

        protected void addclub(object sender, EventArgs e)
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

        protected void AddStadium(object sender, EventArgs e)
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
    }
}