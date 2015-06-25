using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_schedule : System.Web.UI.Page
{
    CScheduleFactory scheduleFactory = new CScheduleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvSchedules.DataSource = scheduleFactory.getAll().OrderByDescending(schedule => schedule.id).ToList();

        BoundField id = new BoundField();
        id.DataField = "id";
        id.HeaderText = "事項編號";

        BoundField user_id = new BoundField();
        user_id.DataField = "user_id";
        user_id.HeaderText = "評估人編號";

        BoundField patient_id = new BoundField();
        patient_id.DataField = "patient_id";
        patient_id.HeaderText = "住民編號";

        BoundField assess_name = new BoundField();
        assess_name.DataField = "assess_name";
        assess_name.HeaderText = "評估表名稱";

        BoundField deadLine = new BoundField();
        deadLine.DataField = "deadLine";
        deadLine.HeaderText = "期限";
        deadLine.DataFormatString = "{0:yyyy/MM/dd}";

        CheckBoxField isFinished = new CheckBoxField();
        isFinished.DataField = "isFinished";
        isFinished.HeaderText = "是否完成";

        gvSchedules.Columns.Add(id);
        gvSchedules.Columns.Add(user_id);
        gvSchedules.Columns.Add(patient_id);
        gvSchedules.Columns.Add(assess_name);
        gvSchedules.Columns.Add(deadLine);
        gvSchedules.Columns.Add(isFinished);

        gvSchedules.DataBind();
    }

    protected void gvSchedules_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSchedules.PageIndex = e.NewPageIndex;
        gvSchedules.DataSource = scheduleFactory.getAll().OrderByDescending(schedule => schedule.id).ToList();
        gvSchedules.DataBind();
    }
}