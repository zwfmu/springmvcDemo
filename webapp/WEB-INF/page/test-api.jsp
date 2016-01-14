<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="cn.medlog.oms.pojo.entity.common.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API接口测试页面</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
/*
	.api-table {
		height: 550px;
		overflow:scroll;
	}
	*/
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="col-xs-12">
			<h1>API接口测试页面</h1>
			<h2>可用sessionId:</h2>
			<form action="test-api" method="post" id="sessionIdForm">
				<div class="form-group">
					<select class="form-control" name="sessionId">
						<option></option>
						<%
							List<String> keys = (List<String>) request.getAttribute("oms_token");
							for (String k : keys) {
						%>
								<option><%=k%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="form-group">
					<%
					    String sessionId = request.getParameter("sessionId");
						UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");
					%>
				<div class="form-group">
					<textarea class="form-control" rows="4"><%=userInfo %></textarea>
				</div>
				</div>
			</form>
		</div>

		<div class="col-xs-12">
			<h2>接口测试</h2>
			<div class="form-group">
				已选择测试API:
				<pre class="test-api-name">无</pre>
				<a class="btn btn-default btn-sm test-api-name-link" href="#">查看api信息</a>
			</div>
			<div class="form-group">
				<label for="test-sessionid" class="control-label">sessionId:</label>
				<input id="test-sessionid" class="form-control" type="text"
					placeholder="session id" value="<%=sessionId%>">
			</div>
			<div class="form-group">
				<label for="test-method" class="control-label">方法:</label> <select
					id="test-method" class="form-control">
					<option value="GET">GET</option>
					<option value="POST">POST</option>
				</select>
			</div>
			<div class="form-group">
				<label for="test-url" class="control-label">URL:</label> <input
					id="test-url" class="form-control" type="text" placeholder="url">
			</div>
			<div class="form-group">
				<label class="control-label">参数:</label>
				<form class="form-inline test-form">
					<div class="form-group test-form-kv">
						<input class="form-control test-form-key" type="text"
							placeholder="键"> <input
							class="form-control test-form-value" type="text" placeholder="值">
						<button class="btn btn-default test-form-kv-remove" type="button">
							<span class="glyphicon glyphicon-minus"></span>
						</button>
						<button class="btn btn-default test-form-kv-add" type="button">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</form>
			</div>
			<div class="form-group pull-right">
				<label class="checkbox-inline"> <input type="checkbox"
					id="test-serialize-before-submit" checked>发送前序列化
				</label>
				<button class="btn btn-info" type="button"
					id="test-unserialize-form" class="form-control">反序列化参数</button>
				<button class="btn btn-warning" type="button"
					id="test-serialize-form" class="form-control">序列化参数</button>
				<button class="btn btn-danger" type="button" id="test-submit-xx"
					class="form-control">JSON发送</button>
					<button class="btn btn-danger" type="button" id="test-submit"
					class="form-control">参数发送</button>
			</div>
			<div class="form-group">
				<label for="test-param" class="control-label">参数:</label>
				<textarea id="test-param" class="form-control" rows="7"></textarea>
			</div>
			<div class="form-group pull-right">
				<label class="checkbox-inline"> <input type="checkbox"
					id="test-auto-jsonFormat" checked>返回结果自动格式化
				</label>
				<button class="btn btn-success" type="button" id="test-jsonFormat"
					class="form-control">格式化返回结果</button>
			</div>
			<div class="form-group">
				<label for="test-result" class="control-label">返回结果:</label>
				<textarea id="test-result" class="form-control" rows="12"></textarea>
			</div>
		</div>
		<div class="col-xs-12">
			<h2>可用API</h2>
			<div class="test-api-table">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>API名</th>
							<th>URL</th>
							<th>测试</th>
							<th>属性</th>
						</tr>
					</thead>
					<tbody>
						<%
						int i = 0;
						List<Map<String, String>> allApis = (List<Map<String, String>>)request.getAttribute("allApis");
						Iterator<Map<String, String>> iterator = allApis.iterator();
						while(iterator.hasNext()){
						    Map<String, String> m = iterator.next();
						    String an = m.get("an");
						    String apiName = m.get("apiName");
						    String apiMethod = m.get("apiMethod");
						    String apiUrl = m.get("apiUrl");
					%>
						<tr>
							<td><a id="<%=++i %>_api"></a><%=++i %></td>
							<td><%=apiName %></td>
							<td><%=apiUrl %></td>
							<td><button class="btn btn-default test-url-btn" type="button" 
							data-api-url="<%=apiUrl %>" data-api-method="<%=apiMethod %>"
							data-api-name="<%=an %>" >测</button></td>
							<td><a href="#<%=an %>">属</a></td>
						</tr>
					<% 		}%>
					</tbody>
				</table>
			</div>
		</div>
		<input type="file" id="fileImg"/>
	</div>
	<script type="text/javascript">
		$('select[name="sessionId"]').on('change', function() {
			$('#sessionIdForm').submit();
		});
		$('#test-serialize-form').on('click', function(){
			$('#test-param').val(serializeTestForm());
		});
		
		 $("#fileImg").change(function () {
             var reader = new FileReader();
             reader.readAsDataURL(this.files[0]);
             reader.onload = function (e) {
              var tempfile = this.result;
              var data = {
              		file:tempfile
              };
              $.ajax({
                  type: "POST",
                  url:  apiTestUrlPrefix+"/v2/upload/biz"+"?token="+$('#test-sessionid').val(),
                  dataType: 'json',
                  data: data,
                  crossDomain: true,
                  success: function (RequtData, header, config, status) {
                	  console.info(RequtData);
                	  //window.open(RequtData.info.url);
                  }, error: function (data, header, config, status) {
                  }
              });
		             
		     }
	    });

		
		function serializeTestForm(){
			var dataForm = $('<form>');
			$('.test-form-kv').each(function(index, e){
				var key = $(e).children('.test-form-key').val();
				var value = $(e).children('.test-form-value').val();
				if(key){
					var e = $('<input type="text">');
					e.attr('name', key);
					e.val(value);
					e.appendTo(dataForm);
				}
			});
			
			var token = $('#test-sessionid').val();
			var tokenInput = $('<input type="text">')
			tokenInput.attr('name', 'token');
			tokenInput.val(token);
			tokenInput.appendTo(dataForm);
			//var jsonuserinfo = $('#form1').serializeObject(); 
		 	return dataForm.serializeObject();
		}
		
		$('#test-unserialize-form').on('click', function(){
			if(!confirm("确定反序列化吗？会覆盖之前的数据。")){
				return;
			}
			
			var u = $('#test-param').val().split('&');
			var kv = $($('div.test-form-kv')[0]).clone(false);
			$('div.test-form-kv').remove();
			
			for(var i in u){
				
				var e = u[i].split('=');
				var key = decodeURIComponent(e[0]);
				var value = decodeURIComponent(e[1]);
				var input = kv.clone();
				input.children('.test-form-key').val(key);
				input.children('.test-form-value').val(value);
				
				input.appendTo('form.test-form');
			}
			
		});
		
		//序列化后提交
		$('#test-submit').on('click', function(){
			if($('#test-serialize-before-submit').prop('checked')){
				$('#test-param').val(jsonFormat(JSON.stringify(serializeTestForm()),false));
			}
			var option = {
			  headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
				url : $('#test-url').val()+"?token="+$('#test-sessionid').val(),
				type: "POST",
				data: $('#test-param').val()
			};
			
			//console.log(option);
			
			$.ajax(option).always(function(data){
				var result = JSON.stringify(data);
				if($('#test-auto-jsonFormat').prop('checked')){
					result = jsonFormat(result, false);
				}
				$('#test-result').val(result);
			});
		});
		
		//参数直接提交
		$('#test-submit-xx').on('click', function(){
			var option = {
			  headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
				url : $('#test-url').val()+"?token="+$('#test-sessionid').val(),
				type: "POST",
				data: $('#test-param').val()
			};
			
			$.ajax(option).always(function(data){
				var result = JSON.stringify(data);
				if($('#test-auto-jsonFormat').prop('checked')){
					result = jsonFormat(result, false);
				}
				$('#test-result').val(result);
			});
		});
		
		$('#test-jsonFormat').on('click', function(){
			$('#test-result').val(jsonFormat($('#test-result').val(),false));
		});
		
		$(document).on('click', '.test-form-kv-add' , function(){
			$(this).closest('div.test-form-kv').clone(true).appendTo('form.test-form');
		});
		$(document).on('click', '.test-form-kv-remove', function(){
			if($('div.test-form-kv').length > 1){
				$(this).closest('div.test-form-kv').remove();
			} else {
				$(this).siblings('input').val('');
			}
		});
		var apiTestUrlPrefix = "http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>";

		$(function() { 
			$('#test-url').val(apiTestUrlPrefix);
		});
		$(document).on(
				'click',
				'button.test-url-btn',
				function() {
					var apiUrl = $(this).data('api-url');
					var apiMethod = $(this).data('api-method');
					var apiName = $(this).data('api-name');
					$('#test-url').val(apiTestUrlPrefix + apiUrl);
					$('#test-method > option[value="' + apiMethod + '"]').prop(
							'selected', 'selected');
					$('.test-api-name').text(apiName);
					$('.test-api-name-link').attr('href',
							'#' + apiName + '_api');
					$('html, body').animate({
						scrollTop : 0
					});
					$('.test-api-table tr').removeClass('danger');
					$(this).closest('tr').addClass('danger');
				});

		function jsonFormat(txt, compress/*是否为压缩模式*/) {/* 格式化JSON源码(对象转换为JSON文本) */
			var indentChar = '    ';
			if (/^\s*$/.test(txt)) {
				alert('数据为空,无法格式化! ');
				return txt;
			}
			try {
				var data = eval('(' + txt + ')');
			} catch (e) {
				alert('数据源语法错误,格式化失败! 错误信息: ' + e.description, 'err');
				return txt;
			}
			;
			var draw = [], last = false, This = this, line = compress ? ''
					: '\n', nodeCount = 0, maxDepth = 0;

			var notify = function(name, value, isLast, indent/*缩进*/, formObj) {
				nodeCount++;/*节点计数*/
				for (var i = 0, tab = ''; i < indent; i++)
					tab += indentChar;/* 缩进HTML */
				tab = compress ? '' : tab;/*压缩模式忽略缩进*/
				maxDepth = ++indent;/*缩进递增并记录*/
				if (value && value.constructor == Array) {/*处理数组*/
					draw.push(tab + (formObj ? ('"' + name + '":') : '') + '['
							+ line);/*缩进'[' 然后换行*/
					for (var i = 0; i < value.length; i++)
						notify(i, value[i], i == value.length - 1, indent,
								false);
					draw.push(tab + ']' + (isLast ? line : (',' + line)));/*缩进']'换行,若非尾元素则添加逗号*/
				} else if (value && typeof value == 'object') {/*处理对象*/
					draw.push(tab + (formObj ? ('"' + name + '":') : '') + '{'
							+ line);/*缩进'{' 然后换行*/
					var len = 0, i = 0;
					for ( var key in value)
						len++;
					for ( var key in value)
						notify(key, value[key], ++i == len, indent, true);
					draw.push(tab + '}' + (isLast ? line : (',' + line)));/*缩进'}'换行,若非尾元素则添加逗号*/
				} else {
					if (typeof value == 'string')
						value = '"' + value + '"';
					draw.push(tab + (formObj ? ('"' + name + '":') : '')
							+ value + (isLast ? '' : ',') + line);
				}
				;
			};
			var isLast = true, indent = 0;
			notify('', data, isLast, indent, false);
			return draw.join('');
		}

		$('#turnTo1').on('click', function() {
			window.open("test-api/functionRoleRel.html");
		});
		$('#turnTo2').on('click', function() {
			window.open("test-api/functions.html");
		});
		$('#turnTo3').on('click', function() {
			window.open("test-api/copyfunrolerel.html");
		});
		
		
		$.fn.serializeObject = function()    
		{    
		   var o = {};    
		   var a = this.serializeArray();    
		   $.each(a, function() {    
		       if (o[this.name]) {    
		           if (!o[this.name].push) {    
		               o[this.name] = [o[this.name]];    
		           }    
		           o[this.name].push(this.value || '');    
		       } else {    
		           o[this.name] = this.value || '';    
		       }    
		   });    
		   return o;    
		};  
	</script>
</body>
</html>