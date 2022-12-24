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
    public partial class DeleteClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SystemAdmin"))
            {

                Response.Redirect("Login.aspx");

            }
        }

        protected void deletec_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String cName = cname.Text;


            SqlCommand deleteClubProcedure = new SqlCommand("deleteClub", conn);
            deleteClubProcedure.CommandType = CommandType.StoredProcedure;
            deleteClubProcedure.Parameters.Add(new SqlParameter("@clubname", cName));


            conn.Open();
            deleteClubProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SystemAdmin.aspx");
        }
    }
}