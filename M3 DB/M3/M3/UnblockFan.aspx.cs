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
    public partial class UnblockFan : System.Web.UI.Page
    {
        List<string> blockedFans = new List<string>();
        List<string> unblockedFans = new List<string>();
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
                    var sql = String.Format("select * from dbo.allFans");
                    SqlCommand allFans = new SqlCommand(sql, conn);
                    SqlDataReader rdr = allFans.ExecuteReader(CommandBehavior.CloseConnection);
                    while (rdr.Read())
                    {
                        if (rdr.GetBoolean(rdr.GetOrdinal("Status")))
                        {
                            unblockedFans.Add(rdr.GetString(rdr.GetOrdinal("NationalID")));
                        }
                        else if (!rdr.GetBoolean(rdr.GetOrdinal("Status")))
                        {
                            blockedFans.Add(rdr.GetString(rdr.GetOrdinal("NationalID")));
                        }
                    }
                    conn.Close();
                } 
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Couldn't get available fans')</script>");
                }
                
            }

        }

        protected void unblockbutton_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String nationalid = natID.Text;
                if (string.IsNullOrWhiteSpace(natID.Text))
                {
                    Response.Write("<script>alert('all fields are required')</script>");
                }
                if (!blockedFans.Contains(nationalid) && !unblockedFans.Contains(nationalid))
                {
                    Response.Write("<script>alert('fan not found')</script>");
                }
                else if (unblockedFans.Contains(nationalid))
                {
                    Response.Write("<script>alert('fan is already unblocked')</script>");
                }
                else
                {
                    SqlCommand unblockProcedure = new SqlCommand("unblockFan", conn);
                    unblockProcedure.CommandType = CommandType.StoredProcedure;
                    unblockProcedure.Parameters.Add(new SqlParameter("@nationalid", nationalid));

                    conn.Open();
                    unblockProcedure.ExecuteNonQuery();
                    conn.Close();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('unblocked sucessfully');window.location ='SystemAdmin.aspx';", true);
                }
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }

        }
    }
}