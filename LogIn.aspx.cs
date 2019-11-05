using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

/*TODO: 
 * Integrate Cookies to implement Remember Me function
 */

public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["Users"];
            if(cookie != null)
            {
                UserName.Text = cookie["UserName"];
                Password.Attributes["Value"] = cookie["Password"];
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(RememberMe.Checked == true)
        {
            HttpCookie cookie = new HttpCookie("Users");
            cookie["UserName"] = UserName.Text;
            cookie["Password"] = Password.Text;
            cookie.Expires = DateTime.Now.AddMonths(1);
            Response.Cookies.Add(cookie);
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLlocalDB;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Select * from Users where UserName=@UserName", con);
        cmd.Parameters.AddWithValue("@UserName", UserName.Text);
        SqlDataReader reader;
        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.Read())
        {
          
            if (string.Compare(Password.Text, reader["Password"].ToString()) == 0)
            {
                Session["Level"] = reader["Level"];
                Session["UserId"] = reader["UserId"];
                Session["Name"] = reader["Name"];
                Session["Email"] = reader["Email"];
                con.Close();
                if(Convert.ToInt32(Session["Level"].ToString()) == 1)
                {
                    //Close connection and redirect to edit routes page.
                    con.Close();
                    Response.Redirect("EditingRoutes.aspx");
                }
                else
                {
                    //Redirect to user page
                    con.Close();
                    Response.Redirect("Query.aspx");
                }
                Label3.Text = "Success";
            }
            else
            {
                Label3.Text = "Wrong Password";
            }
            
        }
        else
        {
            Label3.Text = "No such user";
        }
        con.Close();
    }
}