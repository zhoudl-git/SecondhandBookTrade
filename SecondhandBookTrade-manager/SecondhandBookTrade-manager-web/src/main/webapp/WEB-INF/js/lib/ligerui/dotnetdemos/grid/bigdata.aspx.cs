using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Linq;
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
        var total = 10000;
        for (var i = 0; i < total; i++)
        {
            list.Add(new Node()
            {
                id = i,
                name = "部门" + i,
                remark = "部门" + i + " 备注"
            });
        }
        if (sortorder == "desc")
            list = list.OrderByDescending(c => c.id).ToList(); 
        else
            list = list.OrderBy(c => c.id).ToList();

        if (Request.Params["page"] != null)
        {
            int page = Convert.ToInt32(Request.Params["page"]);
            int pagesize = Convert.ToInt32(Request.Params["pagesize"]);
            IList<Node> targetList = new List<Node>();
            for (var i = 0; i < total; i++)
            {
                if (i >= (page - 1) * pagesize && i < page * pagesize)
                {
                    targetList.Add(list[i]);
                }
            }
            var griddata = new { Rows = targetList, Total = total };
            string s = new JavaScriptSerializer().Serialize(griddata);
            Response.Write(s);
        }
        else
        {
            var griddata = new { Rows = list, Total = total };
            string s = new JavaScriptSerializer().Serialize(griddata);
            Response.Write(s);
        }
    }
}