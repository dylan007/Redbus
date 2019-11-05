using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Query : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FindButton_Click(object sender, EventArgs e)
    {
        string redirectUrl = "Result.aspx?source=" + Server.UrlEncode(Source.Text) + "&destination=" + Server.UrlEncode(Destination.Text) + "&date=" + Server.UrlEncode(DOJ.Text);
        Response.Redirect(redirectUrl);
    }
}