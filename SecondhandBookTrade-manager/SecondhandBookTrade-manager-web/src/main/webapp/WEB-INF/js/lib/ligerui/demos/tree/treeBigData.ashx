<%@ WebHandler Language="C#" Class="treeBigData" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Web.Script.Serialization;
public class treeBigData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        
        var arr = new List<object>(){}; 
        for (var num = 1; num <= 100; num++)
        {
            var  d = new Dictionary<string,object>();
            d["text"] = "Node" + num;
            d["id"] = num;
            d["isexpand"] = false;
            d["delayExpand"] = true;
            d["children"] = CreateChildren(num.ToString() + "-", 10, true);
            arr.Add(d);
        } 
        context.Response.Write(new JavaScriptSerializer().Serialize(arr));
    }
    public object CreateChildren(string prev, int number, bool includeChildren = false)
    {
        var arr = new List<object>() { };

        for (var i = 1; i <= number; i++)
        {
            var d = new Dictionary<string, object>();
            d["text"] = "Node" + prev + i;
            d["id"] = prev + number.ToString(); 
            if (includeChildren)
            {
                d["isexpand"] = false;
                d["delayExpand"] = true;
                d["children"] = CreateChildren(prev + i + "-", 20, false);
            }
            arr.Add(d);
        }

        return arr;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}