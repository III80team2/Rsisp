using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// CUndoneFactory 的摘要描述
/// </summary>
public class CUndoneFactory
{
    List<CUndoneTest> undoneList = new List<CUndoneTest>();
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;
    public CUndoneFactory()
	{
        loadData();
	}

    private void loadData()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getundoneList";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0) 
        {
            for (int i = 0; i < dv.Count; i++ )
            {
                CUndoneTest undone = new CUndoneTest();
                undone.aId = (int)dv.Table.Rows[i]["aId"];
                undone.idUser = dv.Table.Rows[i]["ID_User"].ToString();
                undone.idpatient = dv.Table.Rows[i]["ID_Patient"].ToString();
                undone.deadline = dv.Table.Rows[i]["deadline"].ToString();
                undone.assessId = (int)dv.Table.Rows[i]["assessId"];
                undone.assessName = dv.Table.Rows[i]["assessName"].ToString();
                undoneList.Add(undone);
            }
        
        }

    }

    public List<CUndoneTest> getAll() 
    {
        return undoneList;
    }
}