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
    public partial class UnblockFan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("SystemAdmin"))
            {

                Response.Redirect("Login.aspx");

            }
        
            }

        protected void unblockbutton_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String nationalid = natID.Text;

                SqlCommand unblockProcedure = new SqlCommand("unblockFan", conn);
                unblockProcedure.CommandType = CommandType.StoredProcedure;
                unblockProcedure.Parameters.Add(new SqlParameter("@nationalid", nationalid));



                conn.Open();
                unblockProcedure.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("SystemAdmin.aspx");
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }

        }
    }
}