using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBTL
{
    public partial class Chitietmathang : System.Web.UI.Page
    {
        string constr = @"Data Source=HIEUTHAHN\HIEUTHAHN;Initial Catalog=WebBanHangBTL;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["productName"] != null)

            {
                ListView1.DataSourceID = null;
                ListView2.DataSourceID = null;
                ListView1.DataSource = ProductDetail;
                ListView2.DataSource = ProductDetail;
                ListView1.DataBind();
                ListView2.DataBind();
            }

            updatecounter();
            findView();
            
        }

        protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "BuyNow")
            {
                Response.Redirect("ViewCart.aspx?id=" + e.CommandArgument.ToString());

            }
            if (e.CommandName == "AddToCart")
            {
                Response.Redirect("ProductDetail.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        private void findView()
        {
            String myquery = "Select * from ViewCounter";
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            Lb_Viewed.Text = "Số lần đã xem: " + ds.Tables[0].Rows[0]["viewcount"].ToString();
            con.Close();
        }


         private void updatecounter()
        {
            String updatedata = "Update ViewCounter set viewcount=viewcount+1"; 
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

    }
}