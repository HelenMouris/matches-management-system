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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addFanClick(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String fname = name.Text;
            String fusername = username.Text;
            String fpassword = password.Text;
            String fnationalId = nationalId.Text;
            int fphone = Int32.Parse(phone.Text);
            String fbirthDate = birthDate.Text;
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
        }
    }
}