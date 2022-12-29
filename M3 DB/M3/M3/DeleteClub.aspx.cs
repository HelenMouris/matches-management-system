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
            else
            {
                try
                {
                    string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    conn.Open();
                    var sql = String.Format("select * from dbo.allCLubs");
                    SqlCommand allClubs = new SqlCommand(sql, conn);
                    SqlDataReader rdr = allClubs.ExecuteReader(CommandBehavior.CloseConnection);
                    if (ClubList.Items.Count <= 1)
                    {
                        while (rdr.Read())
                        {
                            string current = rdr.GetString(rdr.GetOrdinal("Name"));
                            ListItem l = new ListItem(current, current);
                            ClubList.Items.Add(l);
                        }
                    }
      
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available clubs')</script>");
                }
            }
        }

        protected void deletec_Click(object sender, EventArgs e)
        {
            try
            {
                deletecHelper(sender,  e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }
        }

        protected void deletecHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ClubList.SelectedValue) || ClubList.SelectedValue.Equals("Select Club"))
                throw new Exception("all fields are required");
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String cName = ClubList.SelectedValue;

                SqlCommand deleteClubProcedure = new SqlCommand("deleteClub", conn);
                deleteClubProcedure.CommandType = CommandType.StoredProcedure;
                deleteClubProcedure.Parameters.Add(new SqlParameter("@clubname", cName));


                conn.Open();
                deleteClubProcedure.ExecuteNonQuery();
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