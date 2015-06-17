using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_assess : System.Web.UI.Page
{
    CAssessFactory assessFactory = new CAssessFactory("lite");

    protected void Page_Load(object sender, EventArgs e)
    {
        gvAssesses.DataSource = assessFactory.getAll();
        gvAssesses.DataBind();
    }
}