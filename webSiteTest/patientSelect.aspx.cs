using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientSelect : System.Web.UI.Page
{
    CPatientFactory patientFactory = new CPatientFactory();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
            Response.Redirect("login.aspx");
    }
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        string patientName = Request.Form["tboxPatient"].ToString();
        CPatient patient = patientFactory.getByName(patientName);
        string pid = patient.id;
        Response.Redirect("index.aspx?pid="+pid);
    }
}