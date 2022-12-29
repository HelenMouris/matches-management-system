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
            else
            {
                try
                {
                    string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    conn.Open();
                    var sql = String.Format("select * from dbo.allStadiums");
                    SqlCommand allStadiums = new SqlCommand(sql, conn);
                    SqlDataReader rdr = allStadiums.ExecuteReader(CommandBehavior.CloseConnection);
                    if (StadiumList.Items.Count <= 1)
                    {
                        while (rdr.Read())
                        {
                            string current = rdr.GetString(rdr.GetOrdinal("Name"));
                            ListItem l = new ListItem(current, current);
                            StadiumList.Items.Add(l);
                        }
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available stadiums')</script>");
                }
            }

        }

        protected void sname_Click(object sender, EventArgs e)
        {
            try
            {
                snameHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }

        }

        protected void snameHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(StadiumList.SelectedValue) || StadiumList.SelectedValue.Equals("Select Stadium"))
                throw new Exception("all fields are required");
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String sName = StadiumList.SelectedValue;

                SqlCommand deletestadiumProcedure = new SqlCommand("deleteStadium", conn);
                deletestadiumProcedure.CommandType = CommandType.StoredProcedure;
                deletestadiumProcedure.Parameters.Add(new SqlParameter("@name", sName));

                conn.Open();
                deletestadiumProcedure.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('deleted sucessfully');window.location ='SystemAdmin.aspx';", true);
            }
            catch (Exception exception)
            {
                throw new Exception("deletion failed");
            }
        }
    }
}