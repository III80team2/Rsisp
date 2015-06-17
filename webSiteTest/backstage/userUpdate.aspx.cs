using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_userUpdate : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();
    CRoleFactory roleFactory = new CRoleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            foreach (CUser user in userFactory.getAll())
                ddlUserID.Items.Add(user.id);

            foreach (CRole role in roleFactory.getAll())
                ddlRole2.Items.Add(role.name);
        }    
    }

    protected void ddlUserID_SelectedIndexChanged(object sender, EventArgs e)
    {
        CUser user = userFactory.getById(ddlUserID.SelectedItem.Text);
        tbUserAccount2.Text = user.account;
        tbUserPassword2.Text = user.password;
        tbUserName2.Text = user.name;

        ddlRole2.Text = roleFactory.getById(user.role_id).name;
    }

    protected void btnUpdateUser_Click(object sender, EventArgs e)
    {
        CUser user = userFactory.getById(ddlUserID.SelectedItem.Text);
        user.account = tbUserAccount2.Text;
        user.password = tbUserPassword2.Text;
        user.name = tbUserName2.Text;
        user.role_id = roleFactory.getByName(ddlRole2.SelectedItem.Text).id;

        userFactory.updateUser(user);
        Response.Redirect("user.aspx");
    }
}