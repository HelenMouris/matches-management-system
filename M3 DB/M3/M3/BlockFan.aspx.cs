﻿using System;
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
    public partial class BlockFan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void blockbutton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String nationalid = natID.Text;

            SqlCommand blockProcedure = new SqlCommand("blockFan", conn);
            blockProcedure.CommandType = CommandType.StoredProcedure;
            blockProcedure.Parameters.Add(new SqlParameter("@nationalid", nationalid));



            conn.Open();
            blockProcedure.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SystemAdmin.aspx");
        }
    }
}