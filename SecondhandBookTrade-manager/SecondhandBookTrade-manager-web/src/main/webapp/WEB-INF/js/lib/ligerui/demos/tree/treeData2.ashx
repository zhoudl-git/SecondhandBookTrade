<%@ WebHandler Language="C#" Class="treeData" %>

using System;
using System.Web;

public class treeData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(@"[
    { ""text"": ""节点1""}
]");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}