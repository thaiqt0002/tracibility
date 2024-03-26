using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TracibilitySN
{
    public partial class AssignOrder1 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string strcon = ConfigurationManager.ConnectionStrings["SNcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            //if (Session["ID"] == null) { Response.Redirect("~/UserLogin.aspx"); }
            GetdataDropdown(1, DropDownList2,"[Order]","Order", "Initialize_SN");
            GetdataDropdown(1, DropDownList1, "BatchNo", "BatchNo", "Initialize_SN");
            GetdataDropdown(1,DropDownList3, "[Order]", "Order", "AnomCheckOrder");
        }
        private void GetdataDropdown(int k, DropDownList Dropname, string Column, string column1, string tbl)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            switch (k)
            {
                case 1:
                    cmd = new SqlCommand("select distinct " + Column + " from " + tbl + " where " + Column + " <> '' order by " + Column + " ASC", con);
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
        private void GetdataListbox(int x,string clm,string clm1,DropDownList Dr)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            switch (x)
            {
                case 1:
                    cmd = new SqlCommand("select distinct SerialSN from Initialize_SN Where " + clm + "='" + Dr.SelectedValue.ToString() + "'", con);
                    break;
            }
            var ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            ListBox1.DataSource = ds;
            ListBox1.DataTextField = clm1;
            ListBox1.DataValueField = clm1;
            ListBox1.DataBind();
            con.Close();
        }
        private string GetDataName(int k, string SC, string Column,string Column1,string tbl)
        {
            string Temp = "";
            string sql = "";
            SqlConnection con = new SqlConnection(strcon);
            switch (k)
            {
                case 1:
                    sql = "Select distinct " + Column + " From " + tbl  + " Where " + Column1  + "='" + SC + "'";
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedIndex > 0)
            {
                GetdataListbox(1, "BatchNo", "SerialSN",DropDownList1);
            }    
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedIndex > 0)
            {
                GetdataListbox(1, "[Order]", "SerialSN",DropDownList2);
                TxtMaterial1.Text = GetDataName(1, DropDownList2.SelectedValue.ToString(), "Material", "[Order]", "AnomCheckOrder");
                TxtDESC1.Text = GetDataName(1, DropDownList2.SelectedValue.ToString(), "[Material Description]", "[Order]", "AnomCheckOrder");
                Txttotal1.Text = GetDataName(1, DropDownList2.SelectedValue.ToString(), "[Total order quantity]", "[Order]", "AnomCheckOrder");
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
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

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
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

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(CheckBox1.Checked)
            {
                foreach (ListItem ls in ListBox1.Items)
                    ls.Selected = true;
            }    
            else
            {
                foreach (ListItem ls in ListBox1.Items)
                    ls.Selected = false;
            }    
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked)
            {
                foreach (ListItem ls in ListBox2.Items)
                    ls.Selected = true;
            }
            else
            {
                foreach (ListItem ls in ListBox2.Items)
                    ls.Selected = false;
            }
        }
    }
}