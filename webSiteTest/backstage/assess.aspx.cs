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
        if (!IsPostBack)
        {
            gvAssesses.DataSource = assessFactory.getAll().OrderByDescending(assess => assess.id).ToList();

            BoundField id = new BoundField();
            id.DataField = "id";
            id.HeaderText = "評估表編號";

            BoundField name = new BoundField();
            name.DataField = "name";
            name.HeaderText = "評估表名稱";

            gvAssesses.Columns.Add(id);
            gvAssesses.Columns.Add(name);
            gvAssesses.DataBind();
        }
    }

    protected void gvAssesses_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAssesses.PageIndex = e.NewPageIndex;
        gvAssesses.DataSource = assessFactory.getAll().OrderByDescending(assess => assess.id).ToList();
        gvAssesses.DataBind();
    }
}