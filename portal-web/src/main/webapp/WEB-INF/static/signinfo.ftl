<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>考勤信息管理</title>
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
                        <h3 class="box-title">考勤信息管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="导出" ><i class="fa fa-file-o"></i> 导出</button>
                                        <button type="button" class="btn btn-default" title="删除" ><i class="fa fa-trash-o"></i> 删除</button>
                                        
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                  部门：<select>
                                         	<option value="">全部</option>
											<#list deptList as list>
                                         	<option value="${list.deptNo}">${list.deptName}</option>
											</#list>
                                        </select>
										日期：<input type="text" name="sgDate" placeholder="日期" onclick="createTime()">
							                  工号：<input type="text" name="userNo" placeholder="工号">
																姓名：<input type="text" name="userName" placeholder="姓名">
									<button class="btn btn-default" >查询</button>                                    
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
										  <th class="sorting">签到时间</th>
										  <th class="sorting">签退时间</th>
									      <th class="sorting">日期</th>
									      <th class="sorting">部门</th>
	
			                          </tr>
			                      </thead>
			                      <tbody>
								  <#if signInfo?exists >
								  <#list signInfo as signdata>
			                          <tr>
			                              <td><input  type="checkbox"></td>			                              
				                          
									      <td>${signdata.user_no}</td>
									      <td>${signdata.username}</td>
									      <td>${signdata.sign_time}</td>
												<td>${signdata.sgout_time}</td>
									      <td>${signdata.now_date}</td>
									      <td>${signdata.dept_name}</td>
		                                 
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
</script>
</html>