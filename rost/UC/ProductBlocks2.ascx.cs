using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace root.UC
{
    public partial class ProductBlocks2 : System.Web.UI.UserControl
    {
        protected int _items, _count_rom, _width_block, rowsCount = 0, gridviewCountRow, _count_records=0 ;
        protected string _header_block, _sqlWhere = "";
        public string overlay = "", modal_form = "", modal_close = "", go = "", _posPhoto = "";
        private bool _showDate = true, _showHeader = true, _showBorder = true;


        public void Refresh()
        {
            BindGrid();
        }


        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        public int TypeNews
        {
            get { return _items; }
            set { _items = value; }
        }

        /// <summary>
        /// условие выборким из базы
        /// </summary>
        public string SsqlWhere
        {
            get { return _sqlWhere; }
            set { _sqlWhere = value; }
        }

        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>
        public int PagingNews
        {
            get { return _count_rom; }
            set { _count_rom = value; }
        }


        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>
        public int CountNews
        {
            get { return rowsCount; }
            set { rowsCount = value; }
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
                //LHeader.Text = HeaderNews;
                BindGrid();
            }
        }

        protected void BindGrid()
        {

            string topRec = rowsCount == 0 ? "" : " top(" + rowsCount.ToString() + ") ";
            string SQL = "select " + topRec + " *, row_number() over (order by (select 1)) rownum from ShopData where (Balance>0 or WaitIn=1) " + _sqlWhere;
            SqlDataSourceBaseText.SelectCommand = SQL;

            Replist1.DataSource = SqlDataSourceBaseText;
            Replist1.DataBind();
        }
        protected void Replist1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                String items = ((Label)e.Item.FindControl("LabelItemItems")).Text;

                string data_id = ((Label)e.Item.FindControl("ID_item")).Text;
                string price = ((Label)e.Item.FindControl("LabelPrice")).Text.Replace(",",".");
                string name_item = ((Label)e.Item.FindControl("LabelHeader_text")).Text;
                string MaxCount = ((Label)e.Item.FindControl("LabelMaxCount")).Text; 

                Literal Abtn = (Literal)e.Item.FindControl("Abtn");
                HyperLink HLShowProd = (HyperLink)e.Item.FindControl("HyperLinkImg");

                HLShowProd.NavigateUrl = "~/shop_desc.aspx?id=" + data_id;
                Abtn.Text = @"<button class=""btn btn-warning add_item"" data-id=""" + data_id + @""" data-title=""" + name_item + @""" data-price=""" + price + @""" data-img=""" + "./../photoDB.ashx?type_img=" + "news" + "&items=" + items + @""" data-count=""1"" data-maxcount="""+MaxCount+ @"""> <i  id=""credit-card"" class=""glyphicon glyphicon-credit-card""></i> В корзину</button>";


                if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
                {

                    ((Image)e.Item.FindControl("ImageItem")).Visible = true;
                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=image_lowCA&items=" + items + "&w=250&h=250";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
                }


                string AFilters = ((Label)e.Item.FindControl("LabelFilters")).Text;
                string IFilters = "";
                //Literal ImgFlt = (Literal)e.Item.FindControl("ImgFilters");
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["shop_healthConnectionString"].ConnectionString))
                {

                    SqlCommand com = new SqlCommand("SELECT items FROM ShopFilters where '" + AFilters + "' like '%'+name_filter+'%'", MyConnection);
                    try
                    {
                        MyConnection.Open();
                        SqlDataReader readerData = com.ExecuteReader(CommandBehavior.CloseConnection);
                        while (readerData.Read())
                        {
                            string fitems = readerData["items"].ToString();
                            if (fitems.Trim() != "")
                            {
                                IFilters += @"<img src=""./../photoDB.ashx?type_img=image_lowCA&items=" + fitems + @"&w=30&h=30"" class=""img-responsive"" />" + '\n' + '\r';
                            }

                        }
                    }
                    catch { }

                }
                //ImgFlt.Text = IFilters;

                //string rnum = ((Label)e.Item.FindControl("RowNum")).Text;
                //Literal nextRow = (Literal)e.Item.FindControl("NewRow");
                //if (_count_rom > 0)
                //{
                //    try
                //    {
                //        if ((Convert.ToInt64(rnum) % _count_rom) == 0)
                //        {
                //            nextRow.Text = @"<br />";
                //        }
                //    }
                //    catch
                //    {

                //    }
                //}


            }

        }
    }
}