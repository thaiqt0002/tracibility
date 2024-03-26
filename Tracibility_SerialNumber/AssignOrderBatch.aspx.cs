using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Runtime.Remoting.Lifetime;

namespace TracibilitySN
{
    public partial class AssignOrder : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string strcon = ConfigurationManager.ConnectionStrings["SNcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Session["ID"] == null) { Response.Redirect("~/UserLogin.aspx"); }
            GetdataDropdown(DropOrder, "[Order]", "Order", "AnomCheckOrder");
            TextBox1.Text = DateTime.Now.ToShortDateString();
            GridBatch.DataBind();
        }
        private void GetdataDropdown(DropDownList Dropname, string Column, string column1, string tbl)
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
            Dropname.Items.Insert(0, "---Select---");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int h,i=1,f=1;
            if(DropOrder.SelectedIndex > 0)
            {
                Label1.Visible = false;
                foreach(ListItem ls in ListBox1.Items)
                {
                    InsBatch(ls.ToString(), DropOrder.SelectedItem.ToString(),out h);
                    f = 1;
                    i++;
                    if (h > 0) { f++; i=1; }  
                }
                if (i > 1) { Response.Write("<script>alert(' Done');</script>"); GridBatch.DataBind(); }
                if (f > 1) { Response.Write("<script>alert('Batch already exists in this Order!');</script>"); }
            }   
            else
            {
                Label1.Text = "* You must select Order Number";
                Label1.Visible = true;
            }    
        }
        private void InsBatch(string Batch,String Drop,out int x)
        {
            x = 0;
            try
            {
                string query = "";
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                query = "if not exists (select * from BatchOrder where OrderNo = '" + Drop + "' and BatchNo = '" + Batch + "') begin select 0 insert into BatchOrder values('" + Drop + "','" + Batch + "','" + DateTime.Now.ToString() + "','" + TextBox1.Text + "') end else select 1";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                x = Int32.Parse(cmd.ExecuteScalar().ToString());
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch(Exception ex) { }
        }

        protected void DropOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
        }
        private void Del_Grid(GridView GrV, string tbl, string clm)
        {
            if (GrV.SelectedIndex < 0)
            {
                Label1.Visible = true;
                Label1.Text = "Please select row to delete!";
            }
            else
            {
                String query = "";
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                query = "Delete " + tbl + " Where " + clm + "=" + GrV.SelectedRow.Cells[1].Text;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
                GrV.DataBind();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Del_Grid(GridBatch, "BatchOrder", "Id");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (TxtBatch.Text != "")
            {
                if (ListBox1.Items.Count < 1)
                {
                    ListBox1.Items.Insert(0, TxtBatch.Text);
                    TxtBatch.Text = "";
                }
                else
                {
                    int f = 0;
                    foreach (ListItem listItem in ListBox1.Items)
                    {
                        if (listItem.ToString() == TxtBatch.Text)
                        {
                            Label1.Text = "* The value is duplicated";
                            Label1.Visible = true;
                            f = 0;
                            break;
                        }
                        else
                        {
                            //ListBox1.Items.Insert(0, TxtBatch.Text);
                            //TxtBatch.Text = "";
                            //Label1.Visible = false;
                            f++;
                        }
                    }
                    if (f > 0) { ListBox1.Items.Insert(0, TxtBatch.Text); TxtBatch.Text = ""; Label1.Visible = false; }
                }
            }
            else
            {

                Label1.Text = "* Please enter Lot number";
                Label1.Visible = true;
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                List<ListItem> itemsToRemove = new List<ListItem>();

                foreach (ListItem listItem in ListBox1.Items)
                {
                    if (listItem.Selected)
                        itemsToRemove.Add(listItem);
                }
                foreach (ListItem listItem in itemsToRemove)
                {
                    ListBox1.Items.Remove(listItem);
                }
            }
            catch { }
        }
    }
}