using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class UniversalTextBlocksPages : System.Web.UI.UserControl
    {
        protected int _items, _count_rom=1, _width_block, rowsCount = 0, gridviewCountRow, _count_records = 0, _num_page=1;
        protected string _header_block;
        public string overlay = "", modal_form = "", modal_close = "", go = "", _posPhoto = "";
        private bool _showDate = true, _showHeader = true, _showBorder = true;

        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        public int TypeNews
        {
            get { return _items; }
            set { _items = value; }
        }

        /// <summary>
        /// Кол-во новостей на Page
        /// </summary>
        public int PagingNews
        {
            get { return _count_rom; }
            set { _count_rom = value; }
        }

        /// <summary>
        /// Номер Page
        /// </summary>
        public int NumPage
        {
            get { return _num_page; }
            set { _num_page = value; }
        }

        /// <summary>
        /// Кол-во отображаемых новостей 
        /// </summary>
        public int CountNews
        {
            get { return _count_records; }
            set { _count_records = value; }
        }


        /// <summary>
        /// Ширина блока в px
        /// </summary>
        public int WidthNews
        {
            get { return _width_block; }
            set { _width_block = value; }
        }
        /// <summary>
        /// Заголовок новостного блока
        /// </summary>
        public string HeaderNews
        {
            get { return _header_block; }
            set { _header_block = value; }
        }
        /// <summary>
        /// Показ даты
        /// </summary>
        public bool ShowDate
        {
            get { return _showDate; }
            set { _showDate = value; }
        }
        /// <summary>
        /// Показ даты
        /// </summary>
        public bool ShowHeader
        {
            get { return _showHeader; }
            set { _showHeader = value; }
        }
        /// <summary>
        /// Показать рамку
        /// </summary>
        public bool ShowBorder
        {
            get { return _showBorder; }
            set { _showBorder = value; }
        }
        /// <summary>
        /// Позиция фото
        /// </summary>
        public string PosPhoto
        {
            get
            {
                switch (_posPhoto)
                {
                    case "top":
                        {
                            _posPhoto = "media-top";
                            break;
                        }
                    case "left":
                        {
                            _posPhoto = "media-left";
                            break;
                        }
                }
                return _posPhoto;
            }
            set
            {
                _posPhoto = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null && TypeNews == -1)
                {
                    TypeNews = Convert.ToInt16(Request["id_pages"].ToString());
                }
                if (Request["qty_on_page"] != null && PagingNews == -1)
                {
                    PagingNews = Convert.ToInt16(Request["qty_on_page"].ToString());
                }

                ViewState["TypeNews"] = TypeNews;
                ViewState["PagingNews"] = PagingNews;

                DataTable TblPages = new DataTable();
                DataColumn col = new DataColumn();
                TblPages.Columns.Add("NP", System.Type.GetType("System.String"));
                int nPgs= getCountPages();
                for (int i = 1; i <= nPgs; i++)
                {
                    DataRow row = TblPages.NewRow();
                    row["NP"] = i.ToString();
                    TblPages.Rows.Add(row);
                }

                ListNumPages.DataSource = TblPages;
                ListNumPages.DataBind();

                
                NumPageDesign(ListNumPages);

                //LHeader.Text = HeaderNews;
                BindGrid(TypeNews);
                //HyperLinkHead.NavigateUrl = "~/News.aspx?id_pages=" + TypeNews;


                // LabelHeader.Text = HeaderNews;

                //gridviewCountRow = GridView1.Rows.Count;
            }
            else
            {
                TypeNews = Convert.ToInt32(ViewState["TypeNews"].ToString());
                PagingNews = Convert.ToInt32(ViewState["PagingNews"].ToString());
            }
            // GridView1.Width = WidthNews;
        }
        protected int getCountPages()
        {
            int qtyPgs = 1;
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
            {
                MyConnection.Open();
                SqlCommand com = new SqlCommand("select count(*) qty from BaseText where (BaseText.id_pages = "+ TypeNews.ToString()+ ") and BaseText.visible_blok=1", MyConnection);
                try
                {
                    int qtyRecords = Convert.ToInt32(com.ExecuteScalar());
                    qtyPgs = qtyRecords / PagingNews;
                    if (qtyPgs * PagingNews < qtyRecords) qtyPgs += 1;
                }
                catch
                {
                    qtyPgs = 1;
                }
                MyConnection.Close();
            }
            return qtyPgs;
        }

        protected void NumPageDesign(Repeater r)
        {

            foreach (RepeaterItem obj in r.Items)
            {
                LinkButton rilb = (LinkButton)obj.FindControl("NPG");
                if (rilb != null)
                {
                    rilb.Font.Bold = (rilb.Text == NumPage.ToString());
                }
            }

        }
        protected void Unnamed_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "NumPage")
            {
                int n = Convert.ToInt32(e.CommandArgument);
                _num_page = n;
                Repeater r = (Repeater)((RepeaterItem)((LinkButton)sender).Parent).Parent;
                NumPageDesign(r);
                BindGrid(TypeNews);
            }
        }

        protected void BindGrid(int type_news)
        {
            object data = null;
            int current_year = DateTime.Now.Year;
            //int begin_year = current_year - 3;
            //int end_year = current_year + 1;

            //this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = "01.01." + begin_year;
            this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = CountNews.ToString();
            this.SqlDataSourceBaseText.SelectParameters[1].DefaultValue = type_news.ToString();
            int n = (NumPage - 1) * PagingNews + 1;
            int m = PagingNews + (NumPage - 1) * PagingNews;

            this.SqlDataSourceBaseText.SelectParameters[2].DefaultValue = n.ToString();
            this.SqlDataSourceBaseText.SelectParameters[3].DefaultValue = m.ToString();
            data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            //GridView1.DataSource = data;
            //GridView1.DataBind();
            Replist1.DataSource = data;
            Replist1.DataBind();
        }
        protected void Replist1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                String items = ((Label)e.Item.FindControl("LabelItemItems")).Text;
                String type_img = "news_id";
                String id_images = ((Label)e.Item.FindControl("LabelItemId_images")).Text;
                string id_text = ((Label)e.Item.FindControl("LabelId_text")).Text;
                string base_text = ((Label)e.Item.FindControl("LabelItemBase_text")).Text;


                if (base_text != "")
                {
                    ((HyperLink)e.Item.FindControl("HyperLinkImg")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items;
                    ((HyperLink)e.Item.FindControl("HyperLinkText")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items;
                }

                if (Request["masterPage"] == "big")
                {
                    ((HyperLink)e.Item.FindControl("HyperLinkImg")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items + "&masterPage=big";
                    //                    ((HyperLink)e.Item.FindControl("HyperLinkText")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items + "&masterPage=big";
                }


                //((Panel)e.Item.FindControl("PanelInfoBlock")).CssClass = PosPhoto;



                if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
                {
                    //((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;

                    ((Image)e.Item.FindControl("ImageItem")).Visible = true;
                    //                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&id=" + id_images;
                    //((Image)e.Row.FindControl("ImageItem")).FullImageURL = "photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=image_lowCA&items=" + items + "&w=299&h=168";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
                }


            }

        }
    }
}