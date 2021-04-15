using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Drawing;


namespace WebBTL
{
    public partial class Index : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["WebBanHangBTLConnectionString"].ConnectionString;
        string constr = @"Data Source=HIEUTHAHN\HIEUTHAHN;Initial Catalog=WebBanHangBTL;Integrated Security=True";
        static int currentposition = 0;
        static int totalrows = 0;
        public static int pagecount = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Request.QueryString["category"] != null)
            //{
            //    ListView2.DataSourceID = null;
            //    ListView2.DataSource = ProductListCategory;
            //    ListView2.DataBind();
            //}

            //else if (Request.QueryString["productName"] != null)
            //{
            //    ListView2.DataSourceID = null;
            //    ListView2.DataSource = ProductSearch;
            //    ListView2.DataBind();
            //}
            //LinkButton1.Text = "";

            if (!IsPostBack)
            {
                bindata();
            }

            //if (Session["username"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //LinkButton1_Click.ForeColor = Color.FromName("#ee4d2d");
            //LinkButton1.ForeColor = Color.FromName("#ee4d2d");
            
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            //ListView2.DataSourceID = null;
            //ListView2.DataSource = SqlDataSource1;
            //ListView2.DataBind();
            //Binding pg to datalist
            bindata();

        }

        protected void LinkButtonASC_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["category"] == "all" || Request.Url.Query == "")
            {

                ListView2.DataSourceID = null;
                ListView2.DataSource = SortProductASC;
                ListView2.DataBind();
            }
            else
            {
                ListView2.DataSourceID = null;
                ListView2.DataSource = SortProductASC_Category;
                ListView2.DataBind();
            }

        }


        protected void LinkButtonDSC_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["category"] == "all" || Request.Url.Query == "")
            {
                ListView2.DataSourceID = null;
                ListView2.DataSource = SortProductDSC;
                ListView2.DataBind();
            }
            else
            {
                ListView2.DataSourceID = null;
                ListView2.DataSource = SortProductDSC_Category;
                ListView2.DataBind();
            }
        }

        private void bindata()
        {
            String myquery = "Select * from Product";
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            totalrows = ds.Tables[0].Rows.Count;
            DataTable dt = ds.Tables[0];
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition;
            pg.PageSize = 10;
            LinkButtonFirstPage.Enabled = !pg.IsFirstPage;
            LinkButtonPageBack.Visible = !pg.IsFirstPage;
            LinkButtonPageNext.Visible = !pg.IsLastPage;
            LinkButtonLastPage.Enabled = !pg.IsLastPage;
            if (Request.QueryString["category"] != null)
            {
                ListView2.DataSourceID = null;
                ListView2.DataSource = ProductListCategory;
                ListView2.DataBind();
            }

            else if (Request.QueryString["productName"] != null)
            {
                ListView2.DataSourceID = null;
                ListView2.DataSource = ProductSearch;
                ListView2.DataBind();
            }
            else
            {
                //Binding pg to datalist
                ListView2.DataSource = pg; //dl is datalist
                //ListView2.DataSourceID = null;
                ListView2.DataBind();
            }
            con.Close();
        }

        private void ChangePageColor(LinkButton LBtn1, LinkButton LBtn2, LinkButton LBtn3)
        {
            LBtn1.BackColor = Color.FromName("#ee4d2d");
            LBtn1.ForeColor = Color.White;
            LBtn2.BackColor = Color.Transparent;
            LBtn2.ForeColor = Color.FromName("#333");
            LBtn3.BackColor = Color.Transparent;
            LBtn3.ForeColor = Color.FromName("#333");
        }

        protected void LinkButtonFirstPage_Click(object sender, EventArgs e)
        {
            currentposition = currentposition - 1;
            bindata();

            if (currentposition == 0)
            {
                ChangePageColor(LinkButtonPage1, LinkButtonPage2, LinkButtonPage3);
            }
            else if (currentposition == 1)
            {
                ChangePageColor(LinkButtonPage2, LinkButtonPage1, LinkButtonPage3);
            }
            else
            {
                ChangePageColor(LinkButtonPage3, LinkButtonPage2, LinkButtonPage1);
            }
            LabelPageCount.Text = Convert.ToString(currentposition + 1);
        }

        protected void LinkButtonPage1_Click(object sender, EventArgs e)
        {
            currentposition = 0;
            bindata();
            ChangePageColor(LinkButtonPage1, LinkButtonPage2, LinkButtonPage3);
            LabelPageCount.Text = Convert.ToString(currentposition + 1);
        }

        protected void LinkButtonPage2_Click(object sender, EventArgs e)
        {

            currentposition = 1;
            bindata();
            ChangePageColor(LinkButtonPage2, LinkButtonPage1, LinkButtonPage3);
            LabelPageCount.Text = Convert.ToString(currentposition + 1);

        }

        protected void LinkButtonPage3_Click(object sender, EventArgs e)
        {

            currentposition = 2;
            bindata();
            ChangePageColor(LinkButtonPage3, LinkButtonPage2, LinkButtonPage1);
            LabelPageCount.Text = Convert.ToString(currentposition + 1);
        }

        protected void LinkButtonLastPage_Click(object sender, EventArgs e)
        {
            currentposition = currentposition + 1;
            bindata();
            if (currentposition == 1)
            {
                ChangePageColor(LinkButtonPage2, LinkButtonPage1, LinkButtonPage3);
            }
            else if (currentposition == 2)
            {
                ChangePageColor(LinkButtonPage3, LinkButtonPage2, LinkButtonPage1);
            }
            else
            {
                ChangePageColor(LinkButtonPage1, LinkButtonPage2, LinkButtonPage3);
            }
            LabelPageCount.Text = Convert.ToString(currentposition + 1);
        }

        protected void LinkButtonPageBack_Click(object sender, EventArgs e)
        {
            currentposition = currentposition - 1;
            bindata();
            LabelPageCount.Text = Convert.ToString(currentposition + 1);
        }

        protected void LinkButtonPageNext_Click(object sender, EventArgs e)
        {
            currentposition = currentposition + 1;
            bindata();
            LabelPageCount.Text = Convert.ToString(currentposition + 1);
        }
    }
}