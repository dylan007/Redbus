using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var source = Request.QueryString["source"];
        var doj = Request.QueryString["date"];
        var destination = Request.QueryString["destination"];
        ResultsDataSource.SelectParameters[0].DefaultValue = doj;
        ResultsDataSource.SelectParameters[1].DefaultValue = source;
        ResultsDataSource.SelectParameters[2].DefaultValue = destination;
        this.DataBind();
    }

    protected void ResultsGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Book")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = ResultGridView.Rows[index];
            TableCell idCell = selectedRow.Cells[0];
            string redirectUrl = "Booking.aspx?id=" + Server.UrlEncode(idCell.Text);
            Response.Redirect(redirectUrl); 
        }
    }

}