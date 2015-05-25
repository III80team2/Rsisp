using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>提供一項機制，用來向 CUser 型別的物件要求資料相關的作業。</summary>
public class CUserFactory
{
    List<CUser> users=new List<CUser>();
    string connectionString = @"Data Source=CR4-10\MSSQLSERVER2013;Initial Catalog=Rsisp;Integrated Security=True";
    public string message;

    /// <summary>初始化 CUser 型別的物件</summary>
    public CUserFactory()
    {
        loadData();
    }

    private void loadData()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getUsers";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CUser user = new CUser();
                user.id = dv.Table.Rows[i]["ID_User"].ToString();
                user.name = dv.Table.Rows[i]["UserName"].ToString();
                user.role_id = dv.Table.Rows[i]["ID_Role"].ToString();
                user.account = dv.Table.Rows[i]["UserAccount"].ToString();
                user.password = dv.Table.Rows[i]["UserPassword"].ToString();
                users.Add(user);
            }
        }
    }

    /// <summary>傳回 CUser 型別物件的 List 清單</summary>
    public List<CUser> getAll()
    {
        return users;
    }

    /// <summary>傳回 CUser 型別物件的屬性 id 與參數相同的 CUser 型別物件</summary>
    public CUser getById(string id)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].id == id)            
                return users[i];            
        }
        return null;
    }

    /// <summary>傳回 CUser 型別物件的屬性 name 與參數相同的 CUser 型別物件</summary>
    public CUser getByName(string name)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].name == name)
                return users[i];
        }
        return null;
    }

    /// <summary>傳回 CUser 型別物件的屬性 role_id 與參數相同的 CUser 型別物件</summary>
    public CUser getByRoleId(string role_id)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].role_id == role_id)
                return users[i];
        }
        return null;
    }

    /// <summary>傳回 CUser 型別物件的屬性 account 與參數相同的 CUser 型別物件</summary>
    public CUser getByAccount(string account)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].account == account)
                return users[i];
            
        }
        return null;
    }

    /// <summary>新增使用者到資料庫</summary>
    public void addUser(CUser user)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.InsertCommand = "dbo.addUser";
            sds.InsertCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.InsertParameters.Add(new Parameter("UserName", DbType.String, user.name));
            sds.InsertParameters.Add(new Parameter("ID_Role", DbType.String, user.role_id));
            sds.InsertParameters.Add(new Parameter("UserAccount", DbType.String, user.account));
            sds.InsertParameters.Add(new Parameter("UserPassword", DbType.String, user.password));
            sds.Insert();

            message = "success";
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    /// <summary>帳號與密碼的驗證</summary>
    public bool loginCheck(string account, string password)
    {
        if (this.getByAccount(account) != null)
        {
            if (password.Equals(this.getByAccount(account).password))
                return true;
            return false;
        }
        return false;
    }    
}

