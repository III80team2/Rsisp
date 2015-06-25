using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_scheduleDelete : System.Web.UI.Page
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
        }        
    }

    protected void btnDeleteSchedule_Click(object sender, EventArgs e)
    {
        if (ddlScheduleID.SelectedIndex != 0)
        {
            CSchedule schedule = new CSchedule();
            schedule.id = Convert.ToInt32(ddlScheduleID.SelectedItem.Text);

            scheduleFactory.deleteSchedule(schedule);
            Response.Redirect("schedule.aspx");
        }
    }

}