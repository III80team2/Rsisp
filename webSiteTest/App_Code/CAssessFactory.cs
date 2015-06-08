using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>提供一項機制，用來向 CAccess 型別的物件要求資料相關的作業。</summary>
public class CAssessFactory
{
    List<CAssess> assesses = new List<CAssess>();
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;
    public string message;

    public CAssessFactory()
    {
        loadAssess();
    }

    public CAssessFactory(string lite)
    {
        //輕量版CAssess，無items
        loadAssessLite();
    }

    private void loadAssessLite()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getAssessStyles";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CAssess assess = new CAssess();
                assess.id = Convert.ToInt32(dv.Table.Rows[i]["ID_Assess"]);
                assess.name = dv.Table.Rows[i]["AssessName"].ToString();
                assess.sqlTableName = dv.Table.Rows[i]["TableName"].ToString();   

                assesses.Add(assess);
            }
        }
    }

    private void loadAssess()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getAssessStyles";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CAssess assess = new CAssess();
                assess.id = Convert.ToInt32(dv.Table.Rows[i]["ID_Assess"]);
                assess.name = dv.Table.Rows[i]["AssessName"].ToString();
                assess.sqlTableName = dv.Table.Rows[i]["TableName"].ToString();
                assess.items = new List<CAssess.CItem>();

                loadItem(assess);

                assesses.Add(assess);
            }
        }
    }

    private void loadItem(CAssess assess)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getAssessItemStyle";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        sds.SelectParameters.Add(new Parameter("ID_Assess", DbType.Int32, assess.id.ToString()));
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        
        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CAssess.CItem item = new CAssess.CItem();
                item.id = Convert.ToInt32(dv.Table.Rows[i]["ID_Item"]);
                item.name = dv.Table.Rows[i]["ItemName"].ToString();
                item.sqlSchemeName = dv.Table.Rows[i]["SchemeName"].ToString();
                item.contents = new List<CAssess.CItem.CContent>();
                
                loadContent(item);

                int id_group = Convert.ToInt32(dv.Table.Rows[i]["ID_Group"]);
                loadGroup(item, id_group);

                assess.items.Add(item);
            }
        }
    }

    private void loadContent(CAssess.CItem item)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getAssessItemContentStyle";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        sds.SelectParameters.Add(new Parameter("ID_Item", DbType.Int32, item.id.ToString()));
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CAssess.CItem.CContent content = new CAssess.CItem.CContent();
                content.id = Convert.ToInt32(dv.Table.Rows[i]["ID_Content"]);
                content.score = Convert.ToInt32(dv.Table.Rows[i]["Score"]);
                content.content = dv.Table.Rows[i]["Content"].ToString();

                item.contents.Add(content);
            }
        }
    }

    private void loadGroup(CAssess.CItem item, int id_group)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getAssessItemGroupStyle";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        sds.SelectParameters.Add(new Parameter("ID_Group", DbType.Int32, id_group.ToString()));
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count != 0)
        {
                CAssess.CItem.CGroup group = new CAssess.CItem.CGroup();
                group.id = Convert.ToInt32(dv.Table.Rows[0]["ID_Group"]);
                group.name = dv.Table.Rows[0]["GroupName"].ToString();

                item.group = group;
        }
    }

    public List<CAssess> getAll()
    {
        return assesses;
    }

    public CAssess getById(int id)
    {
        for (int i = 0; i < assesses.Count; i++)
        {
            if (assesses[i].id == id)
                return assesses[i];
        }
        return null;
    }

    public int getId(string name) 
    {
        for (int i = 0; i < assesses.Count; i++ )
        {
            if (assesses[i].name == name)
                return assesses[i].id;
        }
        return 0;
    }
}