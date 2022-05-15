using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace root.UC
{
    public partial class callback : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                SqlDataSourceCallback.Insert();
        }

        protected void SqlDataSourceCallback_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            try
            {
                e.Command.Parameters["@fio"].Value = TextBoxName.Text;
                e.Command.Parameters["@email"].Value = TextBoxEmail.Text;
                e.Command.Parameters["@post_data"].Value = TextBoxPost_data.Text;
                e.Command.Parameters["@date_post"].Value = DateTime.Now;
                e.Command.Parameters["@status"].Value = false;
                e.Command.Parameters["@operator"].Value = "";
                e.Command.Parameters["@comments"].Value = "";

            }
            catch (Exception ex)
            {
                LabelError.ForeColor = System.Drawing.Color.Red;
                LabelError.Text = "Ошибка отправки сообщения: " + ex.Message;
            }
            LabelError.ForeColor = System.Drawing.Color.Green;
            LabelError.Text = "Сообщение успешно отправлено!";
        }
    }
}