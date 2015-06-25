using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_scheduleUpdate : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();
    CPatientFactory patientFactory = new CPatientFactory();
    CAssessFactory assessFactory = new CAssessFactory();
    CScheduleFactory scheduleFactory = new CScheduleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            foreach (CSchedule schedule in scheduleFactory.getAll())
                if(!schedule.isFinished)
                    ddlScheduleID.Items.Add(schedule.id.ToString());

            foreach (CUser user in userFactory.getAll())
                ddlUserName.Items.Add(user.name);

            foreach (CPatient patient in patientFactory.getAll())
                ddlPatientName.Items.Add(patient.name);

            foreach (CAssess assess in assessFactory.getAll())
                ddlAssessName.Items.Add(assess.name);
        }        
    }

    protected void ddlScheduleID_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlScheduleID.SelectedIndex != 0)
        {
            CSchedule schedule = scheduleFactory.getById(Convert.ToInt32(ddlScheduleID.SelectedItem.Text));
            ddlUserName.Text = userFactory.getById(schedule.user_id).name;
            ddlPatientName.Text = patientFactory.getById(schedule.patient_id).name;
            ddlAssessName.Text = schedule.assess_name;
            tbDeadLine.Text = schedule.deadLine.ToShortDateString();
        }
    }

    protected void btnUpdateSchedule_Click(object sender, EventArgs e)
    {
        if (ddlScheduleID.SelectedIndex != 0 && ddlUserName.SelectedIndex != 0 && ddlPatientName.SelectedIndex != 0 && ddlAssessName.SelectedIndex != 0)
        {
            CSchedule schedule = new CSchedule();
            schedule.id = Convert.ToInt32(ddlScheduleID.SelectedItem.Text);
            schedule.user_id = userFactory.getByName(ddlUserName.SelectedItem.Text).id;
            schedule.patient_id = patientFactory.getByName(ddlPatientName.SelectedItem.Text).id;
            schedule.assess_id = assessFactory.getByName(ddlAssessName.SelectedItem.Text).id;
            schedule.deadLine = Convert.ToDateTime(tbDeadLine.Text);

            scheduleFactory.updateSchedule(schedule);
            Response.Redirect("schedule.aspx");
        }
    }

}