using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class DynamicSlider : System.Web.UI.UserControl
    {
        protected int _items, _count_rom, _width_block, rowsCount = 0, gridviewCountRow, _count_records = 0, _first_id = 0;
        protected string _header_block;
        public string overlay = "", modal_form = "", modal_close = "", go = "", _posPhoto = "";

        private bool _showDate = true, _showHeader = true, _showBorder = true;

        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        public int IdPages
        {
            get { return _items; }
            set { _items = value; }
        }

        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>
        public int CountNews
        {
            get { return _count_records; }
            set { _count_records = value; }
        }

        public int FirstID
        {
            get { return _first_id; }
            set { _first_id = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null && IdPages == -1)
                {
                    IdPages = Convert.ToInt16(Request["id_pages"].ToString());
                }
           //     HyperLinkHead.NavigateUrl = "~/PagesSmall.aspx?id_pages=" + IdPages.ToString();
                FirstID = 0;
                SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString);
                string SqlText = @"DECLARE @ids VARCHAR(8000); 

SELECT @ids = COALESCE(@ids + ', ', '') + LTRIM(RTRIM(str((10000000-npp*10000)+id_text)))
FROM BaseText
WHERE id_pages="+IdPages.ToString()+@" and visible_blok=1 ORDER BY npp, id_text desc;

select @ids";

//                SqlCommand cmd = new SqlCommand("dbo.GetListIDTexts(" + IdPages + ")", sqc);
                SqlCommand cmd = new SqlCommand(SqlText, sqc);
                sqc.Open();
                IDS.Value = cmd.ExecuteScalar().ToString();
                sqc.Close();
                if (IDS.Value.Trim() == "") IDS.Value = "0";
                FirstId.Value = "0";
                CheckMoveButtons();

                BindGrid(IdPages);

            }
            else
            {
            }
        }

        protected void BindGrid(int id_pages)
        {
            object data = null;
            this.SqlDataSourceBaseText.SelectParameters["count_row"].DefaultValue = CountNews.ToString();
            this.SqlDataSourceBaseText.SelectParameters["id_pages"].DefaultValue = id_pages.ToString();

            this.SqlDataSourceBaseText.SelectParameters["first_id"].DefaultValue = IDS.Value.Split(',')[int.Parse(FirstId.Value)];
            data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            Replist1.DataSource = data;
            Replist1.DataBind();
        }
        protected void Replist1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                string items = ((Label)e.Item.FindControl("LabelItemItems")).Text;
                string id_text = ((Label)e.Item.FindControl("LabelId_text")).Text;
                string base_text = ((Label)e.Item.FindControl("LabelItemBase_text")).Text;


                if (base_text != "")
                {
                    ((HyperLink)e.Item.FindControl("HyperLinkImg")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items;
                }

                if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
                {
                    ((Image)e.Item.FindControl("ImageItem")).Visible = true;
                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=image_lowCA&items=" + items + "&w=525&h=289";
                    //((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=image_lowCA&items=" + items;
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
                }
            }

        }

        protected void CheckMoveButtons()
        {
            int a = IDS.Value.Split(',').Length;
            if (FirstID >= a - _count_records)  ButtonNext.Enabled = false;  else  ButtonNext.Enabled = true;
            if (FirstID <= 0) ButtonPrev.Enabled = false; else ButtonPrev.Enabled = true;
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            FirstID = int.Parse(FirstId.Value);
            FirstID += 1;
            int a = IDS.Value.Split(',').Length;
            if (FirstID > a - _count_records) FirstID = int.Parse(FirstId.Value);
            FirstId.Value = FirstID.ToString();
            CheckMoveButtons();
            BindGrid(IdPages);
        }
        protected void ButtonPrev_Click(object sender, EventArgs e)
        {
            FirstID = int.Parse(FirstId.Value);
            FirstID -= 1;
            if (FirstID < 0)  FirstID = 0;
            FirstId.Value = FirstID.ToString();
            CheckMoveButtons();
            BindGrid(IdPages);
        }

    }
}