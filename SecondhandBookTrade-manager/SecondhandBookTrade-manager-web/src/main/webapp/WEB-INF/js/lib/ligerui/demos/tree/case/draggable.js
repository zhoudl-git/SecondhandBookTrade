(function ($)
{
    window['treeDraggable'] = function (leftTree, rightTree)
    {
        var g = leftTree, p = leftTree.options;
        g.nodeDroptip = $("<div class='l-drag-nodedroptip' style='display:none'></div>").appendTo('body');
        g.tree.ligerDrag({ revert: true, animate: false,
            proxyX: 20, proxyY: 20,
            proxy: function (draggable, e)
            {
                var src = g._getSrcElementByEvent(e);
                if (src.node)
                {
                    var content = "dragging";
                    if (p.nodeDraggingRender)
                    {
                        content = p.nodeDraggingRender(draggable.draggingNodes, draggable, g);
                    }
                    else
                    {
                        content = "";
                        var appended = false;
                        for (var i in draggable.draggingNodes)
                        {
                            var node = draggable.draggingNodes[i];
                            if (appended) content += ",";
                            content += node.text;
                            appended = true;
                        }
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
                this.set('cursor', 'default');
                var src = g._getSrcElementByEvent(e);
                if (src.checkbox) return false;
                if (p.checkbox)
                {
                    var checked = g.getChecked();
                    this.draggingNodes = [];
                    for (var i in checked)
                    {
                        this.draggingNodes.push(checked[i].data);
                    }
                    if (!this.draggingNodes || !this.draggingNodes.length) return false;
                }
                else
                {
                    this.draggingNodes = [src.data];
                }
                this.draggingNode = src.data;
                this.set('cursor', 'move');
                g.nodedragging = true;
                this.validRange = {
                    top: rightTree.tree.offset().top,
                    bottom: rightTree.tree.offset().top + rightTree.tree.height() + 20,
                    left: rightTree.tree.offset().left,
                    right: rightTree.tree.offset().left + rightTree.tree.width()
                };
            },
            onDrag: function (current, e)
            {
                var nodedata = this.draggingNode;
                if (!nodedata) return false;
                var nodes = this.draggingNodes ? this.draggingNodes : [nodedata];
                if (g.nodeDropIn == null) g.nodeDropIn = -1;
                var pageX = e.pageX;
                var pageY = e.pageY;
                var visit = false;
                var validRange = this.validRange;
                if (pageX < validRange.left || pageX > validRange.right
                            || pageY > validRange.bottom || pageY < validRange.top)
                {
                    g.nodeDropIn = -1;
                    g.nodeDroptip.hide();
                    this.proxy.find(".l-drop-icon:first").removeClass("l-drop-yes l-drop-add").addClass("l-drop-no");
                    return;
                }
                for (var i = 0, l = rightTree.nodes.length; i < l; i++)
                {
                    var nd = rightTree.nodes[i];
                    var treedataindex = nd['treedataindex'];
                    if (nodedata['treedataindex'] == treedataindex) visit = true;
                    var isAfter = visit ? true : false;
                    if (g.nodeDropIn != -1 && g.nodeDropIn != treedataindex) continue;
                    var jnode = $("li[treedataindex=" + treedataindex + "] div:first", rightTree.tree);
                    var offset = jnode.offset();
                    var range = {
                        top: offset.top,
                        bottom: offset.top + jnode.height(),
                        left: rightTree.tree.offset().left,
                        right: rightTree.tree.offset().left + rightTree.tree.width()
                    };
                    if (pageX > range.left && pageX < range.right && pageY > range.top && pageY < range.bottom)
                    {
                        var lineTop = offset.top;
                        if (isAfter) lineTop += jnode.height();
                        g.nodeDroptip.css({
                            left: range.left,
                            top: lineTop,
                            width: range.right - range.left
                        }).show();
                        g.nodeDropIn = treedataindex;
                        g.nodeDropDir = isAfter ? "bottom" : "top";
                        if (pageY > range.top + 7 && pageY < range.bottom - 7)
                        {
                            this.proxy.find(".l-drop-icon:first").removeClass("l-drop-no l-drop-yes").addClass("l-drop-add");
                            g.nodeDroptip.hide();
                            g.nodeDropInParent = true;
                        }
                        else
                        {
                            this.proxy.find(".l-drop-icon:first").removeClass("l-drop-no l-drop-add").addClass("l-drop-yes");
                            g.nodeDroptip.show();
                            g.nodeDropInParent = false;
                        }
                        return;
                    }
                    else if (g.nodeDropIn != -1)
                    {
                        g.nodeDropIn = -1;
                        g.nodeDropInParent = false;
                        g.nodeDroptip.hide();
                        this.proxy.find(".l-drop-icon:first").removeClass("l-drop-yes  l-drop-add").addClass("l-drop-no");
                    }
                }

                g.nodeDropIn = null;
                g.nodeDropInParent = true;
                g.nodeDroptip.hide();
                this.proxy.find(".l-drop-icon:first").removeClass("l-drop-no l-drop-add").addClass("l-drop-yes");
            },
            onStopDrag: function (current, e)
            {
                var nodes = this.draggingNodes;
                g.nodedragging = false;
                if (g.nodeDropIn != -1)
                {
                    for (var i = 0; i < nodes.length; i++)
                    {
                        var children = nodes[i].children;
                        if (children)
                        {
                            nodes = $.grep(nodes, function (node, i)
                            {
                                var isIn = $.inArray(node, children) == -1;
                                return isIn;
                            });
                        }
                    }
                    function removeAttr(node)
                    {
                        delete node['treedataindex'];
                        delete node['__status'];
                        var children = node.children;
                        if (children)
                        {
                            $.each(children, function ()
                            {
                                removeAttr(this);
                            });
                        }
                    }
                    for (var i in nodes)
                    {
                        var node = nodes[i];
                        var newnode = $.extend(true, {}, node);
                        removeAttr(newnode);
                        if (g.nodeDropInParent)
                        {
                            g.remove(node);
                            rightTree.append(g.nodeDropIn, [newnode]);
                        }
                        else
                        {
                            g.remove(node);
                            rightTree.append(rightTree.getParent(g.nodeDropIn), [newnode], g.nodeDropIn, g.nodeDropDir == "bottom")
                        }
                    }
                    g.nodeDropIn = -1;
                }
                g.nodeDroptip.hide();
                this.set('cursor', 'default');
            }
        });
    }

})(jQuery)