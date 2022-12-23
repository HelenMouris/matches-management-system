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
    public partial class StadiumManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["isLoggedIn"] == null || !(Session["isLoggedIn"].ToString()).Equals("StadiumManager"))
            {
                
                Response.Redirect("Login.aspx");
                
            }
            

        }
        protected void stadiumInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("StadiumInformation.aspx");
        }

        protected void viewRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRequests.aspx");
            
        }

        protected void acceptRequest_Click(object sender, EventArgs e)
        {
             Response.Redirect("AcceptRequests.aspx");
        }

        protected void rejectRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("RejectRequests.aspx");
        }

       
    }
}