using System;
using System.Linq;
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
    class Node
    {
        public int id { get; set; }
        public string name { get; set; }
        public string remark { get; set; }
    }
    void GetData()
    {
        string sortname = Request.Params["sortname"];
        string sortorder = Request.Params["sortorder"];
        
        IList<Node> list = new List<Node>();
        for (var i = 0; i < 100; i++)
        {
            list.Add(new Node()
            {
                id = i,
                name = "部门" + i,
                remark = "部门" + i + " 备注"
            });
        }
        if (sortorder == "asc")
            list = list.OrderBy(c => c.id).ToList();
        else
            list = list.OrderByDescending(c => c.id).ToList();

        var griddata = new { Rows = list };
        string s = new JavaScriptSerializer().Serialize(griddata);
        Response.Write(s);
    }
}