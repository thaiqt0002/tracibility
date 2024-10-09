using System;
using System.Web.UI;

namespace Tracibility.Controls
{
    public partial class Header : UserControl
    {
        private void Page_Load(object sender, EventArgs e)
        {
            LogOut.Visible = Convert.ToBoolean(Session["Logout"]);
            SignUp.Visible = Convert.ToBoolean(Session["Signup"]);
            if (Session["ID"] != null)
            {
                LogIn.InnerText = Session["username"].ToString();
                LogIn.Attributes["class"] = "h-full flex flex-col items-center justify-between group cursor-pointer text-sm text-blue-900";
                LogIn.Attributes.Remove("onclick");
                LogOut.Visible = true;
                SignUp.Visible = false;
            }
        }

        protected void SignUpEvent(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.ClearHeaders();
            Response.Redirect("~/UserSignUp.aspx");
        } 
        protected void LogInEvent(object sender, EventArgs e)
        {
            Response.Redirect("~/UserLogin.aspx");
        } 

        protected void LogOutEvent(object sender, EventArgs e)
        {
            Response.Redirect("~/UserSignUp.aspx");
        }
    }
        
}