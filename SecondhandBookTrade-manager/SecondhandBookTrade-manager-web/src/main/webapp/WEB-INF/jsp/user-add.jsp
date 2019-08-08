<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入公共页面 -->
<script src="${pageContext.request.contextPath}/js/lib/jquery.js"></script>
<link rel="stylesheet" href="/js/lib/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/js/commons/common.js"></script>
<!-- 弹出框核心包 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/layer/layer.js"></script>
<!-- 弹出层封装JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/pop.js"></script>
<!-- layer UI 核心包 --> 
<script src="${pageContext.request.contextPath}/js/lib/layui/layui.js"></script>
<!-- <script src="/js/lib/layui/lay/dest/layui.all.js"></script> -->
<script src="${pageContext.request.contextPath}/js/lib/layui/lay/modules/form.js"></script>
<!-- ajax封装JS -->
<script src="${pageContext.request.contextPath}/js/commons/ajaxEncapsulation.js"></script>
<!-- 系统工具类 -->
<script src="${pageContext.request.contextPath}/js/commons/jsUtils.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cityselect.js"></script>
<script src="${pageContext.request.contextPath}/js/addUser.js"></script>
<!--<div  style="padding:10px 10px 10px 10px" -->
<form class="layui-form" action="/user/addUser.do" method="post">
  <!-- <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
    </div>
  </div> -->
  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" style="width:190px">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-inline">
      <input type="password" name="password" lay-verify="pass" placeholder="请确认密码" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男" checked="">
      <input type="radio" name="sex" value="女" title="女">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">手机号码</label>
      <div class="layui-input-inline">
        <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
      </div>
    </div>
   </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">出生日期</label>
      <div class="layui-input-inline">
        <input type="text" name="birthday" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">身份证号码</label>
    <div class="layui-input-block">
      <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input" style="width:190px">
    </div>
  </div>
  <!-- <div class="layui-form-item">
    <label class="layui-form-label">用户角色</label>
    <div class="layui-input-block" style="width:190px">
      <select name="role" lay-filter="aihao">
        <option value=""></option>
        <option value="0">系统管理员</option>
        <option value="1" selected="">轮播图管理员</option>
        <option value="2">VIP</option>
        <option value="3">普通用户</option>
        <option value="4">游客</option>
      </select>
    </div>
  </div> -->
    <div class="layui-form-item">
    <label class="layui-form-label">详细地址</label>
    <div class="layui-input-block">
      <input id="seachdistrict" type="text" name="addressDetail" lay-verify="required" autocomplete="off" placeholder="请输入详细地址" class="layui-input" style="width:490px">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">爱好</label>
    <div class="layui-input-block">
      <input type="checkbox" name="write" title="写作">
      <input type="checkbox" name="read" title="阅读" checked="">
      <input type="checkbox" name="game" title="游戏">
      <input type="checkbox" name="other" title="其他">
    </div>
  </div>
  <!-- <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">范围</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid">-</div>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div> -->
  
  
  
  
 <!--  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">分组选择框</label>
      <div class="layui-input-inline">
        <select name="quiz">
          <option value="">请选择问题</option>
          <optgroup label="城市记忆">
            <option value="你工作的第一个城市">你工作的第一个城市</option>
          </optgroup>
          <optgroup label="学生时代">
            <option value="你的工号">你的工号</option>
            <option value="你最喜欢的老师">你最喜欢的老师</option>
          </optgroup>
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">搜索选择框</label>
      <div class="layui-input-inline">
        <select name="modules" lay-verify="required" lay-search="">
          <option value="">直接选择或搜索选择</option>
          <option value="1">layer</option>
          <option value="2">form</option>
          <option value="3">layim</option>
          <option value="4">element</option>
          <option value="5">laytpl</option>
          <option value="6">upload</option>
          <option value="7">laydate</option>
          <option value="8">laypage</option>
          <option value="9">flow</option>
          <option value="10">util</option>
          <option value="11">code</option>
          <option value="12">tree</option>
          <option value="13">layedit</option>
          <option value="14">nav</option>
          <option value="15">tab</option>
          <option value="16">table</option>
          <option value="17">select</option>
          <option value="18">checkbox</option>
          <option value="19">switch</option>
          <option value="20">radio</option>
        </select>
      </div>
    </div>
  </div>
  
  
  
  <div class="layui-form-item" pane="">
    <label class="layui-form-label">原始复选框</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like1[write]" lay-skin="primary" title="写作" checked="">
      <input type="checkbox" name="like1[read]" lay-skin="primary" title="阅读">
      <input type="checkbox" name="like1[game]" lay-skin="primary" title="游戏" disabled="">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">开关-默认关</label>
    <div class="layui-input-block">
      <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">开关-默认开</label>
    <div class="layui-input-block">
      <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">普通文本域</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">编辑器</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
    </div>
  </div> -->
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" id="register">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  <!-- <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="register" >立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div> -->
</form>
<!-- <div id="city_2">
  <div class="layui-form-item">
    <label class="layui-form-label">常住地址</label>
    <div class="layui-input-inline" id="city_1" >
      <select name="quiz1" id="prov" style="width:60%;height:7%">
        <option value="">请选择省</option>
      </select>
    </div>
    <div class="layui-input-inline" id="city_2">
      <select name="quiz2" id="city" disabled="disabled" style="width:60%;height:7%">
        <option value="">请选择市</option>
      </select>
    </div>
    <div class="layui-input-inline" id="city_2">
      <select name="quiz2" id="dist" disabled="disabled" style="width:60%;height:7%">
        <option value="">请选择地区</option>
      </select>
    </div>
  </div>
 </div> -->
	<!-- <form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>书籍类目:</td>
	            <td>
	            	<a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>
	            	<input type="hidden" name="cid" style="width: 280px;"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>书籍标题:</td>
	            <td><input class="easyui-textbox" type="text" name="title" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>书籍卖点:</td>
	            <td><input class="easyui-textbox" name="sellPoint" data-options="multiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>书籍价格:</td>
	            <td><input class="easyui-numberbox" type="text" name="priceView" data-options="min:1,max:99999999,precision:2,required:true" />
	            	<input type="hidden" name="price"/>
	            </td>
	        </tr>
	        <tr>
	            <td>库存数量:</td>
	            <td><input class="easyui-numberbox" type="text" name="num" data-options="min:1,max:99999999,precision:0,required:true" /></td>
	        </tr>
	        <tr>
	            <td>条形码:</td>
	            <td>
	                <input class="easyui-textbox" type="text" name="barcode" data-options="validType:'length[1,30]'" />
	            </td>
	        </tr>
	        <tr>
	            <td>书籍图片:</td>
	            <td>
	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
	                 <input type="hidden" name="image"/>
	            </td>
	        </tr>
	        <tr>
	            <td>书籍描述:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>
	            </td>
	        </tr>
	        <tr class="params hide">
	        	<td>书籍规格:</td>
	        	<td>
	        		
	        	</td>
	        </tr>
	    </table>
	    <input type="hidden" name="itemParams"/>
	</form> -->
	<!-- <div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div> 
</div>-->
