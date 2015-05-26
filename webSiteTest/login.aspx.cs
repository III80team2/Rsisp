using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["loginName"] = null;
        btnSubmit.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Session["loginName"] = loginName.Text;
        //Response.Redirect("patientSelect.aspx");
        Session["loginName"] = Request.Form["qq"].ToString();
        Response.Redirect("index.aspx");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        //loginName.Text = "";
        //loginPassword.Text = "";
    }
    protected void iButtonStuff_Click(object sender, ImageClickEventArgs e)
    {
        btnSubmit.Visible = true;
    }
    protected void iButtonGuset_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("guestPage.aspx");
    }
}