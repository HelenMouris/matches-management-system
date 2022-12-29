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
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SystemAdmin"))
            {

                Response.Redirect("Login.aspx");

            }
        }

        protected void AddsClub_Click(object sender, EventArgs e)
        {
            try
            {
                AddsClubHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }
        }

        protected void AddsClubHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(cname.Text) || string.IsNullOrWhiteSpace(clocation.Text))
                throw new Exception("all fields are required");
            if (cname.Text.Length > 20 || clocation.Text.Length > 20)
                throw new Exception("maximum string length is 20");
            try
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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('added sucessfully');window.location ='SystemAdmin.aspx';", true);
            }
            catch (Exception exception)
            {
                throw new Exception("insertion failed");
            }
        }
    }
}