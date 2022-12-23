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
    public partial class AddStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addStad_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String sName = sname.Text;
            String sLocation = slocation.Text;
            String sCapacity = scapacity.Text;

            SqlCommand addstadiumProcedure = new SqlCommand("addStadium", conn);
            addstadiumProcedure.CommandType = CommandType.StoredProcedure;
            addstadiumProcedure.Parameters.Add(new SqlParameter("@name", sName));
            addstadiumProcedure.Parameters.Add(new SqlParameter("@location", sLocation));
            addstadiumProcedure.Parameters.Add(new SqlParameter("@capacity", sCapacity));


            conn.Open();
            addstadiumProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SystemAdmin.aspx");
        }
    }
}