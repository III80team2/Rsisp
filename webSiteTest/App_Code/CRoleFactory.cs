using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>提供一項機制，用來向 CRole 型別的物件要求資料相關的作業。</summary>
public class CRoleFactory
{
    List<CRole> roles = new List<CRole>();
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;
    public string message;

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

    /// <summary>新增角色到資料庫</summary>
    public void addUser(CRole role)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.InsertCommand = "dbo.addRole";
            sds.InsertCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.InsertParameters.Add(new Parameter("ID_Role", DbType.String, role.id));
            sds.InsertParameters.Add(new Parameter("RoleName", DbType.String, role.name));            
            sds.Insert();

            message = "add success";
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    /// <summary>刪除資料庫內的角色身分</summary>
    public void deleteUser(CRole role)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.DeleteCommand = "dbo.deleteRoleByID";
            sds.DeleteCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.DeleteParameters.Add(new Parameter("ID_Role", DbType.String, role.id));
            sds.Delete();

            message = "delete success";
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    /// <summary>更新資料庫內指定ID的角色身分資料</summary>
    public void updateUser(CRole role)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.UpdateCommand = "dbo.updateRoleByID";
            sds.UpdateCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.UpdateParameters.Add(new Parameter("ID_Role", DbType.String, role.id));
            sds.UpdateParameters.Add(new Parameter("RoleName", DbType.String, role.name)); 
            sds.Update();

            message = "update success";
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }
}