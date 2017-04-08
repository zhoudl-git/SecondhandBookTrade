using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
public partial class dotnetdemos_grid_treegrid_treeDelay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["Action"] == "GetData")
        {
            GetData();
            Response.End();
        }
        if (Request.Params["Action"] == "GetChildrenData")
        {
            GetChildrenData();
            Response.End();
        }
    }
    void GetChildrenData()
    {
        string pid = Request.Params["pid"];
        IList<object> list = new List<object>();
        for (var i = 0; i < 5; i++)
        {
            list.Add(new
            {
                id = i,
                name = "部门" + pid + "-" + i,
                date = DateTime.Now,
                remark = "部门" + pid + "-" + i + " 备注" 
            });
        }
        var griddata = new { Rows = list };
        string s = new JavaScriptSerializer().Serialize(griddata);
        Response.Write(s);
    }
    void GetData()
    {
        IList<object> list = new List<object>();
        for (var i = 0; i < 5; i++)
        {
            list.Add(new
            {
                id = i,
                name = "部门" + i,
                date = DateTime.Now,
                remark = "部门" + i + " 备注",
                children = new object[] {}
            });
        } 
        var griddata = new { Rows = list };
        string s = new JavaScriptSerializer().Serialize(griddata);
        Response.Write(s);
    }
}