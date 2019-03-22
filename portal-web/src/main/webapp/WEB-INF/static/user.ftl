<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>员工管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/portal-web/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/portal-web/css/style.css">
	<script src="/portal-web/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="/portal-web/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/portal-web/plugins/My97DatePicker/WdatePicker.js"></script>
</head>

<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">员工管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新增" data-toggle="modal" data-target="#editModal" onclick="addUser()"><i class="fa fa-file-o"></i> 新增</button>
                                        <button type="button" class="btn btn-default" title="删除" ><i class="fa fa-trash-o"></i> 删除</button>
                                        
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                    <form action="/portal-web/userPage" method="post" id="queryUser">
                                  部门：<select name="deptNo">
                                         	<option value="">全部</option>
                                    <#list deptList as ptlist>
                                         	<option value="${ptlist.deptNo}">${ptlist.deptName}</option>
                                    </#list>
                                        </select>
							                  工号：<input placeholder="工号" type="text" name="userNo">
																姓名：<input placeholder="姓名" type="text" name="userName" >
									<button class="btn btn-default" onclick="queryUser()">查询</button>
                                    </form>
                                </div>
                            </div>
                            <!--工具栏/-->

			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                              <th class="" style="padding-right:0px">
			                                  <input id="selall" type="checkbox" class="icheckbox_square-blue">
			                              </th> 
										  <th class="sorting_asc">工号</th>
									      <th class="sorting">姓名</th>
									      <th class="sorting">部门</th>
									      <th class="sorting">手机号</th>
									      <th class="sorting">邮箱</th>
									      <th class="sorting">入职时间</th>
									      <th class="sorting">状态</th>									     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
                                  <#if userList?exists>
                                  <#list userList as srlist>
			                          <tr>
			                              <td><input  type="checkbox"></td>			                              
				                          
									      <td>${srlist.userNo}</td>
									      <td>${srlist.username}</td>
									      <td>${srlist.deptName}</td>
												<td>${srlist.phone!''}</td>
									      <td>${srlist.email!''}</td>
									      <td>${srlist.createTime}</td>
		                                  <td>
                                              <#if srlist.status=='1'>
		                                  	<span>
		                                  		正常
		                                  	</span>
                                                  <#else >
		                                  	<span >
		                                  		离职
		                                  	</span>
                                              </#if>
		                                  </td>		                                  
		                                  <td class="text-center">                                          
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal2" onclick='updateUser("${srlist.id}")'>修改</button>
		                                  </td>
			                          </tr>
                                  </#list>
                                  </#if>
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							  
							 
                        </div>
                        <!-- 数据表格 /-->
                        
                        
                     </div>
                    <!-- /.box-body -->
  <!-- 编辑窗口 -->
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" >
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                  <h3 id="myModalLabel">员工新增</h3>
              </div>
              <div class="modal-body">
                  <form action="/portal-web/addUser" method="post" id="saveUser">
                  <table class="table table-bordered table-striped"  width="800px">
                      <tr>
                          <td>工号</td>
                          <td><input  class="form-control" name="userNo" id="userNo" readonly></td>
                      </tr>
                      <tr>
                          <td>姓名<span style="color: red">*</span></td>
                          <td><input  class="form-control" name="userName" placeholder="姓名" onblur="checkName()" required>  </td>
                      </tr>
                      <tr>
                          <td>部门<span style="color: red">*</span></td>
                          <td>
                              <select name="deptNo">
                              <#list deptList as ptlist>
                                  <option value="${ptlist.deptNo}">${ptlist.deptName}</option>
                              </#list>
                              </select>
                          </td>
                      </tr>
                      <tr>
                          <td>性别<span style="color: red">*</span></td>
                          <td>
                              男<input type="radio" name="sex" value="1" checked style="margin: 0px 5px;">
                              女<input type="radio" name="sex" value="0" style="margin: 0px 5px;">
                          </td>
                      </tr>
                      <tr>
                          <td>手机号</td>
                          <td><input  class="form-control" name="phone" placeholder="手机号">  </td>
                      </tr>
                      <tr>
                          <td>邮箱</td>
                          <td><input  class="form-control" name="email" placeholder="邮箱">  </td>
                      </tr>
                  </table>
                  </form>
              </div>
              <div class="modal-footer">
                  <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="saveUser()">保存</button>
                  <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
              </div>
          </div>
      </div>
  </div>
  <!-- 编辑窗口 -->
  <div class="modal fade" id="editModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" >
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                  <h3 id="myModalLabel">员工修改</h3>
              </div>
              <div class="modal-body">
                  <table class="table table-bordered table-striped"  width="800px">
                      <tr>
                          <td>工号</td>
                          <td><input  class="form-control" id="iuserNo" name="userNo"  readonly></td>
                      </tr>
                      <tr>
                          <td>姓名</td>
                          <td><input  class="form-control" id="iuserName" name="userName" placeholder="姓名" required>  </td>
                      </tr>
                      <tr>
                          <td>部门</td>
                          <td>
                              <select name="deptNo">
                              <#list deptList as ptlist>
                                  <option value="${ptlist.deptNo}" id="${ptlist.deptNo}">${ptlist.deptName}</option>
                              </#list>
                              </select>
                          </td>
                      </tr>
                      <tr>
                          <td>性别</td>
                          <td>
                              男<input type="radio" name="sex" value="1" id="man" checked style="margin: 0px 5px;">
                              女<input type="radio" name="sex" value="0" id="wman" style="margin: 0px 5px;">
                          </td>
                      </tr>
                      <tr>
                          <td>手机号</td>
                          <td><input  class="form-control" id="iphone" name="phone" placeholder="手机号">  </td>
                      </tr>
                      <tr>
                          <td>邮箱</td>
                          <td><input  class="form-control" id="iemail" name="email" placeholder="邮箱">  </td>
                      </tr>
                      <tr>
                          <td>状态</td>
                          <td>
                              正常<input type="radio" name="status" id="qwe" value="1" checked style="margin: 0px 5px;">
                              离职<input type="radio" name="status" id="asd" value="0" style="margin: 0px 5px;">
                          </td>
                      </tr>
                  </table>
              </div>
              <div class="modal-footer">
                  <button class="btn btn-success" data-dismiss="modal" aria-hidden="true">保存</button>
                  <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
              </div>
          </div>
      </div>
  </div>
</body>
<script language="javascript">
    function getdate() {
        var date = new Date();
        var mon = date.getMonth()  + 1;         //getMonth()返回的是0-11，则需要加1
        if(mon <=9){                                     //如果小于9的话，则需要加上0
            mon = "0" + mon;
        }
        var day = date.getDate();                   //getdate()返回的是1-31，则不需要加1
        if(day <=9){                                     //如果小于9的话，则需要加上0
            day = "0" + day;
        }
        return date.getFullYear() + "-" + mon + "-" +  day;
    }
    function createTime(){
        WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'2015-10-01',maxDate:getdate()});
    }
    function queryUser() {
        $("#queryUser").submit();
    }
    function addUser() {
        $.ajax({
            type:"GET",
            url:"/portal-web/getNewUserNo",
            dataType:"json",
            success:function (data) {
                $("#userNo").val(data["newUserNo"]);
            }
        })
    }
    function saveUser() {
        $("#saveUser").submit();
    }
    function updateUser(userId) {
        $.ajax({
            type:"GET",
            url:"/portal-web/selectUserById",
            contentType:"application/json;charset=utf-8",
            data:{"userId":userId},
            dataType:"json",
            success:function (data) {
                $("#iuserNo").val(data["userNo"]);
                $("#iuserName").val(data["username"]);
                document.getElementById(data["partNo"]).selected=true;
                if (data["sex"]=="1"){
                    $("#man").prop("checked",true);
                }else {
                    $("#wman").prop("checked",true);
                }
                $("#iphone").val(data["phone"]);
                $("#iemail").val(data["email"]);
                if (data["status"]=="1"){
                    $("#qwe").prop("checked",true);
                }else {
                    $("#asd").prop("checked",true);
                }
            }
        })
    }
    function checkName() {
        $.ajax({
            type:"GET",
            url:"/portal-web/checkBossName",
            contentType:"application/json;charset=utf-8",
            data:{"bossName":$("#userName").val()},
            dataType:"json",
            success:function (data) {
                if (data["flag"]=="true"){
                    alert("该用户已存在，使用（姓名+员工编号）作为姓名");
                    $("#userName").val("");
                }
            }
        })
    }
</script>
</html>









