using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.Admin
{
    public partial class menus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonInsert_Click(object sender, EventArgs e)
        {
            SqlDataSourcePages.Insert();
            GridView1.DataBind();
            DDL_items.DataBind();
        }

        protected void SqlDataSourcePages_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void SqlDataSourcePages_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Cancel = false;
            try
            {

                e.Command.Parameters["@name"].Value = this.TextBoxName_pages.Text;

                int id_menu = -1;
                if (int.TryParse(TextBoxNumber_menu.Text, out id_menu)) e.Command.Parameters["@id_menu"].Value = id_menu;
                else  e.Command.Parameters["@id_menu"].Value = -1;

                e.Command.Parameters["@id_parent"].Value = DDL_items.SelectedValue;

                int npp = -1;
                if (int.TryParse(TextBoxNpp.Text, out npp)) e.Command.Parameters["@npp"].Value = npp;
                else e.Command.Parameters["@npp"].Value = DBNull.Value;

                e.Command.Parameters["@item_link"].Value = TextBoxLink.Text;

            }
            catch 
            {
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (GridView1.SelectedIndex==e.NewSelectedIndex)
            {
                e.Cancel = true;
                GridView1.SelectedIndex = -1;
                LabelBoxName_pages.Text = "Наименование пункта меню";
            }
            else
            {
                GridViewRow gvr = GridView1.Rows[e.NewSelectedIndex];
                LabelBoxName_pages.Text = "Наименование подпункта в пункт '" + ((Label)gvr.FindControl("Label2")).Text + "' меню ID=" + ((Label)gvr.FindControl("LabelID")).Text;
            }
        }
    }
}