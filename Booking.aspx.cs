using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/*TODO: 
 * Use RangeFieldValidator to validate the number of seats booked.
 */

public partial class Booking : System.Web.UI.Page
{
    public int available = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"];
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("select s.Seats seat,Source,Destination,Jdate,ArrivalTime,DepartureTime,Price from buses b inner join Seats s on s.BusID=b.busID where s.Id=@id", con);
        cmd.Parameters.AddWithValue("@id", id);
        con.Open();
        SqlDataReader reader;
        reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            available = Convert.ToInt32(reader["seat"].ToString());
            Source.Text = reader["Source"].ToString();
            Destination.Text = reader["Destination"].ToString();
            DOJ.Text = reader["Jdate"].ToString();
            ArrivalTime.Text = reader["ArrivalTime"].ToString();
            DepartureTime.Text = reader["DepartureTime"].ToString();
            Price.Text = reader["Price"].ToString();
        }
        else
        {
            con.Close();
            Response.Redirect("Query.aspx");
        }
        if (!this.IsPostBack)
        {
            TotalCost.Text = Price.Text;
        }
        
        con.Close();
    }

    protected void Book_Click(object sender, EventArgs e)
    {
        var id = Request.QueryString["id"];
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
        SqlCommand busQ = new SqlCommand("select s.Seats as Seats from buses b inner join Seats s on s.BusID=b.BusID where s.ID=@id", con);
        busQ.Parameters.AddWithValue("@id", id);
        con.Open();
        SqlDataReader reader;
        reader = busQ.ExecuteReader();
        var seats = "";
        if (reader.Read())
            seats = reader["Seats"].ToString();
        else
            seats = "0";
        reader.Close();
        DateTime date = DateTime.Now;

        SqlCommand insertCommand = new SqlCommand("insert into Bookings values(@TravelId,@UserId,@TimeOfBooking,@Price,@Seats)",con);
        insertCommand.Parameters.AddWithValue("@TravelId", id);
        insertCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
        insertCommand.Parameters.AddWithValue("@TimeOfBooking", date);
        insertCommand.Parameters.AddWithValue("@Price", Price.Text);
        insertCommand.Parameters.AddWithValue("@Seats", Convert.ToInt32(Seats.Text));
        insertCommand.ExecuteNonQuery();
        
        SqlCommand updateCommand = new SqlCommand("update Seats set Seats=@remSeats where Id=@id",con);
        updateCommand.Parameters.AddWithValue("@id",id);
        updateCommand.Parameters.AddWithValue("@remSeats", Convert.ToInt32(seats.ToString()) - Convert.ToInt32(Seats.Text));
        updateCommand.ExecuteNonQuery();
        //available = Convert.ToInt32(seats.ToString()) - Convert.ToInt32(Seats.Text);
        Session["debug"] = Convert.ToInt32(seats.ToString());
        con.Close();
        //store BookingID in session
        con.Open();
        
        SqlCommand bk_id = new SqlCommand("Select * from Bookings where TravelId = @TravelId and UserID=@UserID and TimeOfBooking=@TimeOfBooking and Price=@Price and Seats=@Seats", con);
        bk_id.Parameters.AddWithValue("@TravelId", id);
        bk_id.Parameters.AddWithValue("@UserId", Session["UserId"]);
        bk_id.Parameters.AddWithValue("@TimeOfBooking", date);
        bk_id.Parameters.AddWithValue("@Price", Price.Text);
        bk_id.Parameters.AddWithValue("@Seats", Convert.ToInt32(Seats.Text));
        SqlDataReader read = bk_id.ExecuteReader();
        string bookingID = "";
        while (read.Read())
        {
            bookingID = read["BookingID"].ToString();
        }
        con.Close();
        Response.Redirect("ThankYou.Aspx?bookingID="+Server.UrlEncode(bookingID));
    }

    protected void Seats_TextChanged(object sender, EventArgs e)
    {
        //SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
        //SqlCommand cmd = new SqlCommand("Select * from Seats where BusID=")

        //RangeValidator1.MaximumValue = available.ToString();
        if (Convert.ToInt32(Seats.Text) > available)
        {
            Check.Text = "Not enough seats available!";
           Book.Enabled = false;
            TotalCost.Text = "";
        }
        else {
            Book.Enabled = true;
            Check.Text = "";
            if (Seats.Text == "")
            {
                TotalCost.Text = "0";
            }
            else
            {
                int q = Convert.ToInt32(Seats.Text);
                int cost = q * Convert.ToInt32(Price.Text);
                TotalCost.Text = cost.ToString();
            }
        }
    }
}