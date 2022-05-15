using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace rost.App_Code
{
    public class Images
    {
        public Images()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void ImagesInsert
            (
                String items,
                int id_pages,
                byte[] images,
                String name_images,
                String type_images,
                int size_images,
                String alt_images
            )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"]; 

             SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesInsert", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            SqlParameter parameterid_pages = new SqlParameter("@id_pages", SqlDbType.Int);
            parameterid_pages.Value = id_pages;
            myCommand.Parameters.Add(parameterid_pages);

            SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
            parameterimages.Value = images;
            myCommand.Parameters.Add(parameterimages);

            SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
            parametername_images.Value = name_images;
            myCommand.Parameters.Add(parametername_images);

            SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
            parametertype_images.Value = type_images;
            myCommand.Parameters.Add(parametertype_images);

            SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
            parametersize_images.Value = size_images;
            myCommand.Parameters.Add(parametersize_images);

            SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
            parameteralt_images.Value = alt_images;
            myCommand.Parameters.Add(parameteralt_images);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public void ImagesAddGallery
          (
              String items,
              int id_pages,
              byte[] images,
              String name_images,
              String type_images,
              int size_images,
              String alt_images
          )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesAddGallery", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            SqlParameter parameterid_pages = new SqlParameter("@id_pages", SqlDbType.Int);
            parameterid_pages.Value = id_pages;
            myCommand.Parameters.Add(parameterid_pages);

            SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
            parameterimages.Value = images;
            myCommand.Parameters.Add(parameterimages);

            SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
            parametername_images.Value = name_images;
            myCommand.Parameters.Add(parametername_images);

            SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
            parametertype_images.Value = type_images;
            myCommand.Parameters.Add(parametertype_images);

            SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
            parametersize_images.Value = size_images;
            myCommand.Parameters.Add(parametersize_images);

            SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
            parameteralt_images.Value = alt_images;
            myCommand.Parameters.Add(parameteralt_images);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public SqlDataReader ImagesSelect(int id_pages)
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesSelect", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterid_pages = new SqlParameter("@id_pages", SqlDbType.Int);
            parameterid_pages.Value = id_pages;
            myCommand.Parameters.Add(parameterid_pages);

            myConnection.Open();

            return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ImagesSelectId_images(int id_images)
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesSelect", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterid_images = new SqlParameter("@id_images", SqlDbType.Int);
            parameterid_images.Value = id_images;
            myCommand.Parameters.Add(parameterid_images);

            myConnection.Open();

            return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ImagesSelectItems(String items)
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesSelectItems", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            myConnection.Open();

            return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        public SqlDataReader ImagesSelectItemsCA(String items)
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesSelectItems", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            myConnection.Open();

            return myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }

        public void ImagesUpdate
         (
             String items,
             int id_pages,
             byte[] images,
             String name_images,
             String type_images,
             int size_images,
             String alt_images
         )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("ImagesUpdate", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            SqlParameter parameterid_pages = new SqlParameter("@id_pages", SqlDbType.Int);
            parameterid_pages.Value = id_pages;
            myCommand.Parameters.Add(parameterid_pages);

            SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
            parameterimages.Value = images;
            myCommand.Parameters.Add(parameterimages);

            SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
            parametername_images.Value = name_images;
            myCommand.Parameters.Add(parametername_images);

            SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
            parametertype_images.Value = type_images;
            myCommand.Parameters.Add(parametertype_images);

            SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
            parametersize_images.Value = size_images;
            myCommand.Parameters.Add(parametersize_images);

            SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
            parameteralt_images.Value = alt_images;
            myCommand.Parameters.Add(parameteralt_images);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public void ImagesUpdate2
         (


             String items,
             int id_pages,
             byte[] images,
             String name_images,
             String type_images,
             int size_images,
             String alt_images

         )
        {
            string str = @"
            declare @find_file_size int
            set @find_file_size=(Select size_images from Images where items=@items)

            if (@find_file_size!=0 OR @find_file_size is not null)
            BEGIN

	            Update Images set

		            images=@images,
		            name_images=@name_images,
		            type_images=@type_images,
		            size_images=@size_images,
		            alt_images=@alt_images

	            where items=@items

            END

            ELSE

            BEGIN

	            insert into Images
	            (
		            items,
		            id_pages,
		            images,
		            name_images,
		            type_images,
		            size_images,
		            alt_images
	            )
	            values
	            (
		            @items,
		            @id_pages,
		            @images,
		            @name_images,
		            @type_images,
		            @size_images,
		            @alt_images
	            )
	
	

            END

            ";

            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand(str, myConnection);

            myCommand.CommandType = CommandType.Text;


            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            SqlParameter parameterid_pages = new SqlParameter("@id_pages", SqlDbType.Int);
            parameterid_pages.Value = id_pages;
            myCommand.Parameters.Add(parameterid_pages);

            SqlParameter parameterimages = new SqlParameter("@images", SqlDbType.Image);
            parameterimages.Value = images;
            myCommand.Parameters.Add(parameterimages);

            SqlParameter parametername_images = new SqlParameter("@name_images", SqlDbType.NVarChar, 50);
            parametername_images.Value = name_images;
            myCommand.Parameters.Add(parametername_images);

            SqlParameter parametertype_images = new SqlParameter("@type_images", SqlDbType.NVarChar, 30);
            parametertype_images.Value = type_images;
            myCommand.Parameters.Add(parametertype_images);

            SqlParameter parametersize_images = new SqlParameter("@size_images", SqlDbType.Int);
            parametersize_images.Value = size_images;
            myCommand.Parameters.Add(parametersize_images);

            SqlParameter parameteralt_images = new SqlParameter("@alt_images", SqlDbType.NVarChar, 50);
            parameteralt_images.Value = alt_images;
            myCommand.Parameters.Add(parameteralt_images);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
    }
}