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
    public partial class ViewCart : System.Web.UI.Page
    {
        string constr = @"Data Source=HIEUTHAHN\HIEUTHAHN;Initial Catalog=WebBanHangBTL;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("ProductId");
                dt.Columns.Add("ProductName");
                dt.Columns.Add("Price");
                dt.Columns.Add("Link");
                dt.Columns.Add("UnitPriceNew");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("TotalPrice");
                dt.Columns.Add("TotalPriceAll");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {

                        dr = dt.NewRow();
                        String mycon = constr;
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Product where ProductId=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["ProductId"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["ProductName"] = ds.Tables[0].Rows[0]["ProductName"].ToString();
                        dr["Link"] = ds.Tables[0].Rows[0]["Link"].ToString();
                        dr["UnitPriceNew"] = ds.Tables[0].Rows[0]["UnitPriceNew"].ToString();
                        dr["Quantity"] = ds.Tables[0].Rows[0]["Quantity"].ToString();
                        //dr["TotalPriceAll"] = grandtotal().ToString();
                        //dr["Quantity"] = ds.Tables[0].Rows[0]["Quantity"].ToString();
                        //int quantity = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                        int unitpricenew = Convert.ToInt32(ds.Tables[0].Rows[0]["UnitPriceNew"].ToString());
                        int quantity = Convert.ToInt16(ds.Tables[0].Rows[0]["Quantity"].ToString());
                        int Totalprice = unitpricenew * quantity;
                        dr["TotalPrice"] = Totalprice;
                        dt.Rows.Add(dr);
                        ListViewCart.DataSource = dt;
                        ListViewCart.DataBind();
                        Session["buyitems"] = dt;
                        //ListViewCart.FooterRow.Cells[5].Text = "Total Amount";
                        //ListViewCart.FooterRow.Cells[6].Text = grandtotal().ToString();
                        //Response.Redirect("AddToCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        String mycon = constr;
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from Product where ProductId=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["ProductId"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["ProductName"] = ds.Tables[0].Rows[0]["productname"].ToString();
                        dr["Link"] = ds.Tables[0].Rows[0]["Link"].ToString();
                        dr["UnitPriceNew"] = ds.Tables[0].Rows[0]["UnitPriceNew"].ToString();
                        dr["Quantity"] = ds.Tables[0].Rows[0]["Quantity"].ToString();
                        //dr["TotalPriceAll"] = grandtotal().ToString();
                        //dr["Quantity"] = ds.Tables[0].Rows[0]["Quantity"].ToString();
                        //int Quantity = Convert.ToInt16(Request.QueryString["Quantity"].ToString());
                        int unitpricenew = Convert.ToInt32(ds.Tables[0].Rows[0]["UnitPriceNew"].ToString());
                        int quantity = Convert.ToInt16(ds.Tables[0].Rows[0]["Quantity"].ToString());
                        int Totalprice = unitpricenew * quantity;
                        dr["TotalPrice"] = Totalprice;
                        dt.Rows.Add(dr);
                        ListViewCart.DataSource = dt;
                        ListViewCart.DataBind();
                        Session["buyitems"] = dt;

                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    ListViewCart.DataSource = dt;
                    ListViewCart.DataBind();

                }

            }
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["TotalPrice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        protected void ListViewCart_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            ListViewCart.Items.RemoveAt(ListViewCart.SelectedIndex);
            //for (int i = 0; i <= dt.Rows.Count - 1; i++)
            //{
            //    int sr;
            //    int sr1;
            //    string qdata;
            //    string dtdata;
            //    sr = Convert.ToInt32(dt.Rows[i]["ProductID"].ToString());
            //    TableCell cell = ListViewCart.Items[e.ItemIndex];
            //    TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                
            //    qdata = cell.Text;
            //    dtdata = sr.ToString();
            //    sr1 = Convert.ToInt32(qdata);

            //    if (sr == sr1)
            //    {
            //        dt.Rows[i].Delete();
            //        dt.AcceptChanges();
            //        //Label1.Text = "Item Has Been Deleted From Shopping Cart";
            //        break;

            //    }
            //}

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["ProductID"] = i;
                dt.AcceptChanges();
            }

            Session["buyitems"] = dt;
            Response.Redirect("ViewCart.aspx");
        
        }
    }
}