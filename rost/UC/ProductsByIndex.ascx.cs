﻿using System;
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
    public partial class ProductsByIndex : System.Web.UI.UserControl
    {
        protected int _items, _count_rom, _width_block, rowsCount = 0, gridviewCountRow;
        protected string _header_block;
        public string overlay = "", modal_form = "", modal_close = "", go = "", _posPhoto = "", _sqlWhere=""; 
        private bool _showDate = true, _showHeader = true, _showBorder = true;


        public void Refresh()
        {
            BindGrid();
        }


        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        /// 


        public int TypeNews
        {
            get { return _items; }
            set { _items = value; }
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
        /// Кол-во продуктов всего
        /// </summary>
        public int _itemsPerPage
        {
            get { return rowsCount; }
            set { rowsCount = value; }
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

                BindGrid();
            }



            // GridView1.Width = WidthNews;
        }

        protected void BindGrid()
        {
            //            string SQL = @"WITH SSS AS
            //(
            //select * from ShopData where onFirstPage=1
            //union all
            //select * from ShopData where AllowFilters like '%Новинка%'
            //union all
            //select * from ShopData 
            //)
            //select distinct top(4) *  from SSS";
            string topRec = rowsCount == 0 ? "" : " top(" + rowsCount.ToString() + ") ";
            string SQL = "select "+topRec+ " *, row_number() over (order by (select 1)) rownum from ShopData";
            if (_sqlWhere!="") SQL+= " where " + _sqlWhere;
            SqlDataSourceBaseText.SelectCommand = SQL;

            Repeater1.DataSource = SqlDataSourceBaseText;
            Repeater1.DataBind();
            //            Datalist1.DataSource = SqlDataSourceBaseText;
            //            Datalist1.DataBind();
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                string data_id = ((Label)e.Item.FindControl("ID_item")).Text;
                string price = ((Label)e.Item.FindControl("LabelPrice")).Text;
                string name_item = ((Label)e.Item.FindControl("caption")).Text;
                string items = ((Label)e.Item.FindControl("LabelImageItems")).Text;
                string rnum = ((Label)e.Item.FindControl("RowNum")).Text;
                Literal Abtn = (Literal)e.Item.FindControl("Abtn");
                HyperLink HLShowProd = (HyperLink)e.Item.FindControl("HyperLinkImg");

                HLShowProd.NavigateUrl = "~/ShopDesc.aspx?id=" + data_id;
                Abtn.Text = @"<button class=""btn btn-warning add_item"" data-id=""" + data_id + @""" data-title=""" + name_item + @""" data-price=""" + price + @""" data-img="""+ "./../photoDB.ashx?type_img=" + "news" + "&items=" + items + @""" data-count=""1"" > <i class=""glyphicon glyphicon-credit-card""></i> В корзину</button>";

                string AFilters = ((Label)e.Item.FindControl("LabelFilters")).Text;

                string IFilters = "";
                Literal ImgFlt = (Literal)e.Item.FindControl("ImgFilters");
                Literal nextRow = (Literal)e.Item.FindControl("NextRow");
                if (_count_rom > 0)
                {
                    try
                    {
                        if ((Convert.ToInt64(rnum) % _count_rom) == 0)
                        {
                            nextRow.Text = @"<br />";
                        }
                    }
                    catch
                    {

                    }
                }

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
                ImgFlt.Text = IFilters;
                            //((Panel)e.Item.FindControl("PanelInfoBlock")).CssClass = PosPhoto;
                if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
                {
                    //((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;

                    ((Image)e.Item.FindControl("ImageItem")).Visible = true;
                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=" + "news" + "&items=" + items;
                    //((Image)e.Row.FindControl("ImageItem")).FullImageURL = "photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
                }

            }
            
        }
    }
}