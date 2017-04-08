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
        for (var i = 0; i < 100; i++)
        {
            list.Add(new
            {
                id = i,
                name = "部门" + i,
                remark = "部门" + i + " 备注"
            });
        } 
        var griddata = new { Rows = list };
        string s = new JavaScriptSerializer().Serialize(griddata);
        Response.Write(s);
    }
}