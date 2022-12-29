﻿using System;
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
    public partial class Login : System.Web.UI.Page
    {
        List<string> blockedFans = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["isLoggedIn"] = null;
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
                    if (!rdr.GetBoolean(rdr.GetOrdinal("Status")))
                    {
                        blockedFans.Add(rdr.GetString(rdr.GetOrdinal("username")));
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Couldn't get available fans')</script>");
            }
        }

        protected void login(object sender, EventArgs e)
        {
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["m2"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                String user = username.Text;
                String pass = password.Text;


                SqlCommand allAssocManagers = new SqlCommand("Select * from allAssocManagers where username = @username", conn);
                SqlCommand allClubRepresentatives = new SqlCommand("Select * from allClubRepresentatives where username = @username", conn);
                SqlCommand allStadiumManagers = new SqlCommand("Select * from allStadiumManagers where username = @username", conn);
                SqlCommand allFans = new SqlCommand("Select * from allFans where username = @username", conn);

                allAssocManagers.Parameters.AddWithValue("@username", user);
                allClubRepresentatives.Parameters.AddWithValue("@username", user);
                allStadiumManagers.Parameters.AddWithValue("@username", user);
                allFans.Parameters.AddWithValue("@username", user);
                conn.Open();

                var resultAM = allAssocManagers.ExecuteScalar();
                var resultCR = allClubRepresentatives.ExecuteScalar();
                var resultSM = allStadiumManagers.ExecuteScalar();
                var resultF = allFans.ExecuteScalar();

                if (user.Equals("admin") && pass.Equals("admin"))
                {
                    Session["username"] = user;
                    Session["isLoggedIn"] = "SystemAdmin";
                    Response.Redirect("SystemAdmin.aspx");
                }

                if (resultAM != null)
                {
                    Session["username"] = user;
                    Session["isLoggedIn"] = "SportsAssociationManager";
                    Response.Redirect("SportsAssociationManager.aspx");

                }
                else
                    if (resultCR != null)
                {
                    Session["username"] = user;
                    Session["isLoggedIn"] = "ClubRepresentative";
                    Response.Redirect("ClubRepresentative.aspx");
                }
                else
                    if (resultSM != null)
                {
                    Session["username"] = user;
                    Session["isLoggedIn"] = "StadiumManager";
                    Response.Redirect("StadiumManager.aspx");
                }
                else
                    if (resultF != null)
                {
                    if (blockedFans.Contains(user))
                    {
                        Response.Write("<script>alert('fan is blocked')</script>");
                    }
                    else
                    {
                        Session["username"] = user;
                        Session["isLoggedIn"] = "Fan";
                        Response.Redirect("Fan.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Username or password incorrect')</script>");
                }
                conn.Close();
            }
            catch (Exception exception)
            {
                Response.Write("<script>alert('please enter valid data')</script>");
            }

        }
    }
}