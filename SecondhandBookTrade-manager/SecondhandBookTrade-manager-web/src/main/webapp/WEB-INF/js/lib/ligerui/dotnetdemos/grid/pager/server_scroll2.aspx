<%@ Page Language="C#" AutoEventWireup="true"  %>
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
                { display: '部门名', name: 'name', width: 250, align: 'left', frozen: true },
                { display: '部门标示', name: 'id', width: 250, type: 'int', align: 'left' },
                { display: '部门描述', name: 'remark', width: 250, align: 'left' },

                { display: '部门标示', name: 'id', width: 250, type: 'int', align: 'left' },
                { display: '部门描述', name: 'remark', width: 250, align: 'left' },

                { display: '部门标示', name: 'id', width: 250, type: 'int', align: 'left' },
                { display: '部门描述', name: 'remark', width: 250, align: 'left' }
                ], width: '100%', pageSizeOptions: [5, 10, 15, 20], height: '97%',
                url: 'server.aspx?Action=GetData',
                dataAction: 'server', //服务器排序
                usePager: true,       //服务器分页
                pageSize: 50,
                scroll: true,
                frozen:true,
                alternatingRow: false,
                scrollToPage: true,
                scrollToAppend: true,
                pagerRender: function ()
                {
                   
                    var html = [];
                    html.push('<div style="line-height:32px;padding-right:10px;float:right;">');
                    if (this.get('newPage') == this.get('pageCount'))
                    {
                        html.push('<span>总共：' + this.get('pageCount') + '页</span> ');
                    } else
                    {
                        html.push('<span>已加载：' + this.get('newPage') + '页</span> ');
                        html.push('<span>,</span> ');
                        html.push('<span>总共：' + this.get('pageCount') + '页</span> ');
                   
                    } html.push('</div>');
                    return html.join('');
                },
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
   

   <div class="l-clear"></div>
 
</div>

    <div id="maingrid"></div>  
</body>
</html>