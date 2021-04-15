using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBTL
{
    public partial class Register : System.Web.UI.Page
    {
        string constr = @"Data Source=HIEUTHAHN\HIEUTHAHN;Initial Catalog=WebBanHangBTL;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            //if (tbRegisterUserName.Text == "")
            //{
            //    LabelRegister.Text = "Bạn cần nhập họ tên";
            //    return;
            //}
            //else if (tbRegisterPassword.Text == "")
            //{
            //    LabelRegister.Text = "Bạn cần nhập mật khẩu";
            //    return;
            //}
            //else if (tbRegisterRePassword.Text == "")
            //{
            //    LabelRegister.Text = "Bạn cần nhập lại mật khẩu";
            //    return;
            //}
            //else if (tbRegisterRePassword.Text != tbRegisterPassword.Text)
            //{
            //    LabelRegister.Text = "Mật khẩu nhập lại không trùng với mật khẩu đã nhập";
            //    return;
            //}
            //else if (tbRegisterPassword.Text.Count<char>() < 6)
            //{
            //    LabelRegister.Text = "Mật khẩu phải đủ 6 ký tự trở trên";
            //    return;
            //}
            //else
            //{
                String query = "insert into usertest(username, password) values('" + tbRegisterUserName.Text + "','" + tbRegisterPassword.Text + "')";
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                LabelRegister.Text = "Đăng ký thành công";
                con.Close();
            //}
        }
    }
}