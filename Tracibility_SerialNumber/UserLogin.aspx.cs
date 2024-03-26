using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TracibilitySN
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["SNcon"].ConnectionString;
        Password_hash Encrypt_password;
        public string key = "b14ca5898a4e4133bbce2ea2315a1916";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Logout"] = false;
            Session["Signup"] = true;
            TextBox1.Focus();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from User_Register where ID ='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Encrypt_password = new Password_hash();
                        string check = Encrypt_password.Encrypt(key, TextBox2.Text.Trim());
                        if (check == dr["Password"].ToString().Trim())
                        {
                            Response.Write("<script>alert('Login successful');</script>");
                            Session["username"] = dr["FullName"].ToString();
                            Session["ID"] = dr["ID"].ToString();
                            Session["Admin"] = dr["Admin"].ToString();
                            Session["Dept"] = dr["Dept"].ToString();
                            Response.Redirect("InitializeSN.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invaild credentials');</script>");
                            TextBox2.Focus();
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invaild credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}