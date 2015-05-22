﻿using System;
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
    string connectionString = @"Data Source=CR4-10\MSSQLSERVER2013;Initial Catalog=Rsisp;Integrated Security=True";

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
}