using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>表示評估表的物件型別</summary>
public class CAssess
{
    public int id { get; set; }
    public string name { get; set; }
    public string sqlTableName { get; set; }
    public List<CItem> items { get; set; }    
}

public class CItem
{
    public int id { get; set; }
    public int assess_id { get; set; }
    public string name { get; set; }
    public string sqlSchemeName { get; set; }
    public List<CContent> contents { get; set; }
    public CGroup group { get; set; }    
}

public class CContent
{
    public int id { get; set; }
    public int item_id { get; set; }
    public int score { get; set; }
    public string content { get; set; }
}

public class CGroup
{
    public int id { get; set; }
    public string name { get; set; }
}