using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLoginName.Text = Session["loginName"].ToString();
    }
    protected void iBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        Session["patientName"] = search.Value;
    }
}
