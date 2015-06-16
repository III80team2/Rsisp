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

/// <summary>提供一項機制，用來向 CAssessRecord 型別的物件要求資料相關的作業。</summary>
public class CAssessRecordFactory
{
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;

    List<CAssessRecord> assessRecords = new List<CAssessRecord>();

	public CAssessRecordFactory(int assess_id)
	{
        CAssessFactory assessFactory = new CAssessFactory("lite");
        string assessTableName = assessFactory.getById(assess_id).sqlTableName;

        loadAssessRecord(assessTableName);
	}

    private void loadAssessRecord(string assessTableName)
    {
        
    }
}