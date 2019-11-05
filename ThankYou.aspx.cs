using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class ThankYou : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string bk_ID = Server.UrlDecode(Request.QueryString["bookingID"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from (Bookings inner join Seats on Bookings.TravelID = Seats.Id) inner join buses on Seats.BusID = buses.BusID", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text = "Boarding Point : " + reader["Source"].ToString();
                Label2.Text = "Destination    : " + reader["Destination"].ToString();
                Label3.Text = "Company          : " + reader["Company"].ToString();
                Label4.Text = "Departure Time      : " + reader["DepartureTime"].ToString();
                Label5.Text = "Seats          : " + reader["Seats"].ToString();
                Label6.Text = "Arrival Time       : " + reader["ArrivalTime"].ToString();
                Label7.Text = "Prices          : " + (Convert.ToInt32(reader["Price"]) * Convert.ToInt32(reader["Seats"])).ToString();
            }
            con.Close();
        }
    }

    protected void Book_Click(object sender, EventArgs e)
    {
        Response.Redirect("Query.aspx");
    }
}