using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_patient : System.Web.UI.Page
{
    CPatientFactory patientFactory = new CPatientFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvPatients.DataSource = patientFactory.getAll();
        gvPatients.DataBind();
    }
}