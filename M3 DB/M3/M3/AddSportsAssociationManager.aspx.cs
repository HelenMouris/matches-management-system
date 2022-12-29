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
        List<string> users = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                conn.Open();
                var sql = String.Format("select * from dbo.SystemUser");
                SqlCommand allUsers = new SqlCommand(sql, conn);
                SqlDataReader rdr = allUsers.ExecuteReader(CommandBehavior.CloseConnection);
                if (users.Count < 1)
                {
                    while (rdr.Read())
                    {
                        users.Add(rdr.GetString(rdr.GetOrdinal("username")));
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Couldn't get available stadiums')</script>");
            }

        }

        protected void addAssociationManager_Click(object sender, EventArgs e)
        {
            try
            {
                addAssociationManagerHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }
        }

        protected void addAssociationManagerHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(name.Text) || string.IsNullOrWhiteSpace(username.Text) || string.IsNullOrWhiteSpace(password.Text))
                throw new Exception("all fields are required");

            if (name.Text.Length > 20 || username.Text.Length > 20 || password.Text.Length >20)
                throw new Exception("maximum string length is 20");
            if (users.Contains(username.Text))
                throw new Exception("username already exists");
            try
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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registered sucessfully');window.location ='Login.aspx';", true);
            } catch (Exception exception)
            {
                throw new Exception("registration failed");
            }

        }
    }
}