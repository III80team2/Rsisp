using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>表示時間表的物件型別</summary>
public class CSchedule
{
    public int id { set; get; }
    public string user_id { set; get; }
    public string patient_id { set; get; }
    public int assess_id { set; get; }   
    public DateTime deadLine { set; get; }
    public bool isFinished { set; get; }

    public string assess_name { set; get; }
}