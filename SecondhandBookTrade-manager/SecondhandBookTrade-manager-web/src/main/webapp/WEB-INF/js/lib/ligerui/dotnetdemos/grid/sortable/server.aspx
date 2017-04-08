<%@ Page Language="C#" AutoEventWireup="true" CodeFile="server.aspx.cs" Inherits="dotnetdemos_grid_treegrid_tree" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
 
    <script src="../../../lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>  

    <script type="text/javascript">
        var manager;
        $(function ()
        {
            window['g'] = 
            manager = $("#maingrid").ligerGrid({
                columns: [
                { display: '部门名', name: 'name', width: 250, align: 'left',isSort:false },
                { display: '部门标示', name: 'id', width: 250, type: 'int', align: 'left' },
                { display: '部门描述', name: 'remark', width: 250, align: 'left', isSort: false }
                ], width: '100%', pageSizeOptions: [5, 10, 15, 20], height: '97%',
                url: 'server.aspx?Action=GetData',
                dataAction: 'server',//服务器排序
                usePager:false,
                alternatingRow: false, 
                tree: { columnName: 'name' }
            }
            );
        });


        function getSelected()
        {
            var row = manager.getSelectedRow();
            if (!row) { alert('请选择行'); return; }
            alert(JSON.stringify(row));
        } 
        
    </script>
</head>
<body  style="padding:4px"> 
<div>  
  
   <a class="l-button" style="width:120px;float:left; margin-left:10px;" onclick="getSelected()">获取值</a>

   <div class="l-clear"></div>
 
</div>

    <div id="maingrid"></div>  
</body>
</html>