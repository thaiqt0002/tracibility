using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Xml.Schema;

namespace TracibilitySN
{
    public partial class AssignBatch : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string strcon = ConfigurationManager.ConnectionStrings["SNcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Session["ID"] == null) { Response.Redirect("~/UserLogin.aspx"); }
            //GetdataListbox(1);
            GetdataDropdown(1,DropSelectOrder, "[Order]", "Order", "AnomCheckOrder");
            //GetdataDropdown(1,DropBatch, "BatchNo", "BatchNo", "BatchOrder");
        }
        private void GetdataListbox(int x)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            switch(x)
            {
                case 1:
                    cmd = new SqlCommand("select distinct SerialSN from Initialize_SN", con);
                    break;
                case 2:
                    cmd = new SqlCommand("select distinct SerialSN from Initialize_SN Where [Order] ='" + DropSelectOrder.SelectedValue.ToString() + "'", con);
                    break;
            }       
            var ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            ListBox1.DataSource = ds;
            ListBox1.DataTextField = "SerialSN";
            ListBox1.DataValueField = "SerialSN";
            ListBox1.DataBind();
            con.Close();
        }
        private void GetdataDropdown(int k,DropDownList Dropname, string Column, string column1, string tbl)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            switch(k)
            {
                case 1:
                    cmd = new SqlCommand("select distinct " + Column + " from " + tbl + " order by " + Column + " ASC", con);
                    break;
                case 2:
                    cmd = new SqlCommand("select distinct " + Column + " from " + tbl + " Where OrderNo = '" + DropSelectOrder.SelectedItem.ToString() + "' order by " + Column + " ASC", con);
                    break;
            }    
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

        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            foreach(ListItem ls in ListBox1.Items)
            {
                if(TxtSearch.Text == ls.Text)
                {
                    ListBox1.Text = ls.Text;
                } 
                    
            }    
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                List<ListItem> items = new List<ListItem>();
                List<ListItem> items1 = new List<ListItem>();
                foreach (ListItem ls in ListBox1.Items)
                {
                    if (ls.Selected)
                    {
                        items.Add(ls);
                        if (ListBox2.Items.Count < 1)
                        {
                            ListBox2.Items.Add(ls);
                            items1.Add(ls);
                        }
                    }
                }
                foreach (ListItem ls1 in items1)
                    ListBox1.Items.Remove(ls1);
                int x = 0;
                foreach (ListItem it in items)
                {
                    foreach (ListItem ls2 in ListBox2.Items)
                    {
                        if (it.Text != ls2.Text) { x++; }
                        else { x = 0; break; }
                    }
                    if (x > 0)
                    {
                        ListBox2.Items.Add(it);
                        ListBox1.Items.Remove(it);
                    }
                }
            }
            catch { }
  
        }

        protected void DropSelectOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropSelectOrder.SelectedIndex == 0)
            {
                //GetdataListbox(1);
                //GetdataDropdown(1, DropBatch, "BatchNo", "BatchNo", "BatchOrder");
            }   
            else
            {
                GetdataListbox(2);
                //GetdataDropdown(2, DropBatch, "BatchNo", "BatchNo", "BatchOrder");
            }    
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                List<ListItem> itemsToRemove = new List<ListItem>();

                foreach (ListItem listItem in ListBox2.Items)
                {
                    if (listItem.Selected)
                        itemsToRemove.Add(listItem);
                }
                foreach (ListItem listItem in itemsToRemove)
                {
                    ListBox2.Items.Remove(listItem);
                    ListBox1.Items.Add(listItem);
                }
            }
            catch { }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            int f=0,x=0;
            if(TxtBatch.Text == "" || ListBox2.Items.Count < 1)
            {
                Label2.Text = "* Please enter Lot number or check Listbox";
            } 
            else
            {
                foreach (ListItem ls in ListBox2.Items)
                {
                    InsSN(1, ls.Text, TxtBatch.Text.Trim(), out f);
                    if (f > 0)
                    { Response.Write("<script>alert('Batch already exists in Serial No " + ls.Text + "');</script>"); x=0; }
                    else { x++; }
                }
                if(x>0) { Response.Write("<script>alert('Success');</script>"); }
                GridView1.DataBind();
                Label2.Text = "";
                TxtBatch.Text = "";
            }    
        }
        private void InsSN(int F, string SN,string txt,out int x)
        {
            string query = "";
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            switch (F)
            {
                case 1:
                    query = "if (select len(BatchNo) from Initialize_SN where SerialSN = '" + SN + "') < 1 begin select 0 Update Initialize_SN Set BatchNo = '" + txt + "',ModifyDate ='" + DateTime.Now.ToString() + "',ModifyUser ='" + Session["ID"].ToString() + "' Where SerialSN ='" + SN + "' end else select 1";
                    break;
                case 2:
                    query = "select 0 Update Initialize_SN Set BatchNo = '',ModifyDate ='" + DateTime.Now.ToString() + "',ModifyUser ='" + Session["ID"].ToString() + "' Where ID ='" + SN + "'";
                    break;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            x = Int32.Parse(cmd.ExecuteScalar().ToString());
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void Btndel_Click(object sender, EventArgs e)
        {
            try
            {
                int x;
                if (GridView1.SelectedIndex < 0)
                {
                    Label2.Text = "* Please select value";
                }
                else
                {
                    InsSN(2, GridView1.SelectedRow.Cells[1].Text, "", out x);
                    GridView1.DataBind();
                }
            }
            catch { }
            
        }
    }
}