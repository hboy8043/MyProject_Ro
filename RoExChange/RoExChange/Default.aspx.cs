using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Collections;
using System.Data;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    public string DB_Link_accDB = WebConfigurationManager.ConnectionStrings["accDB"].ConnectionString;// oracle資料庫連線
    public string str_json, x_axis, data_test, Main_ChartData;
    ArrayList checkedchangelist = new ArrayList();
    public DataTable dt;
    string user = "";
    ListItemCollection Colors = new ListItemCollection();
    Type ColorCollection = typeof(System.Drawing.KnownColor);
    CheckBox[] checkBoxList;

    private OleDbConnection DBConn_accDB()
    {
        return new OleDbConnection(this.DB_Link_accDB);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (string colorName in Enum.GetNames(ColorCollection))
        {
            Colors.Add(colorName);
        }

        if (!IsPostBack)
        {
            setdl_item_name();
        }

        div_addnewdata.Visible = false;
        if (Request.QueryString["user"] != null)
        {
            user = Request.QueryString["user"].ToString();
            if (user.Equals("administrator"))
            {
                div_addnewdata.Visible = true;
            }
        }

        string ChartData = "";
        string OneData = "";

        DateTime toDay = DateTime.Today;
        DateTime AMonthsAgo = toDay.AddMonths(-1);
        DateTime datecal;
        x_axis = "['";
        for (int a = 1; a <= DateTime.DaysInMonth(AMonthsAgo.Year, AMonthsAgo.Month); a++)
        {
            x_axis += AMonthsAgo.AddDays(a).ToString("yyyy/MM/dd") + "','";
        }
        x_axis = x_axis.Substring(0, x_axis.Length - 3) + "']";

        /* checkBoxList = new CheckBox[]{ cb_1_1_01, cb_1_1_02, cb_1_1_03, cb_1_1_04, cb_1_1_05, cb_1_1_06, cb_1_1_07, cb_1_1_08, cb_1_1_09, cb_1_1_10
                                     ,cb_1_1_11, cb_1_1_12, cb_1_1_13, cb_1_1_14, cb_1_1_15, cb_1_1_16, cb_1_1_17, cb_1_1_18, cb_1_1_19, cb_1_1_20
                                     ,cb_1_1_21, cb_1_1_22, cb_1_1_23, cb_1_1_24, cb_1_1_25, cb_1_1_26, cb_1_1_27, cb_1_1_28, cb_1_1_29, cb_1_1_30
                                     ,cb_1_1_31, cb_1_1_32, cb_1_1_33, cb_1_1_34, cb_1_1_35, cb_1_1_36, cb_1_1_37, cb_1_1_38, cb_1_1_39, cb_1_1_40
                                     ,cb_1_1_41, cb_1_1_42, cb_1_1_43, cb_1_1_44, cb_1_1_45, cb_1_1_46, cb_1_1_47, cb_1_1_48, cb_1_1_49, cb_1_1_50
                                     ,cb_1_1_51, cb_1_1_52, cb_1_1_53, cb_1_1_54, cb_1_1_55, cb_1_1_56, cb_1_1_57, cb_1_1_58, cb_1_1_59, cb_1_1_60
                                     ,cb_1_1_61, cb_1_1_62, cb_1_1_63, cb_1_1_64, cb_1_1_65, cb_1_1_66, cb_1_1_67, cb_1_1_68, cb_1_1_69, cb_1_1_70
                                     ,cb_1_1_70, cb_1_1_71, cb_1_1_72, 聖光精靈卡};
         for (int a = 0; a < checkBoxList.Length; a++)
         {
             int average = 0;
             if (checkBoxList[a].Checked)
             {
                 DataTable dt_oneData = getOneData_test(checkBoxList[a].Text);
                 if (dt_oneData.Rows.Count > 0)
                 {
                     average = getaverage(dt_oneData);

                     int rndnum = new Random().Next(0, Colors.Count);
                     ChartData += "{label: '" + dt_oneData.Rows[0]["item_name"] + "',backgroundColor: '" + Colors[rndnum] + "',borderColor: '" + Colors[rndnum] + "',data:";
                     OneData = "['";
                     int dayofmonth = DateTime.DaysInMonth(AMonthsAgo.Year, AMonthsAgo.Month);
                     for (int b = 0; b < dayofmonth; b++)
                     {
                         datecal = AMonthsAgo;
                         datecal = datecal.AddDays(b);
                         if (dt_oneData.Rows[0][Int32.Parse(datecal.ToString("dd")) % 31 + 4].ToString().Equals(""))
                         {
                             OneData += average + "','";
                         }
                         else
                         {
                             OneData += dt_oneData.Rows[0][Int32.Parse(datecal.ToString("dd")) % 31 + 4] + "','";
                         }
                     }
                     OneData = OneData.Substring(0, OneData.Length - 3) + "']";
                 }
                 ChartData += OneData + ",fill: false},";
             }
         }
         Main_ChartData = ChartData;*/
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

    protected void setdl_item_name()
    {
        string SQL = "SELECT item_name FROM ExchangeData GROUP BY item_name";
        OleDbConnection conn = this.DBConn_accDB();
        conn.Close();
        conn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter(SQL, conn);
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        da.Fill(ds);
        dt = ds.Tables[0];
        for (int a = 0; a < dt.Rows.Count; a++)
        {
            dl_item_name.Items.Add(dt.Rows[a]["item_name"].ToString());
        }
        conn.Close();
    }

    protected void bt_newData_Click(object sender, EventArgs e)
    {
        string item_name = tb_item_name.Text;
        string item_price = tb_item_price.Text;
        /*for (int a = 0; a < checkBoxList.Length; a++)
        {
            if (checkBoxList[a].Checked)
            {
                item_name = checkBoxList[a].Text;
            }
        }*/
        int i = 0;
        if (int.TryParse(item_price, out i))
        {
            string SQL = "UPDATE ExchangeData SET date_" + DateTime.Now.ToString("dd") + " =@item_price WHERE item_name = @item_name";

            OleDbConnection conn = this.DBConn_accDB();
            OleDbCommand oDBcomStr = new OleDbCommand();

            OleDbCommand oleDbCommand = new OleDbCommand(SQL, conn);
            oleDbCommand.Parameters.Add("@item_price", OleDbType.Char);
            oleDbCommand.Parameters["@item_price"].Value = item_price;
            oleDbCommand.Parameters.Add("@item_name", OleDbType.Char);
            oleDbCommand.Parameters["@item_name"].Value = item_name;
            conn.Open();
            oleDbCommand.ExecuteNonQuery();
            conn.Close();
            tb_item_name.Text = "";
            tb_item_price.Text = "";
        }
        else
        {
            Response.Write("<Script language='JavaScript'>alert('請輸入有效價格');</Script>");
        }
    }

    protected DataTable getOneData_test(string checkboxname)
    {
        DataTable dt = new DataTable();
        string SQL = "SELECT * FROM ExchangeData WHERE item_name = '" + checkboxname + "'";
        OleDbConnection conn = this.DBConn_accDB();
        conn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter(SQL, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dt = ds.Tables[0];
        conn.Close();
        return dt;
    }

    protected DataTable getOneData(string checkboxname)
    {
        DataTable dt = new DataTable();
        string SQL = "SELECT * FROM ExchangeData WHERE item_name = '" + checkboxname + "' ORDER BY upd_date";
        OleDbConnection conn = this.DBConn_accDB();
        conn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter(SQL, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dt = ds.Tables[0];
        conn.Close();
        return dt;
    }

    protected DataTable getXaxis()
    {
        DataTable dt = new DataTable();
        string SQL = "SELECT upd_date FROM ExchangeData GROUP BY upd_date ORDER BY upd_date";
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