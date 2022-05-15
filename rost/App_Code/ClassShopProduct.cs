using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace shop_health.App_Code
{
 
    public class ClassShopProduct
    {
        public int ID;
        public string PROD_NAME;
        public string PROD_CONSIST;
        public double WEIGHT;
        public string WEIGHT_EI;
        public double PRICE;
        public string NOTE;
        public string CATEGORY;
        public string AllowFilters;
        public string iFilters;
        public string items;
        public int have_img;
        public int onFirstPage;
        public int WaitIn;
        public string Produce;
        public int Balance;


        public void GetInfo(int id)
        {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["shop_healthConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand("SELECT * FROM dbo.ShopData where id=@id", MyConnection);
                try
                {
                    com.Parameters.AddWithValue("id", id);
                    MyConnection.Open();
                    SqlDataReader readerData = com.ExecuteReader();
                    if (readerData.HasRows)
                    {
                        readerData.Read();
                        ID = (int)readerData["id"];
                        PROD_NAME = readerData["prod_name"].ToString();
                        PROD_CONSIST = readerData["prod_consist"].ToString();
                        try { WEIGHT = Convert.ToDouble(readerData["weight"].ToString()); } catch { WEIGHT = 0; }
                        WEIGHT_EI = readerData["weight_ei"].ToString();
                        try { PRICE = Convert.ToDouble(readerData["price"].ToString()); } catch { PRICE = 0; }
                        NOTE = readerData["note"].ToString();
                        CATEGORY = readerData["category"].ToString();
                        AllowFilters = readerData["allowfilters"].ToString();
                        items = readerData["items"].ToString();
                        try { have_img = Convert.ToInt16(readerData["have_img"].ToString()); } catch { have_img = 0; }
                        try { onFirstPage = readerData["onFirstPage"].ToString().ToUpper()=="TRUE"?1:0; } catch { onFirstPage = 0; }
                        try { WaitIn = readerData["WaitIn"].ToString().ToUpper() == "TRUE" ? 1 : 0; } catch { WaitIn = 0; }
                        Produce = readerData["Produce"].ToString();
                        Balance = (int)readerData["Balance"];

                        SqlCommand comF = new SqlCommand("SELECT items FROM ShopFilters where '" + AllowFilters + "' like '%'+name_filter+'%'", MyConnection);
                        try
                        {
                            MyConnection.Open();
                            SqlDataReader rData = com.ExecuteReader(CommandBehavior.CloseConnection);
                            while (rData.Read())
                            {
                                string fitems = readerData["items"].ToString();
                                if (fitems.Trim() != "")
                                {
                                    iFilters += @"<img src=""./../photoDB.ashx?type_img=image_lowCA&items=" + fitems + @"&w=30&h=30"" class=""img-responsive"" />" + '\n' + '\r';
                                }

                            }
                        }
                        catch { }

                    }
                    MyConnection.Close();
                }
                catch
                { }
            }

        }
    }
}