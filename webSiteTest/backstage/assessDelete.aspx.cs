using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_assessDelete : System.Web.UI.Page
{
    CAssessFactory assessFactory = new CAssessFactory("lite");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
            foreach (CAssess assess in assessFactory.getAll())
                ddlAssessName.Items.Add(assess.name);       
    }

    protected void btnDeleteAssess_Click(object sender, EventArgs e)
    {
        if (ddlAssessName.SelectedIndex != 0)
        {
            CAssess assess = assessFactory.getByName(ddlAssessName.SelectedItem.Text);

            assessFactory.deleteAssessStyle(assess);
            Response.Redirect("patient.aspx");
        }
    }
}