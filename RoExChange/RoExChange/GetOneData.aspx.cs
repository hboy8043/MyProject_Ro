using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class GetOneData : System.Web.UI.Page
{
    public string DB_Link_accDB = WebConfigurationManager.ConnectionStrings["accDB"].ConnectionString;// oracle資料庫連線

    private OleDbConnection DBConn_accDB()
    {
        return new OleDbConnection(this.DB_Link_accDB);
    }

    string id = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.Form["id"];

        DataTable dt = getOneData();
        string label = dt.Rows[0]["item_name"].ToString();
        string data = getData(dt);

        Response.Write("[{\"label\":\"" + label + "\",\"data\":\"" + data + "\"}]");
    }


    protected DataTable getOneData()
    {
        DataTable dt = new DataTable();
        string SQL = "SELECT * FROM ExchangeData WHERE item_name = @id";
        OleDbConnection conn = this.DBConn_accDB();
        OleDbCommand oleDbCommand = new OleDbCommand(SQL,conn);
        oleDbCommand.Parameters.Add("@id",OleDbType.Char);
        oleDbCommand.Parameters["@id"].Value = id;
        OleDbDataAdapter da = new OleDbDataAdapter(oleDbCommand);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dt = ds.Tables[0];

        return dt;
    }

    protected string getData(DataTable dt)
    {
        string data = "";
        DateTime toDay = DateTime.Today;
        DateTime AMonthsAgo = toDay.AddMonths(-1);
        int average = getaverage(dt);

        data = "";
        for (int a = 1; a <= DateTime.DaysInMonth(AMonthsAgo.Year, AMonthsAgo.Month); a++)
        {
            if (dt.Rows[0]["date_" + AMonthsAgo.AddDays(a).ToString("dd")].ToString().Equals(""))
            {
                data += average + ",";
            }
            else
            {
                data += dt.Rows[0]["date_" + AMonthsAgo.AddDays(a).ToString("dd")] + ",";
            }
        }
        data = data.Substring(0, data.Length - 1);

        return data;
    }

    protected int getaverage(DataTable dt)
    {
        int average = 0, average_num = 0;
        for (int a = 0; a < 31; a++)
        {
            if (!dt.Rows[0][a + 4].ToString().Equals(""))
            {
                average_num++;
                average = average + Int32.Parse(dt.Rows[0][a + 4].ToString());
            }
        }
        if (average_num > 0)
        {
            average = average / average_num;
        }
        return average;
    }
}