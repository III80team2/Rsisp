using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CScheduleFactory scheduleFactory = new CScheduleFactory();
        List<CSchedule> schedules = new List<CSchedule>();
        foreach (CSchedule schedule in scheduleFactory.getAll())
        {
            //if (schedule.user_id == user.id && schedule.deadLine >= DateTime.Now)
                schedules.Add(schedule);
        }

        string jsonData = JsonConvert.SerializeObject(schedules);

        Response.Clear();
        Response.ContentType = "application/json; charset=utf-8";
        Response.Write(jsonData);
        Response.End();
    }
}