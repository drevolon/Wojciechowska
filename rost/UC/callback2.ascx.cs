using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class callback2 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random rnd = new Random();
                int a = rnd.Next(1, 10);
                int b = rnd.Next(1, 10);
                qq.Value = (a + b).ToString();
                LabelForCapcha.Text = a.ToString() + "+" + b.ToString() + "=";
            }
        }

        protected void ButtonSend_Click(object sender, EventArgs e)
        {
            if (TextCapcha.Text.Trim() == qq.Value)
            {
                LabelError.Text = "";
                if (Page.IsValid)
                    SqlDataSourceCallback.Insert();
            }
            else
            {
                LabelError.ForeColor = System.Drawing.Color.Red;
                LabelError.Text = "Неверный ответ!";
            }
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