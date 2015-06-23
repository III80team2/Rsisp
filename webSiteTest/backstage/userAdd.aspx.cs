using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_userAdd : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();
    CRoleFactory roleFactory = new CRoleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
            foreach (CRole role in roleFactory.getAll())
                ddlRole1.Items.Add(role.name);
    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        if (ddlRole1.SelectedIndex != 0)
        {
            CUser user = new CUser();
            user.account = tbUserAccount.Text;
            user.password = tbUserPassword.Text;
            user.name = tbUserName.Text;
            user.role_id = roleFactory.getByName(ddlRole1.SelectedItem.Text).id;

            userFactory.addUser(user);
            Response.Redirect("user.aspx");
        }
    }
}