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
    public partial class RegisterClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            var sql = String.Format("select * from dbo.allCLubs");
            SqlCommand allClubs = new SqlCommand(sql, conn);
            SqlDataReader rdr = allClubs.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string current = rdr.GetString(rdr.GetOrdinal("Name"));
                ListItem l = new ListItem(current, current);
                ClubList.Items.Add(l);
            }
            conn.Close();
        }


        protected void addClubRepresentative(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String cname = name.Text;
            String cusername = username.Text;
            String cpassword = password.Text;
            String club = ClubList.SelectedValue;

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