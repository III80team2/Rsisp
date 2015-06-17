using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_userDelete : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
         if (!this.IsPostBack)
            foreach (CUser user in userFactory.getAll())
                ddlUserName.Items.Add(user.name);
    }

    protected void btndeleteUser_Click(object sender, EventArgs e)
    {
        CUser user = userFactory.getByName(ddlUserName.SelectedItem.Text);

        userFactory.deleteUser(user);
        Response.Redirect("user.aspx");
    }
}