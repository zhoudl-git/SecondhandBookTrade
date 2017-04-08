using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
public partial class dotnetdemos_grid_treegrid_tree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["Action"] == "GetData")
        {
            GetData();
            Response.End();
        }
    }

    void GetData()
    {
        IList<object> list = new List<object>();
        for (var i = 0; i < 5; i++)
        {
            list.Add(new
            {
                id = i, 
                pid = -1,
                name = "部门" + i,
                date = DateTime.Now,
                remark = "部门" + i + " 备注" 
            });
        }

        for (var i = 5; i < 10; i++)
        {
            list.Add(new
            {
                id = i,
                pid = 1,
                name = "部门1-" + i,
                date = DateTime.Now 
            });
        } 

        var griddata = new { Rows = list };
        string s = new JavaScriptSerializer().Serialize(griddata);
        Response.Write(s);
    }
}