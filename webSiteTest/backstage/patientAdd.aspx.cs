using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_patientAdd : System.Web.UI.Page
{
    CPatientFactory patientFactory = new CPatientFactory();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddPatient_Click(object sender, EventArgs e)
    {
        CPatient patient = new CPatient();
        patient.name = tbPatientName.Text;
        patient.idcard = tbPatientIDCard.Text;
        patient.birthday = Convert.ToDateTime(tbPatientBirthday.Text);
        try
        {
            patient.photoPath = "pics/" + fuPatientPhoto.FileName;
            fuPatientPhoto.SaveAs(this.MapPath("..\\pics\\") + fuPatientPhoto.FileName);
        }
        catch
        {
            patient.photoPath = "pics/a.png";
        }
        patientFactory.addPatient(patient);
        Response.Redirect("patient.aspx");
    }
}