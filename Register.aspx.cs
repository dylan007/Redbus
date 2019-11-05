using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Insert into Users values (@Level,@UserName,@Password,@Email,@Name)", con);
        cmd.Parameters.AddWithValue(@"Level",0);
        cmd.Parameters.AddWithValue(@"UserName", UserName.Text);
        cmd.Parameters.AddWithValue(@"Password", Password.Text);
        cmd.Parameters.AddWithValue(@"Email", Email.Text);
        cmd.Parameters.AddWithValue(@"Name", Name.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("LogIn.aspx");
    }
}