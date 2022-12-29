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
    public partial class RegisterFan : System.Web.UI.Page
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

        protected void addFanClick(object sender, EventArgs e)
        {
            try
            {
                addFanClickHelper(sender, e);
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('" + exception.Message + "')</script>");
            }
        }

        protected void addFanClickHelper(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(name.Text) ||
                string.IsNullOrWhiteSpace(username.Text) ||
                string.IsNullOrWhiteSpace(password.Text) ||
                string.IsNullOrWhiteSpace(nationalId.Text) ||
                string.IsNullOrWhiteSpace(phone.Text) ||
                string.IsNullOrWhiteSpace(birthDate.Text) ||
                string.IsNullOrWhiteSpace(address.Text))
                throw new Exception("all fields are required");

            if (name.Text.Length > 20 || username.Text.Length > 20 || password.Text.Length > 20 || nationalId.Text.Length > 20 || phone.Text.Length > 20 || address.Text.Length > 20)
                throw new Exception("maximum string length is 20");

            if (users.Contains(username.Text))
                throw new Exception("username already exists");
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String fname = name.Text;
                String fusername = username.Text;
                String fpassword = password.Text;
                String fnationalId = nationalId.Text;
                int fphone = Int32.Parse(phone.Text);
                DateTime fbirthDate = DateTime.Parse(birthDate.Text);
                String faddress = address.Text;

                SqlCommand addFanProcedure = new SqlCommand("addFan", conn);
                addFanProcedure.CommandType = CommandType.StoredProcedure;
                addFanProcedure.Parameters.Add(new SqlParameter("@name", fname));
                addFanProcedure.Parameters.Add(new SqlParameter("@username", fusername));
                addFanProcedure.Parameters.Add(new SqlParameter("@password", fpassword));
                addFanProcedure.Parameters.Add(new SqlParameter("@nationalId", fnationalId));
                addFanProcedure.Parameters.Add(new SqlParameter("@phone", fphone));
                addFanProcedure.Parameters.Add(new SqlParameter("@birthDate", fbirthDate));
                addFanProcedure.Parameters.Add(new SqlParameter("@address", faddress));


                conn.Open();
                addFanProcedure.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registered sucessfully');window.location ='Login.aspx';", true);
            }
            catch (FormatException exception)
            {
                throw new Exception("invalid data");
            }
            catch (Exception exception)
            {
                throw new Exception("registration failed");
            }
        }
    }
}