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
        List<string> users = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
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

                conn.Open();
                var sql2 = String.Format("select * from dbo.SystemUser");
                SqlCommand allUsers = new SqlCommand(sql2, conn);
                SqlDataReader rdr2 = allUsers.ExecuteReader(CommandBehavior.CloseConnection);
                if (users.Count < 1)
                {
                    while (rdr2.Read())
                    {
                        users.Add(rdr2.GetString(rdr2.GetOrdinal("username")));
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Couldn't get available clubs')</script>");
            }

        }


        protected void addClubRepresentative(object sender, EventArgs e)
        {
            try
            {
                addClubRepresentativeHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }

        }

        protected void addClubRepresentativeHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(name.Text) || string.IsNullOrWhiteSpace(username.Text) || string.IsNullOrWhiteSpace(password.Text) || string.IsNullOrWhiteSpace(ClubList.SelectedValue) || ClubList.SelectedValue.Equals("Select Club"))
                throw new Exception("all fields are required");

            if (name.Text.Length > 20 || username.Text.Length > 20 || password.Text.Length > 20)
                throw new Exception("maximum string length is 20");

            if (users.Contains(username.Text))
                throw new Exception("username already exists");

            try
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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registered sucessfully');window.location ='Login.aspx';", true);
            }
            catch (Exception exception)
            {
                throw new Exception("registration failed");
            }
        }
    }
}