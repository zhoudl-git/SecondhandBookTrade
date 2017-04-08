<%@ WebHandler Language="C#" Class="treeData" %>

using System;
using System.Web;

public class treeData : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(@"[
    { text: '节点1',id:'1', children: [
        { text: '节点1.1',id:'2' },
        { text: '节点1.2' },
        { text: '节点1.3', children: [
                { text: '节点1.3.1' ,children: [
					{ text: '节点1.3.1.1' },
					{ text: '节点1.3.1.2' }]
				},
                { text: '节点1.3.2' }
        ]
        },
        { text: '节点1.4' }
        ]
    },
    { text: '节点2' },
    { text: '节点3' },
    { text: '节点4' }
]");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}