<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>公告管理</title>
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
                        <h3 class="box-title">公告管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新增" ><i class="fa fa-file-o"></i> 新增</button>
                                        <button type="button" class="btn btn-default" title="删除" ><i class="fa fa-trash-o"></i> 删除</button>
                                        
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                  发布日期：<input type="text" placeholder="日期" onclick="createTime()">
							                  发布人工号：<input type="text" placeholder="工号">
																发布人姓名：<input type="text" placeholder="姓名">
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
										  <th class="sorting_asc">编号</th>
									      <th class="sorting">发布人</th>
									      <th class="sorting">发布内容</th>
									      <th class="sorting">发布日期</th>
									  
									      <th class="sorting">状态</th>									     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr>
			                              <td><input  type="checkbox"></td>			                              
				                          
									      <td>102</td>
									      <td>张安</td>
									      <td>销售部喜欢红色经典款基督教福克斯开户行的</td>
												<td>2019-03-11</td>
									     
		                                  <td>
		                                  	<span>
		                                  		发送成功
		                                  	</span>
		                                  	<span >
		                                  		发送失败
		                                  	</span>
		                            
		                                  </td>		                                  
		                                  <td class="text-center">                                          
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal">查看详情</button>
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
                  <h3 id="myModalLabel">公告详情</h3>
              </div>
              <div class="modal-body">
                  <table class="table table-bordered table-striped"  width="800px">
                      <tr>
                          <td>编号</td>
                          <td>102</td>
                      </tr>
                      <tr>
                          <td>发布人</td>
                          <td>张安</td>
                      </tr>
                      <tr>
                          <td>发布内容</td>
                          <td>
							  <textarea  rows="10" cols="60" readonly="readonly">
销售部喜欢红色经典款基督教福克斯开户行的销售部喜欢红色经典款基督教福克斯开户行的
							  </textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>发布日期</td>
                          <td>2019-03-11</td>
                      </tr>
                      <tr>
                          <td>状态</td>
                          <td>发送成功</td>
                      </tr>

                  </table>
              </div>
              <div class="modal-footer">

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