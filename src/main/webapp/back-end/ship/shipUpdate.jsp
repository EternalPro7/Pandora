<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@page import="web.ship.bean.ShipsVO"%>
<%@ page import="web.ship.dao.impl.ShipStatusDAOImpl"%>
<%@ page import="web.ship.bean.ShipStatusVO"%>
<%@ page import="web.ship.dao.impl.RoomTotalDAOImpl" %>
<%@ page import="web.ship.bean.RoomTotalVO" %>
<%
	ShipsVO shipsVO = (ShipsVO) request.getAttribute("shipsVO");
	ShipStatusDAOImpl stSVC =new ShipStatusDAOImpl();
	List<ShipStatusVO> list = stSVC.getAll();
	pageContext.setAttribute("list",list);
	RoomTotalDAOImpl rtSVC =new RoomTotalDAOImpl();
	List<RoomTotalVO> listRT = rtSVC.getShipAll(shipsVO.getShipNo());
	pageContext.setAttribute("listRT",listRT);
%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ROYAL CLASS PANDORA_後台系統</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/ship/css/adminlte.css" />
    <style>
        .content{
            width: 100%;
            padding: 2em;
        }
        .bold-blue {
            font-weight: bold;
            color: #0277BD;
        }
        #preview {
            border: 1px solid lightgray;
        }
        #preview span.text {
            color: lightgray;
        }
        
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <!-- 主要開發區塊 -->
    <div class="wrapper">
        <!-- Navbar header區塊-->
        <nav id="navbar-header" class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                </div>
                <li class="nav-item">
                    <a class="nav-link" data-widget="login-out" href="#" role="button">
                        <i class="fas fa-arrow-right-from-bracket"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container 主側邊欄-->
        <%@ include file="/back-end/aside.jsp" %>
        <!-- Content Wrapper. Contains page content 主頁面欄位-->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">PANDORA後台系統 </h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">
                                    <a href="#">行程管理</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    郵輪更新
                                </li>
                            </ol>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->
			<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">請修正以下錯誤:</font>
					<ul>
					    <c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
            <!-- Main content -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        郵輪更新
                                    </h3>
                                </div>
                                <div class="container">
                                <FORM METHOD="post" action="<%=request.getContextPath()%>/ShipServlet" >
                                	<div class="row">
                                    	<div class="col-md-12">
                                    
	                                        <table id="table" data-toggle="table" data-search="false" data-filter-control="true"
	                                            data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
	                                            <thead>
	                                                <tr>
	                                                    <th data-field="shipNo" data-filter-control="input"
	                                                    >郵輪編號</th>
	                                                <th data-field="shipName" data-filter-control="select"
	                                                    >郵輪名稱</th>
	                                                <th data-field="starStatus" data-filter-control="select"
	                                                    >啟用日期
	                                                </th>
	                                                <th data-field="lastMaintenanceTime" data-filter-control="select"
	                                                    >
	                                                    最後維護時間</th>
	                                                <th data-field="floorOfShip" data-filter-control="select"
	                                                    >樓層</th>
	                                                <th data-field="shipStatus" data-filter-control="select"
	                                                    >郵輪狀態</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td > <input type="hidden" name="shipNo" value="<%=shipsVO.getShipNo() %>"><%=shipsVO.getShipNo() %> </td>
	                                                    <td><input name="shipname" type="text" value="<%=shipsVO.getShipName()%>"></td>
	                                                    <td > <input id="start_date"  name="shipstart" type="hidden" value="<%=shipsVO.getStarStatus() %>"><%=shipsVO.getStarStatus() %></td>
	                                                    <td><input id="end_date" name="shipmain" type="text" value="<%=shipsVO.getLastmaintenanceTime()%>"></td>
	                                                    <td><input name="shipfloor" type="text" value="<%=shipsVO.getFloorOfShip()%>"></td>
	                                                    <td>
	                                                        <select name="shipstatusNo">
		                                                        <c:forEach var="shipStatusVO" items="${list}">
																	<option value="${shipStatusVO.shipStatusNo}" ${(shipStatusVO.shipStatusNo==shipsVO.shipStatusNo)?'selected':'' } >${shipStatusVO.shipStatus}
																</c:forEach>
	                                                        </select>
	                                                    </td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                        </div>
	                                        	<div class="col-6">
	                                                <input type="hidden" name="action" value="update">
	                                                <input  class="col-6" class="offset-8" type="submit" name="updateS" value="確定更新" text-align=center
	                                                style="margin-right: 0%;width:250px; display:inline-block ;">
	                                          		</FORM>
                                          		</div>
                                          		<div class="col-6" style="display: flex; justify-content: flex-end;">
	                                                <FORM METHOD="post" action="<%=request.getContextPath()%>/ShipServlet" >
	                                                    <input name="shipNo" type="hidden" value="${shipsVO.shipNo }">
	                                                    <input type="hidden" name="action" value="insertRTTCBefore">
	                                                    <button class="btn btn-primary btn-sm" type="submit"
	                                                        style="width: 150px;">新增房型數量</button>
	                                                </form>
                                        		</div>
                                        	</div>
                                    </div>
	                                    <div class="row justify-content-center" style="margin-top: 10px;">
<!-- 	                                    <a>新增房間數量</a> -->
										<c:forEach var="rTVO" items="${listRT }">
											<label class="col-md-2" >
		                                        ${rTVO.roomType }
		                                    </label>
											<div class="col-md-2">
		                                        <label>房型數量</label>
		                                    </div>
		                                    <div class="col-md-2 mr-4">
		                                        <label>${rTVO.maxCountOfRoomType }</label>
		                                    </div>
											<div class="col-md-2">
		                                        <FORM METHOD="post" action="<%=request.getContextPath()%>/ShipServlet" >
		                                        	<input name="rTTCNo" type="hidden" value="${rTVO.rTTCNo }">
		                                            <input type="hidden" name="action" value="updateRTTCBefore">
		                                            <button class="btn btn-primary btn-sm update" type="submit"
		                                                style="width:100%;height:100%;">更新</button>
		                                        </form>
		                                    </div>
		                                    <div class="col-md-2">
		                                            <FORM METHOD="post" action="<%=request.getContextPath()%>/ShipServlet" >
			                                            <input name="rTTCNo" type="hidden" value="${rTVO.rTTCNo }">
			                                            <input name="shipNo" type="hidden" value="${rTVO.shipNo }">
			                                            <input type="hidden" name="action"  value="deleteRTTC">
			                                            <button class="btn btn-primary btn-sm update" type="submit"
			                                                style="width:100%;height:100%;" value="">刪除</button>
		                                        	</form>
		                                    </div>
										</c:forEach>
	                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- ============ Footer段落 ============ -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">
            Tibame_TGA102 第五組
        </div>
    </footer>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
    <!-- ============ Footer段落 ============ -->
    <!-- /.content-wrapper -->
    </div>
    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/back-end/ship/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<%=request.getContextPath()%>/back-end/ship/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/back-end/ship/js/adminlte.js"></script>
    <script>
        //exporte les données sélectionnées
        var $table = $('#table');
        var trBoldBlue = $(" table"); $(trBoldBlue).on("click", "tr", function () {
            $(this).toggleClass("bold-blue");
        }); </script>
    <!-- 上下頁 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://github.com/kayalshri/tableExport.jquery.plugin/blob/master/jquery.base64.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="https://unpkg.com/bootstrap-table@1.20.2/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
        <link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/ship/datetimepicker/jquery.datetimepicker.css" />
        <script src="<%=request.getContextPath()%>/back-end/ship/datetimepicker/jquery.datetimepicker.full.js"></script>
        <script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#start_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#end_date').val()?$('#end_date').val():false
	   })
	  },
	  timepicker:false
	 });
	 
	 $('#end_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#start_date').val()?$('#start_date').val():false
	   })
	  },
	  timepicker:false
	 });
});
</script>
</body>
</html>