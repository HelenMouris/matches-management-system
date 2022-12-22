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
    public partial class AddStadiumManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addManager_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String sname = name.Text;
            String susername = username.Text;
            String spassword = password.Text;
            String stadiumname = stadium.Text;


            SqlCommand addStadiumManagerProcedure = new SqlCommand("addStadiumManager", conn);
            addStadiumManagerProcedure.CommandType = CommandType.StoredProcedure;
            addStadiumManagerProcedure.Parameters.Add(new SqlParameter("@name", sname));
            addStadiumManagerProcedure.Parameters.Add(new SqlParameter("@username", susername));
            addStadiumManagerProcedure.Parameters.Add(new SqlParameter("@password", spassword));
            addStadiumManagerProcedure.Parameters.Add(new SqlParameter("@staduimname", stadiumname));




            conn.Open();
            addStadiumManagerProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("StadiumManager.aspx");
        }
    }
}