using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class AddClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddsClub_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String cName = cname.Text;
            String cLocation = clocation.Text;

            SqlCommand addClubProcedure = new SqlCommand("addClub", conn);
            addClubProcedure.CommandType = CommandType.StoredProcedure;
            addClubProcedure.Parameters.Add(new SqlParameter("@name", cName));
            addClubProcedure.Parameters.Add(new SqlParameter("@location", cLocation));

            conn.Open();
            addClubProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SystemAdmin.aspx");
        }
    }
}