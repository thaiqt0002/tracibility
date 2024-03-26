using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tracibility_SerialNumber
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton3.Visible = Convert.ToBoolean(Session["Logout"]);
            LinkButton2.Visible = Convert.ToBoolean(Session["Signup"]);
            if (Session["ID"] == null)
            {
                LinkButton1.ForeColor = System.Drawing.ColorTranslator.FromHtml("Black");
            }
            else
            {
                LinkButton1.Text = Session["username"].ToString();
                LinkButton1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
                LinkButton1.Font.Bold = true;
                LinkButton1.OnClientClick = null;
                LinkButton3.Visible = true;
                LinkButton2.Visible = false;
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.ClearHeaders();
            Response.Redirect("~/Userlogin.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserSignUp.aspx");
        }
    }
}