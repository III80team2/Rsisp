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
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Session["loginName"] = loginName.Text;
        //Response.Redirect("patientSelect.aspx");
        Session["loginName"] = Request.Form["qq"].ToString();
        Response.Redirect("patientSelect.aspx");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        //loginName.Text = "";
        //loginPassword.Text = "";
    }
}