using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientJson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CScheduleFactory scheduleFactory = new CScheduleFactory();
        List<CSchedule> schedules = new List<CSchedule>();
        foreach (CSchedule schedule in scheduleFactory.getAll())
        {
            schedules.Add(schedule);
        }

        string jsonData = JsonConvert.SerializeObject(schedules);

        Response.Clear();
        Response.ContentType = "application/json; charset=utf-8";
        Response.Write(jsonData);
        Response.End();
    }
}