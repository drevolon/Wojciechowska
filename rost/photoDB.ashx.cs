using rost.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;

namespace shop_health
{
    /// <summary>
    /// Сводное описание для photoDB
    /// </summary>
    public class photoDB : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String id = context.Request.Params["id"];

            String type_img = context.Request.Params["type_img"];
            String items = context.Request.Params["items"];

            int w = Convert.ToInt16(context.Request.Params["w"]);
            int h = Convert.ToInt16(context.Request.Params["h"]);

            Images objImages = new Images();

            switch (type_img)
            {
                case "news":
                    {
                        try
                        {
                            SqlDataReader sqlNews = objImages.ImagesSelectItems(items);
                            sqlNews.Read();

                            int objectImg_size = 0;
                            try
                            {
                                objectImg_size = Convert.ToInt32(sqlNews["size_images"]);
                            }
                            catch
                            {

                            }
                            if (objectImg_size != 0)
                            {
                                String name = sqlNews["name_images"].ToString();
                                int img_size = Convert.ToInt32(sqlNews["size_images"].ToString());
                                String rnd = name;
                                context.Response.AddHeader("Content-Disposition", "attachment;filename=" + rnd);
                                context.Response.ContentType = "image/jpeg";
                                context.Response.OutputStream.Write((byte[])sqlNews["images"], 0, img_size);
                                context.Response.End();
                            }
                            else
                            {
                                //ВЫВОД МАЛЕНЬКОГО ИЗОБРАЖЕНИЯ
                                context.Response.Redirect("images/point.gif");
                            }

                            sqlNews.Close();
                        }
                        catch
                        {

                        }
                        finally
                        {

                        }

                        break;
                    }
                case "image_lowCA":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItemsCA(items);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            double dsize = 0;
                            //ВЫВОД МАЛЕНЬКОГО ИЗОБРАЖЕНИЯ
                            byte[] imageData = (byte[])sqlImages["images"];

                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);
                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);

                            int height = oImage.Height;
                            int width = oImage.Width;

                            //                            dsize = Math.Max(height / h , width / w);
                            if (height / h <= width / w)
                            {
                                dsize = ((double)width / w);
                            }
                            else
                            { dsize = ((double)height / h); };

                            //                            Bitmap imgOutput = new Bitmap(width / dsize, height / dsize);
                            Bitmap imgOutput = new Bitmap(w, h);

                            Graphics newGraphics = Graphics.FromImage(imgOutput);

                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;
                            int newWidth = (int)Math.Round(width / dsize);
                            int newHeight = (int)Math.Round(height / dsize);

                            int posWidth = 0;
                            int posHeight = 0;

                            // зАКРАСИМ БЕЛЫМ
                            SolidBrush whiteBrush = new SolidBrush(Color.Transparent);
                            newGraphics.FillRectangle(whiteBrush,0,0,w,h);

                            if (newWidth < w) posWidth = (w - newWidth) / 2;
                            if (newHeight < h) posHeight = (h - newHeight) / 2;

                            newGraphics.DrawImage(oImage, posWidth, posHeight,newWidth,newHeight);

                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Png);
                            //imgOutput.Save("c:\\temp\\img_"+w.ToString()+"_"+h.ToString()+"_"+ newWidth.ToString()+"_"+newHeight.ToString()+"_"+width.ToString()+"_"+height.ToString()+"_"+dsize.ToString()+"_"+Guid.NewGuid().ToString()+".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);

                            imgOutput.Dispose();
                            newGraphics.Dispose();
                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }
                        sqlImages.Close();
                        break;
                    }
                case "image_bigCA":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItemsCA(items);
                        sqlImages.Read();
                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            String name = sqlImages["name_images"].ToString();
                            int img_size = Convert.ToInt32(sqlImages["size_images"].ToString());
                            String rnd = name;
                            context.Response.AddHeader("Content-Disposition", "attachment;filename=" + rnd);
                            context.Response.ContentType = "image/jpeg";
                            context.Response.OutputStream.Write((byte[])sqlImages["images"], 0, img_size);
                            context.Response.End();
                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }
                        sqlImages.Close();

                        break;
                    }
                case "news_id":
                    {
                        try
                        {
                            SqlDataReader sqlImages = objImages.ImagesSelectId_images(Convert.ToInt16(id));
                            sqlImages.Read();

                            int objectImg_size = 0;
                            try
                            {
                                objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                            }
                            catch
                            {
                                sqlImages.Close();
                            }
                            if (objectImg_size != 0)
                            {
                                String name = sqlImages["name_images"].ToString();
                                int img_size = Convert.ToInt32(sqlImages["size_images"].ToString());
                                String rnd = name;
                                context.Response.AddHeader("Content-Disposition", "attachment;filename=" + rnd);
                                context.Response.ContentType = "image/jpeg";
                                context.Response.OutputStream.Write((byte[])sqlImages["images"], 0, img_size);
                                context.Response.End();
                            }
                            else
                            {
                                //ВЫВОД МАЛЕНЬКОГО ИЗОБРАЖЕНИЯ
                                context.Response.Redirect("images/point.gif");
                            }

                            sqlImages.Close();
                        }
                        catch
                        {

                        }
                        finally
                        {

                        }

                        break;
                    }

                case "image_low":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItems(items);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            int dsize = 0;
                            //ВЫВОД МАЛЕНЬКОГО ИЗОБРАЖЕНИЯ
                            byte[] imageData = (byte[])sqlImages["images"];

                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);
                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);

                            int height = oImage.Height;
                            int width = oImage.Width;

                            if (height >= width) { dsize = oImage.Width / w; } else { dsize = oImage.Height / h; };

                            Bitmap imgOutput = new Bitmap(width / dsize, height / dsize);
                            Graphics newGraphics = Graphics.FromImage(imgOutput);
                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;

                            newGraphics.DrawImage(oImage, 0, 0, width / dsize, height / dsize);
                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                            imgOutput.Dispose();
                            newGraphics.Dispose();
                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }
                        sqlImages.Close();
                        break;
                    }

                case "image_low_id":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectId_images(Convert.ToInt16(id));
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            int dsize = 0;
                            //ВЫВОД МАЛЕНЬКОГО ИЗОБРАЖЕНИЯ
                            byte[] imageData = (byte[])sqlImages["images"];

                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);
                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);

                            int height = oImage.Height;
                            int width = oImage.Width;

                            if (height >= width) { dsize = oImage.Width / w; } else { dsize = oImage.Height / h; };

                            Bitmap imgOutput = new Bitmap(width / dsize, height / dsize);
                            Graphics newGraphics = Graphics.FromImage(imgOutput);
                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;

                            newGraphics.DrawImage(oImage, 0, 0, width / dsize, height / dsize);
                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                            imgOutput.Dispose();
                            newGraphics.Dispose();
                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }
                        sqlImages.Close();
                        break;
                    }

                case "image_big":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItems(items);
                        sqlImages.Read();
                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            String name = sqlImages["name_images"].ToString();
                            int img_size = Convert.ToInt32(sqlImages["size_images"].ToString());
                            String rnd = name;
                            context.Response.AddHeader("Content-Disposition", "attachment;filename=" + rnd);
                            context.Response.ContentType = "image/jpeg";
                            context.Response.OutputStream.Write((byte[])sqlImages["images"], 0, img_size);
                            context.Response.End();
                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }
                        sqlImages.Close();

                        break;
                    }

                case "from_disk_low":
                    {
                        SqlDataReader sqlImages = objImages.ImagesSelectItems(items);
                        sqlImages.Read();

                        int objectImg_size = 0;
                        try
                        {
                            objectImg_size = Convert.ToInt32(sqlImages["size_images"]);
                        }
                        catch
                        {

                        }
                        if (objectImg_size != 0)
                        {
                            //ВЫВОД МАЛЕНЬКОГО ИЗОБРАЖЕНИЯ
                            byte[] imageData = (byte[])sqlImages["images"];
                            Bitmap imgOutput = new Bitmap(w, h);
                            Graphics newGraphics = Graphics.FromImage(imgOutput);
                            newGraphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                            newGraphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Low;
                            System.IO.MemoryStream MS = new System.IO.MemoryStream(imageData);
                            System.Drawing.Image oImage = System.Drawing.Image.FromStream(MS);
                            newGraphics.DrawImage(oImage, 0, 0, w, h);
                            imgOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                            imgOutput.Dispose();
                            newGraphics.Dispose();
                        }
                        else
                        {
                            //context.Response.Redirect("images/no_prikols.gif");
                        }
                        sqlImages.Close();
                        break;
                    }
            }
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}