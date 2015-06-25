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

        BoundField id = new BoundField();
        id.DataField = "id";
        id.HeaderText = "身分編號";

        BoundField name = new BoundField();
        name.DataField = "name";
        name.HeaderText = "身分名稱";

        gvRoles.Columns.Add(id);
        gvRoles.Columns.Add(name);
        gvRoles.DataBind();
    }

    protected void gvRoles_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvRoles.PageIndex = e.NewPageIndex;
        gvRoles.DataSource = roleFactory.getAll();
        gvRoles.DataBind();
    }
}