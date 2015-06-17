using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_patientDelete : System.Web.UI.Page
{
    CPatientFactory patientFactory = new CPatientFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)       
            foreach (CPatient patient in patientFactory.getAll())        
                ddlPatientName.Items.Add(patient.name);            
    }

    protected void btndeletePatient_Click(object sender, EventArgs e)
    {
        CPatient patient = patientFactory.getByName(ddlPatientName.SelectedItem.Text);

        patientFactory.deletePatient(patient);
        Response.Redirect("patient.aspx");
    }
}