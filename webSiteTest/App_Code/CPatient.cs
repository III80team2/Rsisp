using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>表示病患的物件型別</summary>
public class CPatient
{
    /// <summary>取得或設定 CPatient 型別物件的屬性 id</summary>
    public string id { set; get; }
    /// <summary>取得或設定 CPatient 型別物件的屬性 name</summary>
    public string name { set; get; }
    /// <summary>取得或設定 CPatient 型別物件的屬性 idcard</summary>
    public string idcard { set; get; }
    /// <summary>取得或設定 CPatient 型別物件的屬性 birthday</summary>
    public DateTime birthday { set; get; }
}