using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shop_health.Admin
{
    public partial class pages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonInsert_Click(object sender, EventArgs e)
        {
            SqlDataSourcePages.Insert();
            GridView1.DataBind();
        }

        protected void SqlDataSourcePages_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void SqlDataSourcePages_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Cancel = false;
            try
            {

                e.Command.Parameters["@name_pages"].Value = this.TextBoxName_pages.Text;
                //e.Command.Parameters["@id_pages"].Value = 1;
                //e.Command.Parameters["@text_pages"].Value = "";//this.TextBoxText_pages.Text;
                //e.Command.Parameters["@pos_pages"].Value = 0;//this.TextBoxPos_pages.Text;
                //e.Command.Parameters["@id_pages_type"].Value = 0;// Convert.ToInt16(this.DropDownListPages_type.SelectedValue);
                //e.Command.Parameters["@menu_number"].Value = 1;
                //e.Command.Parameters["@pos_pages_under"].Value = 1;


                //Server.Transfer("admin_pages.aspx");

            }
            catch 
            {
                //LabelError.Text = ex.Message;
                //LabelError.Visible = true;
                //e.Cancel = true;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
               (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                Label LabelItemMenu_number = (Label)e.Row.FindControl("LabelItemMenu_number");
                Label LabelItemMenu_npp = (Label)e.Row.FindControl("LabelItemMenu_npp");
                if (LabelItemMenu_number.Text=="" && LabelItemMenu_npp.Text == "")
                {
                    e.Row.CssClass = "info";
                }
            }
            
        }
    }
}