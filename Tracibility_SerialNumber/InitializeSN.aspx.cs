using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http.Results;

namespace TracibilitySN
{
    public partial class InitializeSN : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string strcon = ConfigurationManager.ConnectionStrings["SNcon"].ConnectionString;
        public string KeySN => "GI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Session["ID"] == null) { Response.Redirect("~/UserLogin.aspx"); }
            GetdataDropdown(DropOrder, "[Order]","Order", "AnomCheckOrder");
            Lblinputquant.Visible = false;
            TxtUsID.Text = Session["ID"].ToString();
            TxtUsName.Text = Session["username"].ToString();
            rowupdate.Visible = false;

        }
        private void GetdataDropdown(DropDownList Dropname, string Column,string column1, string tbl)
        {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd = new SqlCommand("select distinct " + Column + " from " + tbl + " order by " + Column + " ASC", con);
                var ds = new DataSet();
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                Dropname.DataSource = ds;
                Dropname.DataTextField = column1;
                Dropname.DataValueField = column1;
                Dropname.DataBind();
                con.Close();
                Dropname.Items.Insert(0, "Select an Option");
        }
        private string GetDataName(int k,string SC, string Column)
        {
            string Temp = "";
            string sql = "";
            SqlConnection con = new SqlConnection(strcon);
            switch(k)
            {
                case 1:
                    sql = "Select distinct " + Column + " From AnomCheckOrder Where [Order] ='" + SC + "'";
                    break;
                case 2:
                    sql = "select Max(Convert(int,SUBSTRING(SerialSN,3,7))) from Initialize_SN";
                    break;
            }    
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Temp = reader[0].ToString();
                    return Temp;
                }
            }
            con.Close();
            return Temp;
        }
        private void InsSN(int F,string SN)
        {
            string query = "";
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            switch(F)
            {
                case 1:
                    query = "insert into Initialize_SN values('" + TxtUsID.Text + "','" + DropOrder.SelectedItem.Text + "','" + SN + "','Active','" + DateTime.Now.ToString() + "','" + DateTime.Now.ToString() + "','','" + TxtUsID.Text + "')";
                    break;
                case 2:
                    query = "Update Initialize_SN Set Status = '" + DropStatus.SelectedValue.ToString() + "',ModifyDate ='" + DateTime.Now.ToString() + "',ModifyUser ='" + TxtUsID.Text + "' Where ID = '" + GridView1.SelectedRow.Cells[1].Text + "'";
                    break;
            }    
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void DropStageCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtOrDate.Text = GetDataName(1,DropOrder.SelectedValue.ToString(), "Date");
            TxtQuantity.Text = GetDataName(1,DropOrder.SelectedValue.ToString(), "[Total order quantity]");
            TxtSchedule.Text = GetDataName(1,DropOrder.SelectedValue.ToString(), "[Scheduled finish]");
            Txtlocation.Text = GetDataName(1, DropOrder.SelectedValue.ToString(), "Stage_Location");
            TxtCost.Text = GetDataName(1, DropOrder.SelectedValue.ToString(), "[Cost Ctr]");
            TxtMaterial.Text = GetDataName(1, DropOrder.SelectedValue.ToString(), "Material");
            TxtMaterialDesc.Text = GetDataName(1, DropOrder.SelectedValue.ToString(), "[Material Description]");
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int x = Convert.ToInt32(TxtinputQuant.Text);
                if (x == 0 || x < 0)
                {
                    Lblinputquant.Visible = true;
                    Lblinputquant.Text = "Values ​​cannot be blank, equal to 0 or less than 0";
                }
                else
                {
                    //if (DropOrder.SelectedValue == "---Select---")
                    if (DropOrder.SelectedIndex < 1)
                    {
                        Lblinputquant.Text = "Please select Order number";
                    }    
                    else
                    {
                        Lblinputquant.Visible = false;
                        int f = 1, h;
                        try
                        {
                            h = Convert.ToInt32(GetDataName(2, "", ""));
                        }
                        catch { h = 0; }
                        for (int i = 1; i <= x; i++)
                        {
                            if ( h > 999999 || h == 0)
                            {
                                InsSN(1,KeySN + string.Format("{0:D6}", i));
                            }
                            else
                            {
                                InsSN(1,KeySN + string.Format("{0:D6}", f + h));
                                f++;
                            }
                        }
                        Response.Write("<script>alert('Done');</script>");
                        GridView1.DataBind();
                        ClearTextbox();
                        DropOrder.SelectedIndex = 0;
                    }    
                }
            }
            catch(Exception ex) { Response.Write("<script>alert('Values ​​cannot be blank');</script>"); }
        }
        private void ClearTextbox()
        {
            TxtCost.Text = "";
            TxtinputQuant.Text = "";
            Txtlocation.Text = "";
            TxtMaterial.Text = "";
            TxtMaterialDesc.Text = "";
            TxtOrDate.Text = "";
            TxtSchedule.Text = "";
            TxtQuantity.Text = "";
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtOrderSN.Text = GridView1.SelectedRow.Cells[3].Text;
            TxtSN.Text = GridView1.SelectedRow.Cells[4].Text;
            TxtMDate.Text = GridView1.SelectedRow.Cells[6].Text;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if(rowupdate.Visible==false)
            {
                rowupdate.Visible = true;
            }   
            else
            {
                if (GridView1.SelectedIndex < 1)
                {
                    Response.Write("<script>alert('* Please select a value below');</script>");
                }
                else
                {
                    InsSN(2, "");
                    Response.Write("<script>alert('Success');</script>");
                    GridView1.DataBind();
                }
            }    
        }
    }
}