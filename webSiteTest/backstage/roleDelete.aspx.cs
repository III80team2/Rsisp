using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_roleDelete : System.Web.UI.Page
{
    CRoleFactory roleFactory = new CRoleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
            foreach (CRole role in roleFactory.getAll())
                ddlRoleName.Items.Add(role.name);
    }

    protected void btndeleteRole_Click(object sender, EventArgs e)
    {
        CRole role = roleFactory.getByName(ddlRoleName.SelectedItem.Text);

        roleFactory.deleteRole(role);
        Response.Redirect("role.aspx");
    }
}