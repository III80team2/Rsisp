using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CAssessRecord
{
    public int id { get; set; }
    public string user_id { get; set; }
    public string patient_id { get; set; }
    public DateTime recordDate { get; set; }
    public List<int> itemScores { get; set; }
    public List<string> itemTexts { get; set; }
}