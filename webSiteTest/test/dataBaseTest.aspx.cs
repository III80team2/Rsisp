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
    CScheduleFactory scheduleFactory = new CScheduleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvUsers.DataSource = userFactory.getAll();
        gvUsers.DataBind();

        gvRoles.DataSource = roleFactory.getAll();
        gvRoles.DataBind();

        gvPatients.DataSource = patientFactory.getAll();
        gvPatients.DataBind();

        if (!this.IsPostBack)
        {
            foreach (CUser user in userFactory.getAll())
            {
                ddlUserName.Items.Add(user.name);
                ddlUserID.Items.Add(user.id);
                ddlUserName2.Items.Add(user.name);
            }

            foreach (CRole role in roleFactory.getAll())
            {
                ddlRole1.Items.Add(role.name);
                ddlRole2.Items.Add(role.name);
                ddlRoleName.Items.Add(role.name);
                ddlRoleID.Items.Add(role.id);
            }

            foreach (CPatient patient in patientFactory.getAll())
            {
                ddlPatientName.Items.Add(patient.name);
                ddlPatientID.Items.Add(patient.id);
            }
        }        
    }

    //使用者資料表相關操作
    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        CUser user = new CUser();
        user.account = tbUserAccount.Text;
        user.password = tbUserPassword.Text;
        user.name = tbUserName.Text;
        user.role_id = roleFactory.getByName(ddlRole1.SelectedItem.Text).id;
        
        userFactory.addUser(user);
        Response.Redirect(Request.Url.ToString());
    }

    protected void btndeleteUser_Click(object sender, EventArgs e)
    {
        CUser user = userFactory.getByName(ddlUserName.SelectedItem.Text);

        userFactory.deleteUser(user);
        Response.Redirect(Request.Url.ToString());
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
        Response.Redirect(Request.Url.ToString());
    }

    protected void ddlUserName2_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSchedule.DataSource = scheduleFactory.getByUserId(userFactory.getByName(ddlUserName2.SelectedItem.Text).id);
        gvSchedule.DataBind();
    }

    //身分角色資料表相關操作
    protected void btnAddRole_Click(object sender, EventArgs e)
    {
        CRole role = new CRole();
        role.id = tbRoleID.Text;
        role.name = tbRoleName.Text;

        roleFactory.addRole(role);
        Response.Redirect(Request.Url.ToString());
    }

    protected void btndeleteRole_Click(object sender, EventArgs e)
    {
        CRole role = roleFactory.getByName(ddlRoleName.SelectedItem.Text);

        roleFactory.deleteRole(role);
        Response.Redirect(Request.Url.ToString());
    }

    protected void btnUpdateRole_Click(object sender, EventArgs e)
    {
        CRole role = roleFactory.getById(ddlRoleID.SelectedItem.Text);
        role.name = tbRoleName2.Text;

        roleFactory.updateRole(role);
        Response.Redirect(Request.Url.ToString());
    }

    //病患資料表相關操作
    protected void btnGetByBirthday_Click(object sender, EventArgs e)
    {        
        CPatient patient = patientFactory.getByBirthday(DateTime.Parse(tbBirthday.Text));
        lblPID.Text = patient.id;
        lblPName.Text = patient.name;
        lblPIDCard.Text = patient.idcard;
        lblPBirthday.Text = patient.birthday.ToShortDateString();
    }

    protected void btnAddPatient_Click(object sender, EventArgs e)
    {
        CPatient patient = new CPatient();
        patient.name = tbPatientName.Text;
        patient.idcard = tbPatientIDCard.Text;
        patient.birthday = calPatientBirthday.SelectedDate.Date;
        patient.photoPath = "pics/" + fuPatientPhoto.FileName;

        fuPatientPhoto.SaveAs(this.MapPath("pics\\") + fuPatientPhoto.FileName);

        patientFactory.addPatient(patient);
        Response.Redirect(Request.Url.ToString());
    }
    protected void btndeletePatient_Click(object sender, EventArgs e)
    {
        CPatient patient = patientFactory.getByName(ddlPatientName.SelectedItem.Text);

        patientFactory.deletePatient(patient);
        Response.Redirect(Request.Url.ToString());
    }
    protected void ddlPatientID_SelectedIndexChanged(object sender, EventArgs e)
    {
        CPatient patient = patientFactory.getById(ddlPatientID.SelectedItem.Text);
        tbPatientName2.Text = patient.name;
        tbPatientIDCard2.Text = patient.idcard;
        calPatientBirthday2.VisibleDate = patient.birthday;
    }
    protected void btnUpdatePatient_Click(object sender, EventArgs e)
    {
        CPatient patient = patientFactory.getById(ddlPatientID.SelectedItem.Text);
        patient.name = tbPatientName2.Text;
        patient.idcard = tbPatientIDCard2.Text;
        patient.birthday = calPatientBirthday2.SelectedDate.Date;
        patient.photoPath = "pics/" + fuPatientPhoto2.FileName;

        fuPatientPhoto2.SaveAs(this.MapPath("pics\\") + fuPatientPhoto2.FileName);

        patientFactory.updatePatient(patient);
        Response.Redirect(Request.Url.ToString());
    }

}