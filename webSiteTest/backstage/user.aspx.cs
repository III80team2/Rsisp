using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_user : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvUsers.DataSource = userFactory.getAll();
        gvUsers.DataBind();
    }
}