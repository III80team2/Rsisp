using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class guestPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        div1.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        div1.Visible = true;
        //divNav.Visible = true;
    }
    protected void btnTest_Click(object sender, EventArgs e)
    { 
        //divNav.Visible = true;
    }
}