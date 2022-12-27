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
    public partial class DeleteStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SystemAdmin"))
            {

                Response.Redirect("Login.aspx");

            }

        }

        protected void sname_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String sName = stadname.Text;

                SqlCommand deletestadiumProcedure = new SqlCommand("deleteStadium", conn);
                deletestadiumProcedure.CommandType = CommandType.StoredProcedure;
                deletestadiumProcedure.Parameters.Add(new SqlParameter("@name", sName));



                conn.Open();
                deletestadiumProcedure.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("SystemAdmin.aspx");
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }

        }
    }
}