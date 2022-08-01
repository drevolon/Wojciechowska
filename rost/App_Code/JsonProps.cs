using System.Collections.Generic;

namespace rost.App_Code
{

    public class JsonProps
    {
        public List<JProp> Property { get; set; }
        public JsonProps()
        {
            Property = new List<JProp>();
        }
    }

    public class JProp
    {
        public string name { get; set; }
        public string value { get; set; }
    }


    public class JsonImages
    {
        public List<JImg> Images { get; set; }
        public JsonImages()
        {
            Images = new List<JImg>();
        }
    }

    public class JImg
    {
        public string items { get; set; }
    }


}