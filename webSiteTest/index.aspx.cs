using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    CScheduleFactory factory = new CScheduleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = "";
            if (Request.QueryString["pid"] != null)
            {
                id = Request.QueryString["pid"].ToString();
            }

            fetchData(id);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        CAssessFactory factory = new CAssessFactory();
        string name = (sender as Button).Text;
        int id = factory.getId(name);
        Response.Redirect("running.aspx");
    }

    private void fetchData(string id)
    {
        GridView1.DataSource = factory.getByPatientId(id);

        BoundField user_id = new BoundField();
        user_id.DataField = "user_id";
        user_id.HeaderText = "醫護人員ID";

        BoundField patient_id = new BoundField();
        patient_id.DataField = "patient_id";
        patient_id.HeaderText = "院民ID";

        BoundField assessName = new BoundField();
        assessName.DataField = "assess_name";
        assessName.HeaderText = "評估表名稱";

        BoundField deadLine = new BoundField();
        deadLine.DataField = "deadLine";
        deadLine.HeaderText = "期限";

        CheckBoxField isFinished = new CheckBoxField();
        isFinished.DataField = "isFinished";
        isFinished.HeaderText = "是否完成";

        ButtonField editAssess = new ButtonField();
        editAssess.ButtonType = ButtonType.Image;
        editAssess.ImageUrl = "~/pics/edit.png";
        editAssess.HeaderText = "填寫";
        editAssess.CommandName = "edit";

        BoundField schedule_id = new BoundField();
        schedule_id.DataField = "id";

        GridView1.Columns.Add(user_id);
        GridView1.Columns.Add(patient_id);
        GridView1.Columns.Add(assessName);
        GridView1.Columns.Add(deadLine);
        GridView1.Columns.Add(isFinished);
        GridView1.Columns.Add(editAssess);
        GridView1.Columns.Add(schedule_id);
        GridView1.DataBind();
        GridView1.Columns[6].Visible = false;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            CAssessFactory assessFactory = new CAssessFactory();
            CPatientFactory patientFactory = new CPatientFactory();
            int index = Convert.ToInt32(e.CommandArgument);
            GridView GridViewTest = (GridView)e.CommandSource;

            GridViewRow row = GridViewTest.Rows[index];
            string name = row.Cells[2].Text;
            int assess_id = assessFactory.getId(name);
            string patient_id = patientFactory.getById(row.Cells[1].Text).id;
            int schedule_id = Convert.ToInt32(row.Cells[6].Text);
            //Label2.Text = name;
            Response.Redirect("assess.aspx?pid=" + patient_id + "&aid=" + assess_id + "&sid=" + schedule_id);
        }
    }
}