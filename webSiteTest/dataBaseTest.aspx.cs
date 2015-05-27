using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dataBaseTest : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();
    CRoleFactory roleFactory = new CRoleFactory();
    CPatientFactory patientFactory = new CPatientFactory();    

    protected void btnRefresh_Click(object sender, EventArgs e)
    {        
        Response.Redirect(Request.Url.ToString());
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["message"] != null)
            lblMessage1.Text = Session["message"].ToString();

        gvUsers.DataSource = userFactory.getAll();
        gvUsers.DataBind();

        gvRoles.DataSource = roleFactory.getAll();
        gvRoles.DataBind();

        gvPatients.DataSource = patientFactory.getAll();
        gvPatients.DataBind();

        if (ddlRole.Items.Count == 0 || ddlRoleNew.Items.Count == 0)
        {
            foreach (CRole role in roleFactory.getAll())
            {
                ddlRole.Items.Add(role.name);
                ddlRoleNew.Items.Add(role.name);
            }
        }

        if (ddlUserName.Items.Count == 0)
        {
            foreach (CUser user in userFactory.getAll())
            {
                ddlUserName.Items.Add(user.name);
            }
        }

        if (ddlUserID.Items.Count == 0)
        {
            foreach (CUser user in userFactory.getAll())
            {
                ddlUserID.Items.Add(user.id);
            }
        }
    }

    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        CUser user = new CUser();
        user.account = tbUserAccount.Text;
        user.password = tbUserPassword.Text;
        user.name = tbUserName.Text;
        user.role_id = roleFactory.getByName(ddlRole.SelectedItem.Text).id;
        
        userFactory.addUser(user);
        Response.Redirect(Request.Url.ToString());
    }

    protected void btndelete1_Click(object sender, EventArgs e)
    {
        CUser user = userFactory.getByName(ddlUserName.SelectedItem.Text);
        userFactory.deleteUser(user);

        Response.Redirect(Request.Url.ToString());
    }

    protected void ddlUserID_SelectedIndexChanged(object sender, EventArgs e)
    {
        CUser user = userFactory.getById(ddlUserID.SelectedItem.Text);
        tbUserAccountNew.Text = user.account;
        tbUserPasswordNew.Text = user.password;
        tbUserNameNew.Text = user.name;

        ddlRoleNew.Text = roleFactory.getById(user.role_id).name;
    }

    protected void btnUpdate1_Click(object sender, EventArgs e)
    {
        CUser user = userFactory.getById(ddlUserID.SelectedItem.Text);        
        user.account = tbUserAccountNew.Text;
        user.password = tbUserPasswordNew.Text;
        user.name = tbUserNameNew.Text;
        user.role_id = roleFactory.getByName(ddlRoleNew.SelectedItem.Text).id;
        userFactory.updateUser(user);

        Session["message"] = userFactory.message;
        Response.Redirect(Request.Url.ToString());
    }

    protected void btnGetByBirthday_Click(object sender, EventArgs e)
    {        
        CPatient patient = patientFactory.getByBirthday(DateTime.Parse(tbBirthday.Text));
        lblPID.Text = patient.id;
        lblPName.Text = patient.name;
        lblPIDCard.Text = patient.idcard;
        lblPBirthday.Text = patient.birthday.ToShortDateString();
    }
}