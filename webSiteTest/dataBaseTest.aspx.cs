using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dataBaseTest : System.Web.UI.Page
{
    CUserFactory factory = new CUserFactory();

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.ToString());
    }
    protected void Page_Load(object sender, EventArgs e)
    {        
        GridView1.DataSource = factory.getAll();
        GridView1.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        factory.addUser(tbUserName.Text, tbID_Role.Text, tbUserAccount.Text, tbUserPassword.Text);
        lblMessage.Text = factory.message;        
    }

}