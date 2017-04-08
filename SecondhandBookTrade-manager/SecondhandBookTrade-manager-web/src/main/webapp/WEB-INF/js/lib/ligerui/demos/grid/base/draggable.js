(function ($)
{
    window['gridDraggable'] = function (leftGrid, rightGrid)
    {
        var g = leftGrid, p = leftGrid.options;
        g.rowDroptip = $("<div class='l-drag-rowdroptip' style='display:none'></div>").appendTo('body');
        g.gridbody.add(g.f.gridbody).ligerDrag({ revert: true, animate: false,
            proxyX: 0, proxyY: 0,
            proxy: function (draggable, e)
            {
                var src = g._getSrcElementByEvent(e);
                if (src.row)
                {
                    var content = p.draggingMessage.replace(/{count}/, draggable.draggingRows ? draggable.draggingRows.length : 1);
                    if (p.rowDraggingRender)
                    {
                        content = p.rowDraggingRender(draggable.draggingRows, draggable, g);
                    }
                    var proxy = $("<div class='l-drag-proxy' style='display:none'><div class='l-drop-icon l-drop-no'></div>" + content + "</div>").appendTo('body');
                    return proxy;
                }
            },
            onRevert: function () { return false; },
            onRendered: function ()
            {
                this.set('cursor', 'default');
                g.children[this.id] = this;
            },
            onStartDrag: function (current, e)
            {
                if (e.button == 2) return false;
                if (g.colresizing) return false;
                if (!g.columns.length) return false;
                this.set('cursor', 'default');
                var src = g._getSrcElementByEvent(e);
                if (!src.cell || !src.data || src.checkbox) return false;
                var ids = src.cell.id.split('|');
                var column = g._columns[ids[ids.length - 1]];
                if (src.rownumberscell || src.detailcell || src.checkboxcell || column == g.columns[0])
                {
                    if (g.enabledCheckbox())
                    {
                        this.draggingRows = g.getSelecteds();
                        if (!this.draggingRows || !this.draggingRows.length) return false;
                    }
                    else
                    {
                        this.draggingRows = [src.data];
                    } 
                    this.draggingRow = src.data;
                    g.rowDropIn = -1;
                    this.set('cursor', 'move');
                    g.rowdragging = true;
                    this.validRange = {
                        top: rightGrid.gridbody.offset().top,
                        bottom: rightGrid.gridbody.offset().top + rightGrid.gridbody.height() + 20,
                        left: rightGrid.grid.offset().left - 10,
                        right: rightGrid.grid.offset().left + rightGrid.grid.width() + 10
                    };
                }
                else
                {
                    return false;
                }
            },
            onDrag: function (current, e)
            {
                var rowdata = this.draggingRow;
                if (!rowdata) return false;
                var rows = this.draggingRows ? this.draggingRows : [rowdata];
                if (g.colresizing) return false;
                if (g.rowDropIn == null) g.rowDropIn = -1;
                var pageX = e.pageX;
                var pageY = e.pageY;
                var visit = false;
                var validRange = this.validRange;
                if (pageX < validRange.left || pageX > validRange.right
                            || pageY > validRange.bottom || pageY < validRange.top)
                {
                    g.rowDropIn = -1;
                    g.rowDroptip.hide();
                    this.proxy.find(".l-drop-icon:first").removeClass("l-drop-yes l-drop-add").addClass("l-drop-no");
                    return;
                }
                for (var i in rightGrid.rows)
                {
                    var rd = rightGrid.rows[i];
                    var rowid = rd['__id'];
                    if (rowdata == rd) visit = true;
                    if ($.inArray(rd, rows) != -1) continue;
                    var isAfter = visit ? true : false;
                    if (g.rowDropIn != -1 && g.rowDropIn != rowid) continue;
                    var rowobj = rightGrid.getRowObj(rowid);
                    var offset = $(rowobj).offset();
                    var range = {
                        top: offset.top - 4,
                        bottom: offset.top + $(rowobj).height() + 4,
                        left: rightGrid.grid.offset().left,
                        right: rightGrid.grid.offset().left + rightGrid.grid.width()
                    };
                    if (pageX > range.left && pageX < range.right && pageY > range.top && pageY < range.bottom)
                    {
                        var lineTop = offset.top;
                        if (isAfter) lineTop += $(rowobj).height();
                        g.rowDroptip.css({
                            left: range.left,
                            top: lineTop,
                            width: range.right - range.left
                        }).show();
                        g.rowDropIn = rowid;
                        g.rowDropDir = isAfter ? "bottom" : "top";
                        if (p.tree && pageY > range.top + 5 && pageY < range.bottom - 5)
                        {
                            this.proxy.find(".l-drop-icon:first").removeClass("l-drop-no l-drop-yes").addClass("l-drop-add");
                            g.rowDroptip.hide();
                            g.rowDropInParent = true;
                        }
                        else
                        {
                            this.proxy.find(".l-drop-icon:first").removeClass("l-drop-no l-drop-add").addClass("l-drop-yes");
                            g.rowDroptip.show();
                            g.rowDropInParent = false;
                        }
                        return;
                    }
                    else if (g.rowDropIn != -1)
                    {
                        g.rowDropIn = -1;
                        g.rowDropInParent = false;
                        g.rowDroptip.hide();
                        this.proxy.find(".l-drop-icon:first").removeClass("l-drop-yes  l-drop-add").addClass("l-drop-no");
                    }
                }

                g.rowDropIn = null;
                g.rowDropInParent = true;
                g.rowDroptip.hide();
                this.proxy.find(".l-drop-icon:first").removeClass("l-drop-no l-drop-add").addClass("l-drop-yes");
            },
            onStopDrag: function (current, e)
            {
                var rows = this.draggingRows;
                for (var i = 0; i < rows.length; i++)
                {
                    var children = rows[i].children;
                    if (children)
                    {
                        rows = $.grep(rows, function (node, i)
                        {
                            var isIn = $.inArray(node, children) == -1;
                            return isIn;
                        });
                    }
                }
                function formatRecord(rows)
                {
                    $.each(rows, function ()
                    {
                        g.formatRecord(this);
                        if (this.children)
                            formatRecord(this.children);
                    });
                }
                g.rowDroptip.hide();
                g.rowdragging = false;
                if (g.rowDropIn != -1)
                {
                    var newrows = [];
                    $.each(rows, function ()
                    {
                        var newrow = $.extend(true, {}, this);
                        newrows.push(newrow);
                    });
                    formatRecord(newrows);
                    g.removeRange(rows);
                    if (p.tree)
                    {
                        var neardata, prow;
                        if (g.rowDropInParent)
                        {
                            prow = rightGrid.getRow(g.rowDropIn);
                        }
                        else
                        {
                            neardata = rightGrid.getRow(g.rowDropIn);
                            prow = rightGrid.getParent(neardata);
                        }
                        rightGrid.appendRange(newrows, prow, neardata, g.rowDropDir != "bottom");
                        rightGrid.trigger('rowDragDrop', {
                            rows: newrows,
                            parent: prow,
                            near: neardata,
                            after: g.rowDropDir == "bottom"
                        });
                    }
                    else
                    {
                        rightGrid.moveRange(newrows, g.rowDropIn, g.rowDropDir == "bottom");
                        rightGrid.trigger('rowDragDrop', {
                            rows: rows,
                            parent: prow,
                            near: rightGrid.getRow(g.rowDropIn),
                            after: g.rowDropDir == "bottom"
                        });
                    } 
                }
                g.rowDroptip.hide();
                this.set('cursor', 'default');
            }
        });
    }

})(jQuery)