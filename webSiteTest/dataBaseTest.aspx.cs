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
        gvUsers.DataSource = userFactory.getAll();
        gvUsers.DataBind();

        gvRoles.DataSource = roleFactory.getAll();
        gvRoles.DataBind();

        gvPatients.DataSource = patientFactory.getAll();
        gvPatients.DataBind();

        if (ddlRole.Items.Count == 0)
        {
            foreach (CRole role in roleFactory.getAll())
            {
                ddlRole.Items.Add(role.name);
            }
        }

        if (ddlUserName.Items.Count == 0)
        {
            foreach (CUser user in userFactory.getAll())
            {
                ddlUserName.Items.Add(user.name);
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
        lblMessage1.Text = userFactory.message;        
    }

    //protected void btndelete1_Click(object sender, EventArgs e)
    //{
    //    CUser user = userFactory.getByName(ddlUserName.SelectedItem.Text);
    //    userFactory.deleteUser(user);
    //}

    protected void btnGetByBirthday_Click(object sender, EventArgs e)
    {        
        CPatient patient = patientFactory.getByBirthday(DateTime.Parse(tbBirthday.Text));
        lblPID.Text = patient.id;
        lblPName.Text = patient.name;
        lblPIDCard.Text = patient.idcard;
        lblPBirthday.Text = patient.birthday.ToShortDateString();
    }
    
}