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
    public partial class SportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addMatch_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMatch.aspx");
        }

        protected void deleteMatch_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteMatch.aspx");
        }

        protected void viewUpcomingMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpcomingMatches.aspx");
        }

        protected void viewAlreadyPlayedMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("AlreadyPlayedMatches.aspx");
        }

        protected void clubsNeverPlayed_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClubsNeverPlayed.aspx");
        }
    } 
}