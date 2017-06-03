/**功能点1：获取上一个页面传递的登录用户名**/
//var s = location.search;
//var loginName = s.substring( s.indexOf('=')+1 );

/**功能点2：异步加载公用的页头和页尾**/
$('div#header').load('header.php');
$('div#footer').load('footer.php');

/**功能点3：异步请求当前登录用户的购物车内容**/
$(function(){
  $.ajax({
    url: 'data/4_cart_detail.php',
    data: {uname: sessionStorage['loginName']},
    success: function(detailList){
      //遍历购物车详情列表，拼接HTML片段
      var html = '';
      $.each(detailList, function(i, d){
        html += `
        <tr>
            <td>
                <input type="checkbox"/>
                <input type="hidden" value="1" />
                <div><img src="${d.pic}"></div>
            </td>
            <td><a href="">${d.pname}</td>
            <td><a href="">${d.price}</td>
            <td>
                <button>-</button><input type="text" value="${d.count}"/><button>+</button>
            </td>
            <td><span>${d.price*d.count}</span></td>
            <td><a href="">删除</a></td>
        </tr>  
        `;
      });
      $('#cart tbody').html(html);
    }
  });
});