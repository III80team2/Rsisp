using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    CUserFactory factory = new CUserFactory();
    string loginPassword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["loginName"] = null;
        divLog.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Session["loginName"] = Request.Form["loginName"].ToString();
        loginPassword = Request.Form["Passwd"].ToString();

        if (factory.isCurrentUser((string)Session["loginName"], loginPassword))
        {
            Response.Redirect("index.aspx");
        }
        else {
            return;
        }
        
    }
    protected void iBtnGuest_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("guestPage.aspx");
    }
    protected void iBtnStuff_Click(object sender, ImageClickEventArgs e)
    {
        divLog.Visible = true;
    }
}