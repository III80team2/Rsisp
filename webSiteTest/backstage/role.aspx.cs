using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_role : System.Web.UI.Page
{
    CRoleFactory roleFactory = new CRoleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvRoles.DataSource = roleFactory.getAll();
        gvRoles.DataBind();
    }
}