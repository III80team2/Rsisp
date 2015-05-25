using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>提供一項機制，用來向 CPatient 型別的物件要求資料相關的作業。</summary>
public class CPatientFactory
{
    List<CPatient> patients = new List<CPatient>();
    string connectionString = @"Data Source=CR4-04\MSSQLSERVER2013;Initial Catalog=Rsisp;Integrated Security=True";

    /// <summary>初始化 CUser 型別的物件</summary>
    public CPatientFactory()
	{
        loadData();
	}

    private void loadData()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = connectionString;
        sds.SelectCommand = "dbo.getPatients";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CPatient patient = new CPatient();
                patient.id = dv.Table.Rows[i]["ID_Patient"].ToString();
                patient.name = dv.Table.Rows[i]["PatientName"].ToString();
                patient.idcard = dv.Table.Rows[i]["PatientIDCard"].ToString();
                patient.birthday = DateTime.Parse(dv.Table.Rows[i]["PatientBirthday"].ToString());
                patients.Add(patient);
            }
        }
    }

    /// <summary>傳回 CPatient 型別物件的 List 清單</summary>
    public List<CPatient> getAll()
    {
        return patients;
    }

    /// <summary>傳回 CPatient 型別物件的屬性 id 與參數相同的 CPatient 型別物件</summary>
    public CPatient getById(string id)
    {
        for (int i = 0; i < patients.Count; i++)
        {
            if (patients[i].id == id)
                return patients[i];
        }
        return null;
    }

    /// <summary>傳回 CPatient 型別物件的屬性 name 與參數相同的 CPatient 型別物件</summary>
    public CPatient getByName(string name)
    {
        for (int i = 0; i < patients.Count; i++)
        {
            if (patients[i].name == name)
                return patients[i];
        }
        return null;
    }

    /// <summary>傳回 CPatient 型別物件的屬性 idcard 與參數相同的 CPatient 型別物件</summary>
    public CPatient getByIdCard(string idcard)
    {
        for (int i = 0; i < patients.Count; i++)
        {
            if (patients[i].idcard == idcard)
                return patients[i];
        }
        return null;
    }

    /// <summary>傳回 CPatient 型別物件的屬性 birthday 與參數相同的 CPatient 型別物件</summary>
    public CPatient getByBirthday(DateTime birthday)
    {
        for (int i = 0; i < patients.Count; i++)
        {
            if (patients[i].birthday == birthday) 
                return patients[i];
        }
        return null;
    }
}