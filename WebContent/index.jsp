<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
$(function(){
	initStu();
})

function initStu() {
	$("#empTab").datagrid({
		url:"EmpServlet",
		method:"post",
		pagination:true,
		fitColumns:true,
		singleSelect:true,
		toolbar:"#empTool",
		queryParams:{
			sid:$("#eid").val(),
			ename:$("#name").val(),
			sex:$("#sex").combobox("getValue"),
			startTime:$('#startTime').datebox('getValue'),
			endTime:$('#endTime').datebox('getValue')
			
		}
	})
}
function formatterSex(value,row,index) {
	return row.sex==1? "男":"女";
}
function formatterCaozuo(value,row,index) {
	return "<a href='javascript:void(0)' onclick='chaKan("+index+")'>查看</a>  <a href='javascript:void(0)' onclick='edit("+index+")'>编辑</a>  <a href='javascript:void(0)' onclick='del("+index+")'>删除</a>"
}
function edit(index) {
	//获取要编辑的数据
	var arr=$("#empTab").datagrid("getData");
	var row=arr.rows[index]
	//将数据填充进表单
	$("#frm").form("load",row);
	//打开对话框
	$("#editDialog").dialog("open");
}
function saveEdit(){
	$.post("UpdateServlet",{
		eid:$("#eid1").val(),
		ename:$("#ename1").val(),
		sex:$("#sex1").combobox("getValue"),
		age:$("#age1").val(),
		ruzhidate:$('#ruzhidate').datebox('getValue'),
		sale:$("#sale1").val(),
	},function(res){
		if(res>0){
			//修改成功
			$("#empTab").datagrid("reload");
			$("#editDialog").dialog("close");
			$.messager.alert("提示","修改成功");
		}else{
			//修改失败
			$.messager.alert("提示","修改失败")
		}
		
	},"json")
}
function closeEdit(){
	$("#editDialog").dialog("close");
	$("#chakanDialog").dialog("close");
	$("#addDialog").dialog("close");
}
function chaKan(index){
	//获取要编辑的数据
	var arr=$("#empTab").datagrid("getData");
	var row=arr.rows[index]
	//将数据填充进表单
	$("#frm1").form("load",row);
	//打开对话框
	$("#chakanDialog").dialog("open");
}
function del(index) {
	//获取要编辑的数据
	var arr=$("#empTab").datagrid("getData");
	var row=arr.rows[index];
	//确认删除
	$.messager.confirm("确认删除","确认删除么？",function(r){
		if(r){
			$.post("DelServlet",{eid:row.eid},function(res){
				if(res>0){
					//删除成功
					$("#empTab").datagrid("reload");
					$.messager.alert("提示","删除成功");
				}else{
					//修改失败
					$.messager.alert("提示","删除失败")
				}
				
			},"json")
		}
		
	})
}
function addEmp(index){
	$("#addDialog").window("open");
}
function saveAdd(){
	var t=$("#empTab").form("validate");
	
	$.post("AddServlet",{
		ename:$("#ename2").val(),
		sex:$("#sex2").combobox("getValue"),
		age:$("#age2").val(),
		ruzhidate:$('#ruzhidate2').datebox('getValue'),
		sale:$("#sale2").val()
	},
	function(res){
		if(res>0){
			$("#empTab").datagrid("reload");
			$("#addDialog").window("close");
			$.messager.alert("提示","添加成功！")
		}else{
			$.messager.alert("提示","添加失败！")
		}
	},"json")
		
}
</script>
</head>
<body>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addEmp()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<table id="empTab" class="easyui-datagrid">
	<thead>
			<tr>
				<th data-options="field:'eid',title:'Id'"></th>
				<th data-options="field:'ename',title:'名称'"></th>
				<th data-options="field:'sex',title:'性别',formatter:formatterSex"></th>
				<th data-options="field:'age',title:'年龄'"></th>
				<th data-options="field:'ruzhidate',title:'入职时间'"></th>
				<th data-options="field:'sale',title:'工资'"></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formatterCaozuo"></th>
			</tr>
		</thead>
	</table>
	<div id="empTool">
		<form class="easyui-form" >
	        <label for="name">姓名:</label>   
	        <input class="easyui-validatebox" type="text" id="name" name="ename" data-options="required:true" />
	        <label for="name">性别:</label>   
	       <select class="easyui-combobox" id="sex" name="sex">   
			    <option value="">--请选择--</option>
			    <option value="1">男</option>   
			    <option value="0">女</option>   
			</select>
			<label for="name">入职时间:</label>   
	        <input class="easyui-datetimebox" type="text" id="startTime" name="name" data-options="required:true" />~~
	        <input class="easyui-datetimebox" type="text" id="endTime" name="name" data-options="required:true" />
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initStu()">搜索</a>  
		</form>
	</div>
	<!-- 修改的对话框 -->
	<div id="editDialog" class="easyui-dialog" data-options="modal:true,title:'修改',closed:true,
	buttons:[{
		text:'保存',
		handler:function(){
			saveEdit();
		}
	},{
		text:'取消',
		handler:function(){
			closeEdit();
		}
	}]
	">
		<form class="easyui-form" id="frm">
			<table cellpadding="5">
				<tr>
					<td>
						<label for="name">用户ID:</label>
					</td>
					<td>
						 <input disabled="disabled" class="easyui-validatebox" type="text" id="eid1" name="eid" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">姓名:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="ename1" name="ename" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">性别:</label>
					</td>
					<td>
						<select class="easyui-combobox" id="sex1" name="sex">   
						    <option value="">--请选择--</option>
						    <option value="1">男</option>   
						    <option value="0">女</option>   
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">年龄:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="age1" name="age" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">入职日期:</label>
					</td>
					<td>
						<input disabled="disabled" class="easyui-datetimebox" type="text" id="ruzhidate" name="ruzhidate" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">工资:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sale1" name="sale" data-options="required:true" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	


<!-- 查看的对话框 -->
	<div id="chakanDialog" class="easyui-dialog" data-options="modal:true,title:'查看',closed:true,
	buttons:[{
		text:'取消',
		handler:function(){
			closeEdit();
		}
	}]
	">
		<form class="easyui-form" id="frm1">
			<table cellpadding="5">
				<tr>
					<td>
						<label for="name">用户ID:</label>
					</td>
					<td>
						 <input disabled="disabled" class="easyui-validatebox" type="text" id="eid1" name="eid" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">姓名:</label>
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="ename1" name="ename" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">性别:</label>
					</td>
					<td>
						<select disabled="disabled" class="easyui-combobox" id="sex1" name="sex">   
						    <option value="">--请选择--</option>
						    <option value="1">男</option>   
						    <option value="0">女</option>   
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">年龄:</label>
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="age1" name="age" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">入职日期:</label>
					</td>
					<td>
						<input disabled="disabled" class="easyui-datetimebox" type="text" id="ruzhidate" name="ruzhidate" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">工资:</label>
					</td>
					<td>
						<input disabled="disabled" class="easyui-validatebox" type="text" id="sale1" name="sale" data-options="required:true" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 添加的对话框 -->
	<div id="addDialog" class="easyui-dialog" data-options="modal:true,title:'添加',closed:true,
	buttons:[{
		text:'保存',
		handler:function(){
			saveAdd();
		}
	},{
		text:'取消',
		handler:function(){
			closeEdit();
		}
	}]
	">
		<form class="easyui-form" id="frm">
			<table cellpadding="5">
				
				<tr>
					<td>
						<label for="name">姓名:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="ename2" name="ename" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">性别:</label>
					</td>
					<td>
						<select class="easyui-combobox" id="sex2" name="sex">   
						    <option value="">--请选择--</option>
						    <option value="1">男</option>   
						    <option value="0">女</option>   
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">年龄:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="age2" name="age" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">入职日期:</label>
					</td>
					<td>
						<input class="easyui-datetimebox" type="text" id="ruzhidate2" name="ruzhidate" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">工资:</label>
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="sale2" name="sale" data-options="required:true" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>