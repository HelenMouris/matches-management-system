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
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SystemAdmin"))
            {

                Response.Redirect("Login.aspx");

            }
        }

        protected void addStad_Click(object sender, EventArgs e)
        {
            try
            {
                addStadHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }

        }

        protected void addStadHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(sname.Text) || string.IsNullOrWhiteSpace(slocation.Text) || string.IsNullOrWhiteSpace(scapacity.Text))
                throw new Exception("all fields are required");
            if (sname.Text.Length > 20 || slocation.Text.Length > 20)
                throw new Exception("maximum string length is 20");
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String sName = sname.Text;
                String sLocation = slocation.Text;
                int sCapacity = Int16.Parse(scapacity.Text);

                SqlCommand addstadiumProcedure = new SqlCommand("addStadium", conn);
                addstadiumProcedure.CommandType = CommandType.StoredProcedure;
                addstadiumProcedure.Parameters.Add(new SqlParameter("@name", sName));
                addstadiumProcedure.Parameters.Add(new SqlParameter("@location", sLocation));
                addstadiumProcedure.Parameters.Add(new SqlParameter("@capacity", sCapacity));


                conn.Open();
                addstadiumProcedure.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('added sucessfully');window.location ='SystemAdmin.aspx';", true);
            }
            catch (FormatException exception)
            {
                throw new Exception("invalid data");
            }
            catch (Exception exception)
            {
                throw new Exception("insertion failed");
            }
        }
    }
}