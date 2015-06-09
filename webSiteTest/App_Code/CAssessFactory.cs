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
    DataView dvAssessStyles, dvAssessItemStyles, dvAssessItemContentStyles, dvAssessItemGroupStyles;

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
        SqlDataSource sds1 = new SqlDataSource();
        sds1.ConnectionString = connectionString;
        sds1.SelectCommand = "dbo.getAssessStyles";
        sds1.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        dvAssessStyles = sds1.Select(DataSourceSelectArguments.Empty) as DataView;

        SqlDataSource sds2 = new SqlDataSource();
        sds2.ConnectionString = connectionString;
        sds2.SelectCommand = "dbo.getAssessItemStyles";
        sds2.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        dvAssessItemStyles = sds2.Select(DataSourceSelectArguments.Empty) as DataView;

        SqlDataSource sds3 = new SqlDataSource();
        sds3.ConnectionString = connectionString;
        sds3.SelectCommand = "dbo.getAssessItemContentStyles";
        sds3.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        dvAssessItemContentStyles = sds3.Select(DataSourceSelectArguments.Empty) as DataView;

        SqlDataSource sds4 = new SqlDataSource();
        sds4.ConnectionString = connectionString;
        sds4.SelectCommand = "dbo.getAssessItemGroupStyles";
        sds4.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        dvAssessItemGroupStyles = sds4.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dvAssessStyles.Count > 0)
        {
            for (int i = 0; i < dvAssessStyles.Count; i++)
            {
                CAssess assess = new CAssess();
                assess.id = Convert.ToInt32(dvAssessStyles.Table.Rows[i]["ID_Assess"]);
                assess.name = dvAssessStyles.Table.Rows[i]["AssessName"].ToString();
                assess.sqlTableName = dvAssessStyles.Table.Rows[i]["TableName"].ToString();
                assess.items = new List<CAssess.CItem>();

                loadItem(assess);

                assesses.Add(assess);
            }
        }
    }

    private void loadItem(CAssess assess)
    {
        if (dvAssessItemStyles.Count > 0)
        {
            for (int i = 0; i < dvAssessItemStyles.Count; i++)
            {
                if (Convert.ToInt32(dvAssessItemStyles.Table.Rows[i]["ID_Assess"]) == assess.id)
                {
                    CAssess.CItem item = new CAssess.CItem();
                    item.id = Convert.ToInt32(dvAssessItemStyles.Table.Rows[i]["ID_Item"]);
                    item.name = dvAssessItemStyles.Table.Rows[i]["ItemName"].ToString();
                    item.sqlSchemeName = dvAssessItemStyles.Table.Rows[i]["SchemeName"].ToString();
                    item.contents = new List<CAssess.CItem.CContent>();

                    loadContent(item);

                    int id_group = Convert.ToInt32(dvAssessItemStyles.Table.Rows[i]["ID_Group"]);
                    loadGroup(item, id_group);

                    assess.items.Add(item);
                }
            }
        }
    }

    private void loadContent(CAssess.CItem item)
    {
        if (dvAssessItemContentStyles.Count > 0)
        {
            for (int i = 0; i < dvAssessItemContentStyles.Count; i++)
            {
                if (Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["ID_Item"]) == item.id)
                {
                    CAssess.CItem.CContent content = new CAssess.CItem.CContent();
                    content.id = Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["ID_Content"]);
                    content.score = Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["Score"]);
                    content.content = dvAssessItemContentStyles.Table.Rows[i]["Content"].ToString();

                    item.contents.Add(content);
                }
            }
        }
    }

    private void loadGroup(CAssess.CItem item, int id_group)
    {
        if (dvAssessItemGroupStyles.Count > 0)
        {
            for (int i = 0; i < dvAssessItemGroupStyles.Count; i++)
            {
                if (Convert.ToInt32(dvAssessItemGroupStyles.Table.Rows[i]["ID_Group"]) == id_group)
                {
                    CAssess.CItem.CGroup group = new CAssess.CItem.CGroup();
                    group.id = Convert.ToInt32(dvAssessItemGroupStyles.Table.Rows[i]["ID_Group"]);
                    group.name = dvAssessItemGroupStyles.Table.Rows[i]["GroupName"].ToString();

                    item.group = group;
                }
            }
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