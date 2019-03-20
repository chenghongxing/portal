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
                                        <button type="button" class="btn btn-default" title="新增" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新增</button>
                                        <button type="button" class="btn btn-default" title="删除" ><i class="fa fa-trash-o"></i> 删除</button>
                                        
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                  部门：<select>
                                         	<option value="">全部</option>      
                                         	<option value="0">销售部</option>    
                                         	<option value="1">财务部</option>    
                                         	<option value="2">人事部</option>    
                                         	<option value="3">市场部</option>                                     
                                        </select>
							                  工号：<input >
																姓名：<input >	
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
									      <th class="sorting">部门</th>
									      <th class="sorting">手机号</th>
									      <th class="sorting">邮箱</th>
									      <th class="sorting">入职时间</th>
									      <th class="sorting">状态</th>									     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr>
			                              <td><input  type="checkbox"></td>			                              
				                          
									      <td>20150311</td>
									      <td>张安</td>
									      <td>销售部</td>
												<td>17853668483</td>
									      <td>17853668483@163.com</td>
									      <td>2019-03-11</td>
		                                  <td>
		                                  	<span>
		                                  		正常
		                                  	</span>
		                                  	<span >
		                                  		离职
		                                  	</span>
		                            
		                                  </td>		                                  
		                                  <td class="text-center">                                          
		                                 	  <button type="button" class="btn bg-olive btn-xs">修改</button>                  
		                                  </td>
			                          </tr>
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
                  <h3 id="myModalLabel">员工编辑</h3>
              </div>
              <div class="modal-body">
                  <table class="table table-bordered table-striped"  width="800px">
                      <tr>
                          <td>工号</td>
                          <td>20150311  </td>
                      </tr>
                      <tr>
                          <td>姓名</td>
                          <td><input  class="form-control" placeholder="姓名" >  </td>
                      </tr>
                      <tr>
                          <td>部门</td>
                          <td><input  class="form-control" placeholder="部门">  </td>
                      </tr>
                      <tr>
                          <td>手机号</td>
                          <td><input  class="form-control" placeholder="手机号">  </td>
                      </tr>
                      <tr>
                          <td>邮箱</td>
                          <td><input  class="form-control" placeholder="邮箱">  </td>
                      </tr>
                      <tr>
                          <td>入职时间</td>
                          <td><input  class="form-control" placeholder="入职时间" onclick="createTime()">  </td>
                      </tr>
                      <tr>
                          <td>状态</td>
                          <td>
                              正常<input type="radio" name="status" checked style="margin: 0px 5px;">
                              离职<input type="radio" name="status" style="margin: 0px 5px;">
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
</script>
</html>