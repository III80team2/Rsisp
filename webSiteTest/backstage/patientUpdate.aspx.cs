using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_patientUpdate : System.Web.UI.Page
{
    CPatientFactory patientFactory = new CPatientFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)        
            foreach (CPatient patient in patientFactory.getAll())
                ddlPatientID.Items.Add(patient.id);
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

        fuPatientPhoto2.SaveAs(this.MapPath("..\\pics\\") + fuPatientPhoto2.FileName);

        patientFactory.updatePatient(patient);
        Response.Redirect("patient.aspx");
    }
}