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
    public partial class ClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void addClubRepresentative(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String cname = name.Text;
            String cusername = username.Text;
            String cpassword = password.Text;
            String club = clubname.Text;

            SqlCommand addRepresentativeProcedure = new SqlCommand("addRepresentative", conn);
            addRepresentativeProcedure.CommandType = CommandType.StoredProcedure;
            addRepresentativeProcedure.Parameters.Add(new SqlParameter("@name", cname));
            addRepresentativeProcedure.Parameters.Add(new SqlParameter("@username", cusername));
            addRepresentativeProcedure.Parameters.Add(new SqlParameter("@password", cpassword));
            addRepresentativeProcedure.Parameters.Add(new SqlParameter("@clubname", club));




            conn.Open();
            addRepresentativeProcedure.ExecuteNonQuery();
            conn.Close();
        }
    }
}