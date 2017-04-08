<%@ WebHandler Language="C#" Class="treeDeptData" %>

using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Web.Script.Serialization;
public class treeDeptData : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var type = context.Request["type"];
        var prev = context.Request["prev"] ?? "";
        var obj = GetData(type, prev);
        if (prev.IndexOf('1') > -1)
            System.Threading.Thread.Sleep(200);
        context.Response.Write(new JavaScriptSerializer().Serialize(obj));
    }

    static Dictionary<string, int> data = new Dictionary<string, int>()
    {
        //8个公司
        {"company",10},
         //10个部门 
        {"deptment",10},
         //每个部门有20个员工
        {"employee", 20}
    };
    
    public object GetData(string type,string prev)
    {
        if (!data.ContainsKey(type)) return null;
        var d = data[type];
        var arr = new List<object>() { };
        for (var i = 1; i <= d; i++)
        {
            var o = new Dictionary<string, object>();
            o["text"] = type + prev + i;
            o["id"] = prev + i;
            o["type"] = type;
            arr.Add(o);
        }
        return arr;
    }
     
    public bool IsReusable {
        get {
            return false;
        }
    }

}