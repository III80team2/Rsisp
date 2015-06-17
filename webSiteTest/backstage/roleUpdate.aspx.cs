using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_roleUpdate : System.Web.UI.Page
{
    CRoleFactory roleFactory = new CRoleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
            foreach (CRole role in roleFactory.getAll())
                ddlRoleID.Items.Add(role.id);   
    }

    protected void ddlRoleID_SelectedIndexChanged(object sender, EventArgs e)
    {
        CRole role = roleFactory.getById(ddlRoleID.SelectedItem.Text);
        tbRoleName2.Text = role.name;
    }

    protected void btnUpdateRole_Click(object sender, EventArgs e)
    {
        CRole role = roleFactory.getById(ddlRoleID.SelectedItem.Text);
        role.name = tbRoleName2.Text;

        roleFactory.updateRole(role);
        Response.Redirect("role.aspx");
    }
}