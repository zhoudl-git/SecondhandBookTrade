<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codeView.aspx.cs" Inherits="dotnetdemos_codeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title> 
    <script src="../lib/syntaxhighlighter/scripts/shCore.js"></script>
    <script src="../lib/syntaxhighlighter/scripts/shBrushJScript.js"></script>
    <link href="../lib/syntaxhighlighter/styles/shCoreDefault.css" rel="stylesheet" />
    <script type="text/javascript">SyntaxHighlighter.all();</script>
    <script src="../lib/syntaxhighlighter/scripts/shBrushCss.js"></script>
    <script src="../lib/syntaxhighlighter/scripts/shBrushXml.js"></script>
    <style type="text/css">
        #form1 div {
            overflow: hidden !important;
        }
        *, #form1,#precode {
            margin: 0;
            padding: 0;
        }
            #form1 .toolbar {
                display:none !important;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="height:100%; overflow:auto;">
  
             <pre id="precode" class="brush: js;" style=" overflow:hidden;">
        <%=Code %>
        </pre>

             
    </form> 
</body>
</html>

