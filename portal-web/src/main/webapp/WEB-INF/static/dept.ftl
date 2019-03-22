<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>部门管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/portal-web/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/portal-web/css/style.css">
	<script src="/portal-web/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="/portal-web/plugins/bootstrap/js/bootstrap.min.js"></script>
 
</head>

<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">部门管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" onclick="addDept()" class="btn btn-default" title="新增" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新增</button>
                                        <button type="button" class="btn btn-default" title="删除" onclick="doDelete()"><i class="fa fa-trash-o"></i> 删除</button>
                                        
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                 <form action="/portal-web/deptPage" method="post" id="queryDept">
							                  部门编号：<input  type="text" name="deptNo" placeholder="部门编号">
																部门名称：<input type="text" name="deptName" placeholder="部门名称">

									<button class="btn btn-default" onclick="queryDept()">查询</button>
                                 </form>
                                </div>
                            </div>
                            <!--工具栏/-->

			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                              <th class="" style="padding-right:0px">
			                                  <input id="selall" type="checkbox" class="icheckbox_square-blue" onclick="selectAll()">全选
			                              </th> 
										  <th class="sorting_asc">编号</th>
									      <th class="sorting">部门名称</th>
									      <th class="sorting">成立时间</th>
									      <th class="sorting">人数</th>
                                          <th class="sorting">负责人</th>
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
								  <#if deptList?exists>
                                  <form action="/portal-web/deleteDept" method="post" id="deleteDept">
								  <#list deptList as ptlist>
			                          <tr>

			                              <td><input  type="checkbox" name="ckbox" value="${ptlist.deptId}"></td>
				                          
									      <td>${ptlist.deptNo}</td>
									      <td>${ptlist.deptName}</td>
									      <td>${ptlist.createTime}</td>
										  <td>${ptlist.userCount}</td>
                                          <td>${ptlist.bossName!''}</td>
		                                  <td class="text-center">                                          
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal2" onclick='getDeptById("${ptlist.deptId}")'>修改</button>
		                                  </td>
			                          </tr>
								  </#list>
                                  </form>
								  </#if>
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							  
							 
                        </div>
                        <!-- 数据表格 /-->
                        
                        
                     </div>
                    <!-- /.box-body -->
		<!-- 编辑窗口 -->
		<div class="modal fade" id="editModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">部门编辑</h3>
				</div>
				<div class="modal-body">
                    <form action="/portal-web/updateDept" method="post" id="updateDept">
					<table class="table table-bordered table-striped"  width="800px">
						<tr>
							<td>编号</td>
							<td>
                                <input class="form-control" type="text" id="deptNo2" name="deptNo2" readonly>
                                <input class="form-control" type="hidden" id="deptId2" name="deptId2" readonly>
                            </td>
						</tr>	
								<tr>
									<td>名称</td>
									<td><input  class="form-control" id="deptName2" name="deptName2" placeholder="部门名称" >  </td>
								</tr>		      	
								<tr>
									<td>部门负责人</td>
									<td><input  class="form-control" id="bossName2" name="bossName2" placeholder="部门负责人" onblur="checkBoss2()">  </td>
								</tr>		
							
					</table>				
				</div>
				<div class="modal-footer">						
					<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="updateDept()">保存</button>
					<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
                </form>
				</div>
			</div>
		</div>
  <!-- 编辑窗口 -->
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" >
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                  <h3 id="myModalLabel">部门新增</h3>
              </div>
              <div class="modal-body">
                  <form action="/portal-web/addDept" method="post" id="saveDept">
                  <table class="table table-bordered table-striped"  width="800px">
                      <tr>
                          <td>编号</td>
                          <td><input class="form-control" type="text" id="deptNo" name="deptNo" readonly></td>
                      </tr>
                      <tr>
                          <td>名称</td>
                          <td><input  class="form-control" name="deptName" placeholder="部门名称" type="text" required>  </td>
                      </tr>
                      <tr>
                          <td>部门负责人</td>
                          <td><input  class="form-control" id="bossName" name="bossName" placeholder="部门负责人" type="text" onblur="checkBoss()" required>  </td>
                      </tr>

                  </table>
              </div>
              <div class="modal-footer">
                  <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="saveDept()">保存</button>
                  <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
              </div>
              </form>
          </div>
      </div>
  </div>
</body>
<script type="text/javascript">
    function selectAll() {
        var items = document.getElementsByName("ckbox");
        var all = document.getElementById("selall");
        if(all.checked==true){
            if(items.length){
                for( var i=0;i<items.length;i++){
                    items[i].checked=true;
                }
            }
        }else {
            if(items.length){
                for( var i=0;i<items.length;i++){
                    items[i].checked=false;
                }
            }
        }
    }
    function addDept() {
        $.ajax({
            type:"GET",
            url:"/portal-web/addDeptBtn",
            dataType:"json",
            success:function (data) {
                $("#deptNo").val(data["maxDeptNo"]);
            }
        })
    }
    function saveDept() {
        $("#saveDept").submit();
    }
    function getDeptById(deptId) {
        $.ajax({
            type:"GET",
            url:"/portal-web/getDeptById",
            contentType:"application/json;charset=utf-8",
            data:{"deptId":deptId},
            dataType:"json",
            success:function (data) {
                $("#deptNo2").val(data["deptNo"]);
                $("#deptName2").val(data["deptName"]);
                $("#bossName2").val(data["bossName"]);
                $("#deptId2").val(data["deptId"]);
            }
        })
    }
    function updateDept() {
        $("#updateDept").submit();
    }
    function doDelete() {
        var items = document.getElementsByName("ckbox");
        var num = 0;
        for (var i=0;i<items.length;i++){
            if (items[i].checked){
                num++;
            }
        }
        if (num>0){
            if(confirm("共"+num+"条数据，你确认要删除吗？")){
                $("#deleteDept").submit();
            }
        }else {
            alert("未选中要删除数据！");
        }

    }
    function queryDept() {
        $("#queryDept").submit();
    }
    function checkBoss() {
        $.ajax({
            type:"GET",
            url:"/portal-web/checkBossName",
            contentType:"application/json;charset=utf-8",
            data:{"bossName":$("#bossName").val()},
            dataType:"json",
            success:function (data) {
                if (data["flag"]=="false"){
                    alert("填写的负责人不存在！")
                    $("#bossName").val("");
                }
            }
        })
    }
    function checkBoss2() {
        $.ajax({
            type:"GET",
            url:"/portal-web/checkBossName",
            contentType:"application/json;charset=utf-8",
            data:{"bossName":$("#bossName2").val()},
            dataType:"json",
            success:function (data) {
                if (data["flag"]=="false"){
                    alert("填写的负责人不存在！")
                    $("#bossName2").val("");
                }
            }
        })
    }
</script>
</html>

















