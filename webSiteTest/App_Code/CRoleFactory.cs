using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>提供一項機制，用來向 CRole 型別的物件要求資料相關的作業。</summary>
public class CRoleFactory
{
    List<CRole> roles = new List<CRole>();
    string connectionString = @"Data Source=NTHIGH\SQLEXPRESS;Initial Catalog=Rsisp;Integrated Security=True";

    /// <summary>初始化 CUser 型別的物件</summary>
	public CRoleFactory()
	{
        loadData();
	}

    private void loadData()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getRoles";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CRole role = new CRole();
                role.id = dv.Table.Rows[i]["ID_Role"].ToString();
                role.name = dv.Table.Rows[i]["RoleName"].ToString();
                roles.Add(role);
            }
        }
    }

    /// <summary>傳回 CRole 型別物件的 List 清單</summary>
    public List<CRole> getAll()
    {
        return roles;
    }

    /// <summary>傳回 CRole 型別物件的屬性 id 與參數相同的 CRole 型別物件</summary>
    public CRole getById(string id)
    {
        for (int i = 0; i < roles.Count; i++)
        {
            if (roles[i].id == id)
                return roles[i];
        }
        return null;
    }

    /// <summary>傳回 CRole 型別物件的屬性 id 與參數相同的 CRole 型別物件</summary>
    public CRole getByName(string name)
    {
        for (int i = 0; i < roles.Count; i++)
        {
            if (roles[i].name == name)
                return roles[i];
        }
        return null;
    }
}