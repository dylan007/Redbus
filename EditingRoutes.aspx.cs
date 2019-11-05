using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*TODO: 
 * Add Level Check for each user. Redirect if access Level doesn't match
 * Add Delete function to complete crud 
 */
public partial class EditingRoutes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if( Session["Level"] == null || Convert.ToInt32(Session["Level"].ToString())!=1 )
            {
                GridView1.Visible = false;
                HyperLink1.Visible = false;
                Message.Text = "Not Authorized to access this page";
            }
        }
    }

   protected void validate_city(object sender,ServerValidateEventArgs args)
    {
       
        List<string> cities = new List<string>();
        cities.Add("Mumbai");
        cities.Add("Bangalore");
        cities.Add("Chennai");
        cities.Add("Manipal");
        cities.Add("Mangalore");
        cities.Add("Hyderabad");
        cities.Add("Goa");
        for(int i = 0; i < cities.Count; i++)
        {
            if(string.Compare(args.Value.ToString(),cities[i]) == 0)
            {
                args.IsValid = true;
                return;
            }
        }
        args.IsValid = false;
    }
}