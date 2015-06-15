using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>提供一項機制，用來向 CSchedule 型別的物件要求資料相關的作業。</summary>
public class CScheduleFactory
{
    CAssessFactory assessFactoryLite = new CAssessFactory("Lite");
    List<CSchedule> schedules = new List<CSchedule>();
    List<CSchedule> userSchedules = new List<CSchedule>();
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;

    public CScheduleFactory()
	{
        loadData();
	}

    private void loadData()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getSchedules";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0) 
        {
            for (int i = 0; i < dv.Count; i++ )
            {
                CSchedule schedule = new CSchedule();
                schedule.id = (int)dv.Table.Rows[i]["ID_Schedule"];
                schedule.user_id = dv.Table.Rows[i]["ID_User"].ToString();
                schedule.patient_id = dv.Table.Rows[i]["ID_Patient"].ToString();
                schedule.assess_id = (int)dv.Table.Rows[i]["ID_Assess"];                
                schedule.deadLine = DateTime.Parse(dv.Table.Rows[i]["deadLine"].ToString());
                schedule.isFinished = (bool)dv.Table.Rows[i]["isFinished"];

                schedule.assess_name = assessFactoryLite.getById(schedule.assess_id).name;
                schedules.Add(schedule);
            }        
        }
    }

    public List<CSchedule> getAll() 
    {
        return schedules;
    }

    public List<CSchedule> getByUserId(string user_id)
    {
        userSchedules.Clear();

        for (int i = 0; i < schedules.Count; i++)
        {
            if (schedules[i].user_id == user_id)
                userSchedules.Add(schedules[i]);
        }
        return userSchedules;
    }

    public List<CSchedule> getByPatientId(string patient_id) 
    {
        userSchedules.Clear();

        for (int i = 0; i < schedules.Count; i++)
        {
            if (schedules[i].patient_id == patient_id)
                userSchedules.Add(schedules[i]);            
        }
        return userSchedules;    
    }
}