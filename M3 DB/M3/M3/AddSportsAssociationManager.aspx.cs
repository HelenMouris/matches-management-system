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
    public partial class AddSportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addAssociationManager_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String sname = name.Text;
            String susername = username.Text;
            String spassword = password.Text;


            SqlCommand addAssociationManagerProcedure = new SqlCommand("addAssociationManager", conn);
            addAssociationManagerProcedure.CommandType = CommandType.StoredProcedure;
            addAssociationManagerProcedure.Parameters.Add(new SqlParameter("@name", sname));
            addAssociationManagerProcedure.Parameters.Add(new SqlParameter("@username", susername));
            addAssociationManagerProcedure.Parameters.Add(new SqlParameter("@password", spassword));




            conn.Open();
            addAssociationManagerProcedure.ExecuteNonQuery();
            conn.Close();
        }
    }
}