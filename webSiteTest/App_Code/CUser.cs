using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>表示使用者的物件型別</summary>
public class CUser
{
    /// <summary>取得或設定 CUser 型別物件的屬性 id</summary>
    public string id { set; get; }
    /// <summary>取得或設定 CUser 型別物件的屬性 name</summary>
    public string name { set; get; }
    /// <summary>取得或設定 CUser 型別物件的屬性 role_id</summary>
    public string role_id { set; get; }
    /// <summary>取得或設定 CUser 型別物件的屬性 account</summary>
    public string account { set; get; }
    /// <summary>取得或設定 CUser 型別物件的屬性 password</summary>
    public string password { set; get; }
}

