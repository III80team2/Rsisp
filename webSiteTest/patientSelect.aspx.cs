using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientSelect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
    }
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        string patientName = Request.Form["tboxPatient"].ToString();

        Response.Redirect("index.aspx");
    }
}