using System;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

/// <summary>提供一項機制，用來向 CAccess 型別的物件要求資料相關的作業。</summary>
public class CAssessFactory
{    
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;

    List<CAssess> assesses = new List<CAssess>();
    List<CItem> items = new List<CItem>();
    List<CContent> contents = new List<CContent>();

    DataView dvAssessStyles, dvAssessItemStyles, dvAssessItemContentStyles, dvAssessItemGroupStyles;

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
            assesses.Clear();
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
            assesses.Clear();
            for (int i = 0; i < dvAssessStyles.Count; i++)
            {
                CAssess assess = new CAssess();
                assess.id = Convert.ToInt32(dvAssessStyles.Table.Rows[i]["ID_Assess"]);
                assess.name = dvAssessStyles.Table.Rows[i]["AssessName"].ToString();
                assess.sqlTableName = dvAssessStyles.Table.Rows[i]["TableName"].ToString();
                assess.items = new List<CItem>();

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
                    CItem item = new CItem();
                    item.id = Convert.ToInt32(dvAssessItemStyles.Table.Rows[i]["ID_Item"]);
                    item.assess_id = Convert.ToInt32(dvAssessItemStyles.Table.Rows[i]["ID_Assess"]);
                    item.name = dvAssessItemStyles.Table.Rows[i]["ItemName"].ToString();
                    item.sqlSchemeName = dvAssessItemStyles.Table.Rows[i]["SchemeName"].ToString();
                    item.contents = new List<CContent>();

                    loadContent(item);

                    if (dvAssessItemStyles.Table.Rows[i]["ID_Group"].ToString() != "")
                    {
                        int id_group = Convert.ToInt32(dvAssessItemStyles.Table.Rows[i]["ID_Group"]);
                        loadGroup(item, id_group);
                    }

                    assess.items.Add(item);
                    items.Add(item);
                }
            }
        }
    }

    private void loadContent(CItem item)
    {
        if (dvAssessItemContentStyles.Count > 0)
        {
            for (int i = 0; i < dvAssessItemContentStyles.Count; i++)
            {
                if (Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["ID_Item"]) == item.id)
                {
                    CContent content = new CContent();
                    content.id = Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["ID_Content"]);
                    content.item_id = Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["ID_Item"]);
                    content.score = Convert.ToInt32(dvAssessItemContentStyles.Table.Rows[i]["Score"]);
                    content.content = dvAssessItemContentStyles.Table.Rows[i]["Content"].ToString();

                    item.contents.Add(content);
                    contents.Add(content);
                }
            }
        }
    }

    private void loadGroup(CItem item, int id_group)
    {
        if (dvAssessItemGroupStyles.Count > 0)
        {
            for (int i = 0; i < dvAssessItemGroupStyles.Count; i++)
            {
                if (Convert.ToInt32(dvAssessItemGroupStyles.Table.Rows[i]["ID_Group"]) == id_group)
                {
                    CGroup group = new CGroup();
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

    public CAssess getByName(string name)
    {
        for (int i = 0; i < assesses.Count; i++)
        {
            if (assesses[i].name == name)
                return assesses[i];
        }
        return null;
    }

    public CAssess getLast()
    {
        return assesses[assesses.Count - 1];
    }

    public CItem getItemById(int id)
    {
        for (int i = 0; i < items.Count; i++)
        {
            if (items[i].id == id)
                return items[i];
        }
        return null;
    }

    public CContent getContentById(int id)
    {
        for (int i = 0; i < contents.Count; i++)
        {
            if (contents[i].id == id)
                return contents[i];
        }
        return null;
    }

    public int getId(string name)
    {
        for (int i = 0; i < assesses.Count; i++)
        {
            if (assesses[i].name == name)
                return assesses[i].id;
        }
        return 0;
    }

    //----------------------------------------新增評估表樣式----------------------------------------//

    public void addAssessStyle(CAssess assess)
    {
        try
        {
            SqlDataSource sds1 = new SqlDataSource();
            sds1.ConnectionString = connectionString;
            sds1.InsertCommand = "dbo.addAssessStyle";
            sds1.InsertCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds1.InsertParameters.Add(new Parameter("AssessName", DbType.String, assess.name));
            sds1.Insert();

            loadAssessLite();

            //addAssessItemGroupStyle
            List<CGroup> groups = new List<CGroup>();
            foreach (CItem item in assess.items)
            {
                if (groups.Count == 0)
                {
                    groups.Add(item.group);
                    addAssessItemGroupStyle(item.group);
                    continue;
                }

                bool notHaveSameGroup = true;
                foreach (CGroup group in groups)
                {
                    if (item.group == group)
                    {
                        notHaveSameGroup = false;
                        break;
                    }
                }
                if (notHaveSameGroup)
                {
                    groups.Add(item.group);
                    addAssessItemGroupStyle(item.group);
                }
            }

            //addAssessItemStyle
            SqlDataSource sds2 = new SqlDataSource();
            sds2.ConnectionString = connectionString;
            sds2.SelectCommand = "dbo.getAssessItemGroupStyles";
            sds2.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
            DataView dvGroups = sds2.Select(DataSourceSelectArguments.Empty) as DataView;

            foreach (CItem item in assess.items)
            {
                if (item.group != null)
                {
                    for (int i = dvGroups.Count - 1; i >= 0; i--)
                    {
                        if (dvGroups.Table.Rows[i]["GroupName"].ToString() == item.group.name)
                        {
                            int group_id = Convert.ToInt32(dvGroups.Table.Rows[i]["ID_Group"]);

                            addAssessItemStyle(item, getLast().id, group_id, item.sqlSchemeName);
                            break;
                        }
                    }
                }
                else
                {
                    addAssessItemStyle(item, getLast().id, 0, item.sqlSchemeName);
                }
            }

            //addAssessItemContentStyle
            SqlDataSource sds3 = new SqlDataSource();
            sds3.ConnectionString = connectionString;
            sds3.SelectCommand = "dbo.getAssessItemStyles";
            sds3.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
            DataView dvItems = sds3.Select(DataSourceSelectArguments.Empty) as DataView;

            foreach (CItem item in assess.items)
            {
                if (item.contents != null)
                {
                    for (int i = dvItems.Count - 1; i >= 0; i--)
                    {
                        if (dvItems.Table.Rows[i]["ItemName"].ToString() == item.name)
                        {
                            int item_id = Convert.ToInt32(dvItems.Table.Rows[i]["ID_Item"]);

                            foreach (CContent content in item.contents)
                            {
                                addAssessItemContentStyle(content, item_id);
                            }
                            break;
                        }
                    }
                }
            }

            //createTable
            loadAssess();
            createAssessTable(getLast());

            message = "add success";
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    private void addAssessItemGroupStyle(CGroup group)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.InsertCommand = "dbo.addAssessItemGroupStyle";
            sds.InsertCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.InsertParameters.Add(new Parameter("GroupName", DbType.String, group.name));
            sds.Insert();
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    private void addAssessItemStyle(CItem item, int ID_Assess, int ID_Group, string SchemeNameType)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.InsertCommand = "dbo.addAssessItemStyle";
            sds.InsertCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.InsertParameters.Add(new Parameter("ID_Assess", DbType.Int32, ID_Assess.ToString()));
            if (ID_Group != 0)
                sds.InsertParameters.Add(new Parameter("ID_Group", DbType.Int32, ID_Group.ToString()));
            else
                sds.InsertParameters.Add(new Parameter("ID_Group", DbType.Int32, null));
            sds.InsertParameters.Add(new Parameter("ItemName", DbType.String, item.name));
            sds.InsertParameters.Add(new Parameter("SchemeNameType", DbType.String, SchemeNameType));
            sds.Insert();
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    private void addAssessItemContentStyle(CContent content, int ID_Item)
    {
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = connectionString;
            sds.InsertCommand = "dbo.addAssessItemContentStyle";
            sds.InsertCommandType = SqlDataSourceCommandType.StoredProcedure;
            sds.InsertParameters.Add(new Parameter("ID_Item", DbType.Int32, ID_Item.ToString()));
            sds.InsertParameters.Add(new Parameter("Score", DbType.Int32, content.score.ToString()));
            sds.InsertParameters.Add(new Parameter("Content", DbType.String, content.content));
            sds.Insert();
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }
    }

    private void createAssessTable(CAssess assess)
    {        
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(String.Format(@"
                create table {0}
                (
                    ID_{0}        int identity(1, 1), 
	                ID_User       nvarchar(20) not null,
	                ID_Patient    nvarchar(20) not null,
                    RecordDate    date not null

                    primary key (ID_{0}),
	                foreign key (ID_User) references Users(ID_User),
	                foreign key (ID_Patient) references Patients(ID_Patient)	
                )
            ", assess.sqlTableName), con);

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }

        addColumns(assess, con);

        con.Close();        
    }

    private void addColumns(CAssess assess, SqlConnection con)
    {
        foreach (CItem item in assess.items)
        {
            SqlCommand cmd;
            if (Regex.IsMatch(item.sqlSchemeName, @"ItemScore\d{2}"))
            {
                cmd = new SqlCommand(String.Format(@"
                    alter table {0} add {1} int
                ", assess.sqlTableName, item.sqlSchemeName), con);
            }
            else
            {
                cmd = new SqlCommand(String.Format(@"
                    alter table {0} add {1} nvarchar(100)
                ", assess.sqlTableName, item.sqlSchemeName), con);
            }

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
        }
    }

    //----------------------------------------新增評估表樣式完成----------------------------------------//

}