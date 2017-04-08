using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dotnetdemos_codeView : System.Web.UI.Page
{
    public string Code { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var src = Request.QueryString["src"];
        if (string.IsNullOrEmpty(src)) return;
         
        src = Server.MapPath("~/" + src);

        Code = System.IO.File.ReadAllText(src); 
    }
}