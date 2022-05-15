using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using rost.App_Code;

namespace rost.Admin
{
    public partial class admin_callback : System.Web.UI.Page
    {
        protected Files objFiles = new Files();
        protected string items = "-1";
        protected string fileNames = "-1";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //admin master = (admin)this.Master;
                //master.GreatHeader = "Библиотека файлов";

                Page.Title = "Обратная связь";
            }
        }
        
        
        



        

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //ImagePhoto
            if (e.Row.RowType == DataControlRowType.DataRow &&
              (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                CheckBox CheckBoxItemStatus = (CheckBox)e.Row.FindControl("CheckBoxItemStatus");
                Label LabelItemStatus = (Label)e.Row.FindControl("LabelItemStatus");

                if (CheckBoxItemStatus.Checked)
                {
                    LabelItemStatus.ToolTip = "Обращение принято во внимание!";
                    //e.Row.CssClass = CheckBoxItemStatus.Checked ? "table success" : "table";
                    LabelItemStatus.CssClass = "glyphicon glyphicon-ok";
                    LabelItemStatus.ForeColor = System.Drawing.Color.Green;
                    e.Row.CssClass = "table success";
                }
                else
                {
                    LabelItemStatus.ToolTip = "Обращение не обработано!";
                    LabelItemStatus.ForeColor = System.Drawing.Color.Red;
                    LabelItemStatus.CssClass = "glyphicon glyphicon-alert";
                }
            }
        }

        

        
    }
}