using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GetTypeaheadData : System.Web.UI.Page
{
    public string DB_Link_accDB = WebConfigurationManager.ConnectionStrings["accDB"].ConnectionString;// oracle資料庫連線

    private OleDbConnection DBConn_accDB()
    {
        return new OleDbConnection(this.DB_Link_accDB);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = getData();

        string data = "";
        for (int a = 0; a < dt.Rows.Count; a++)
        {
            data += dt.Rows[a]["item_name"].ToString() + ",";
        }
        data = data.Substring(0, data.Length - 1);

        Response.Write(data);
    }


    protected DataTable getData()
    {
        DataTable dt = new DataTable();
        string SQL = "SELECT item_name FROM ExchangeData";
        OleDbConnection conn = this.DBConn_accDB();
        conn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter(SQL, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dt = ds.Tables[0];
        conn.Close();

        return dt;
    }
}