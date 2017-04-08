<%@ WebHandler Language="C#" Class="ComboBoxData" %>

using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class ComboBoxData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        var key = context.Request["key"];

        context.Response.Write(new JavaScriptSerializer().Serialize(MakeData(key)));
    }
    public class Node
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; } 
    }
    static string str1 = "abcdefghijklmnopqrstuvwxyz";
    static string str2 = "chijkbmnostuvlpqrzadefgwxy"; 
    public object MakeData(string key)
    {
        var list = new List<Node>();
        for (var i = 0; i <= 300; i++)
        {
            var r1 = str1.Substring(i % str1.Length, 1);
            var r2 = str2.Substring(i % str2.Length, 1); 
            
            list.Add(new Node
            {
                name = r1 + i + r2 + "name",
                desc = i + "desc",
                id = i 
            });
        }
        if (!string.IsNullOrEmpty(key))
        {
            list = list.Where(c => c.name.Contains(key)).ToList();
        }
        
        return list;
    }

    public bool IsReusable
    {
        get {
            return false;
        }
    }

}