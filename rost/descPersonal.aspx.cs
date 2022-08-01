using rost.Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost
{
    public partial class descPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id_text"]!=null)
            {
                string id_text = Request.Params["id_text"].ToString();
                using (SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ToString()))
                {
                    sqc.Open();
                    SqlCommand cmd = new SqlCommand("select * from BaseText where id_text=" + id_text, sqc);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        string DopProps = sdr["property"].ToString();
                        if (DopProps != string.Empty)
                        {
                            JsonProps ListProps = (new JavaScriptSerializer()).Deserialize<JsonProps>(DopProps);
                            RepeatProps.DataSource = ListProps.Property;
                            RepeatProps.DataBind();
                        }

                        string DopDocs = sdr["images_add"].ToString();
                        if (DopDocs != string.Empty)
                        {
                            JsonImages ListDocs = (new JavaScriptSerializer()).Deserialize<JsonImages>(DopDocs);
                            RepeatDocs.DataSource = ListDocs.Images;
                            RepeatDocs.DataBind();
                        }


                        MainText.Text = sdr["base_text"].ToString();

                        ImageItem.ImageUrl = "~/photoDB.ashx?type_img=image_lowCA&items=" + sdr["items"].ToString() + "&w=315&h=418";
                        ImageItem.FullImageURL = "~/photoDB.ashx?type_img=image_bigCA&items=" + sdr["items"].ToString();

                        //GridView panDoc = (GridView)(e.Row.FindControl("GridDocsList"));
                        //string DopDocs = ((Label)(e.Row.FindControl("LabelDocs"))).Text;
                        //if (DopDocs != string.Empty)
                        //{
                        //    JsonImages ListDocs = (new JavaScriptSerializer()).Deserialize<JsonImages>(DopDocs);
                        //    panDoc.DataSource = ListDocs.Images;
                        //    panDoc.DataBind();
                        //}


                    }
                    sdr.Close();
                    sqc.Close();
                }

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
              (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                String type_img = "image_lowCA"; //"news";
                String w = "250";
                String h = "200";

                String type_img_big = "image_bigCA";
                String items = ((Label)e.Row.FindControl("LabelItemItems")).Text;


                if (((Label)e.Row.FindControl("LabelItemHave_img")).Text == "True")
                {
                    ((Encosia.HighslideImage)e.Row.FindControl("ImageItem")).Visible = true;
                    ((Encosia.HighslideImage)e.Row.FindControl("ImageItem")).ImageUrl = "~/photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;
                    ((Encosia.HighslideImage)e.Row.FindControl("ImageItem")).FullImageURL = "~/photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItem")).Visible = false;
                    ((Panel)e.Row.FindControl("PanelImageRight")).Visible = false;
                }
            }
        }
    }
}