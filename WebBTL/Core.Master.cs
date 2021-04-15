using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBTL;

namespace WebBTL
{
    public partial class Core : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                username = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(username.ToLower());
                LbUserName.Text = "Hello, " + username;
                LabelLogin.Visible = false;
                LabelRegister.Visible = false;
                PanelUser.Visible = true;
            }
            else
            {
                PanelUser.Visible = false;
                LabelLogin.Visible = true;
                LabelRegister.Visible = true;
            }

            DataTable dt1 = new DataTable();
            dt1 = (DataTable)Session["buyitems"];
            if (dt1 != null)
            {

                LbQuantityInCart.Text = dt1.Rows.Count.ToString();
            }
            else
            {
                LbQuantityInCart.Text = "0";
            }
        }

        protected void LBLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }

        protected void LinkButtonSearch_Click(object sender, EventArgs e)
        {
            if (tbSearch.Text == "")
            {                   
                Response.Write("<script>alert('Cần nhập dữ liệu vào ô tìm kiếm')</script>");
                return;
            }
            else
            {
                Response.Redirect("Index.aspx?productName=" + tbSearch.Text);
            }
            //ListView2.DataSourceID = null;
            //lw2.DataSource = ProducrSearch;
            //lw2.DataBind();
            //}
        }


    }
}