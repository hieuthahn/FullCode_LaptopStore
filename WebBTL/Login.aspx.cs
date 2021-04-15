using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebBTL
{
    public partial class Login : System.Web.UI.Page
    {
        string constr = @"Data Source=HIEUTHAHN\HIEUTHAHN;Initial Catalog=WebBanHangBTL;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection scon = new SqlConnection(constr);
            String myquery = "select * from usertest";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            String uname;
            String pass;
            bool check = false;
            uname = ds.Tables[0].Rows[0]["username"].ToString();

            pass = ds.Tables[0].Rows[0]["password"].ToString();
            
            for (int i = 0; i< ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["username"].ToString() == tbUserName.Text && ds.Tables[0].Rows[i]["password"].ToString() == tbPassword.Text)
                {
                    Session["username"] = ds.Tables[0].Rows[i]["username"].ToString();
                    Response.Redirect("Index.aspx");
                    check = true;
                }
            }
            if (check == true)
            {
                Label1.Text = "Sai tài khoản hoặc mật khẩu <br/> Vui lòng nhập lại !!!";
            }
            scon.Close();
        }

    }
}