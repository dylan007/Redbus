
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
 * Add User Level Checks
 */

public partial class Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if(Session["Level"] == null || Convert.ToInt32(Session["Level"].ToString()) != 1)
            {
                Message.Text = "Not authorized to access this page.";
                Panel1.Visible = false;
            }

        }
    }

    protected void Create_button_Click(object sender, EventArgs e)
    {
        //string busId;
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Insert into buses values (@Source,@Destination,@Company,@DepartureTime,@Duration,@Price,@Seats,@ArrivalTime)", con);

        cmd.Parameters.AddWithValue(@"Source", Source.Text);
        cmd.Parameters.AddWithValue(@"Destination", Destination.Text);
        cmd.Parameters.AddWithValue(@"Company", Company.Text);
        cmd.Parameters.AddWithValue(@"DepartureTime", DepartureTime.Text);
        cmd.Parameters.AddWithValue(@"Duration", Duration.Text);
        cmd.Parameters.AddWithValue(@"Price",Price.Text);
        cmd.Parameters.AddWithValue(@"Seats", Seats.Text);
        cmd.Parameters.AddWithValue("@ArrivalTime",ArrivalTime.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        
        con.Open();
        SqlCommand cmd3 = new SqlCommand("Select * from buses where Source = @Source and Destination = @Destination and Company=@Company and DepartureTime=@DepartureTime and ArrivalTime=@ArrivalTime and Duration = @Duration and Price=@Price and Seats = @Seats", con);
        cmd3.Parameters.AddWithValue(@"Source", Source.Text);
        cmd3.Parameters.AddWithValue(@"Destination", Destination.Text);
        cmd3.Parameters.AddWithValue(@"Company", Company.Text);
        cmd3.Parameters.AddWithValue(@"DepartureTime", DepartureTime.Text);
        cmd3.Parameters.AddWithValue(@"Duration", Duration.Text);
        cmd3.Parameters.AddWithValue(@"Price", Price.Text);
        cmd3.Parameters.AddWithValue(@"Seats", Seats.Text);
        cmd3.Parameters.AddWithValue("@ArrivalTime", ArrivalTime.Text);

        SqlDataReader reader = cmd3.ExecuteReader();
        int busid = 0;
        while (reader.Read())
        {
            busid = Convert.ToInt32(reader["BusID"].ToString());
        }
        con.Close();

        SqlCommand cmd1 = new SqlCommand("Insert into Seats values (@BusID,@Seats,@Jdate)", con);
        cmd1.Parameters.AddWithValue("@BusID", busid);
        cmd1.Parameters.AddWithValue("@Seats", Convert.ToInt32(Seats.Text));
        cmd1.Parameters.AddWithValue("@JDate", "10/30/2019");
        con.Open();
        cmd1.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd2 = new SqlCommand("Insert into Seats values (@BusID,@Seats,@Jdate)", con);
        cmd2.Parameters.AddWithValue("@BusID", busid);
        cmd2.Parameters.AddWithValue("@Seats", Convert.ToInt32(Seats.Text));
        cmd2.Parameters.AddWithValue("@JDate", "10/31/2019");
        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        Response.Redirect("EditingRoutes.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
}