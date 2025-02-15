<%@ page import="web.packages.dao.impl.PackagesDAOImpl" %>
<%@ page import="web.packages.service.impl.PackagesServiceImpl"%>
<%@ page import="web.packages.service.PackagesService"%>
<%@ page import="web.packages.bean.PackagesVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.time.format.DateTimeFormatter" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%	
	PackagesDAOImpl packagesDAO = new PackagesDAOImpl();
	List<PackagesVO> packagesList = packagesDAO.getALLList();
	pageContext.setAttribute("packagesList", packagesList);
	request.setAttribute("dateTimeFormat", DateTimeFormatter.ofPattern("yyyy年MM月dd日HH點mm分"));
%>


<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ROYAL CLASS PANDORA_行程資料表</title>


    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Theme style -->
    <link rel="stylesheet" href="css/adminlte.css" />

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
                    <a class="nav-link" data-widget="login-out" href="<%=request.getContextPath()%>/EmpLoginServlet?action=EMPSignOut" role="button">
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
                                    行程資訊管理
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

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- jquery validation -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        行程資訊管理 &ensp; <span style="font-size:12px">-新增/編輯</span>
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="container">


                                    <table id="table" data-toggle="table" data-search="true" data-filter-control="true"
                                        data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                        <thead>
                                            <tr>

                                                <th data-field="Package_No" data-filter-control="input"
                                                    data-sortable="true">行程編號</th>
                                                <th data-field="Package_Name" data-filter-control="select"
                                                    data-sortable="true">行程名稱</th>
                                                <th data-field="Ship_NO" data-filter-control="select"
                                                    data-sortable="true">郵輪編號 </th>
                                                <th data-field="Cruise_Line_No" data-filter-control="select"
                                                    data-sortable="true">航線編號</th>
                                                <th data-field="startime" data-filter-control="select"
                                                    data-sortable="true">啟航日期</th>
                                                <th data-field="endtime" data-filter-control="select"
                                                    data-sortable="true">結束日期</th>
                                                <th data-field="Duration" data-filter-control="select"
                                                    data-sortable="true">天數</th>
                                                <th data-field="Registration_Start_Time" data-filter-control="select"
                                                    data-sortable="true">上架時間</th>
                                                <th data-field="Registration_Dead_Time" data-filter-control="select"
                                                    data-sortable="true">下架時間</th>


                                           
                                                <th></th>



                                            </tr>
                                        </thead>
                                     
                                        <tbody>  
                          <%@ include file="page1.file" %>                  
                                         <c:forEach var="PackageVO" items="${packagesList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">                                                                          
                                            <tr>
                                                <td>${PackageVO.packageNo}</td>
                                                <td>${PackageVO.packageName}</td>
                                                <td>${PackageVO.shipNo}</td>
                                                <td>${PackageVO.cruiseLineNo}</td>
                                                <td>${PackageVO.departureTime.format(dateTimeFormat)}</td>
                                                <td>${PackageVO.arrivalTime.format(dateTimeFormat)}</td>
                                                <td>${PackageVO.duration}</td>
                                                <td>${PackageVO.registrationStartTime}</td>
                                                <td>${PackageVO.registrationDeadTime}</td>
                                              
                                                <td>
                                                <form method="Post" action="<%=request.getContextPath()%>/EmpLoginServlet">	
                                                 <input type="submit" value="編輯"  style="width:100%;height:100%;color:#fff;background-color:#007bff;border-color:#fff">
                                                 <input type="hidden" name="packageNo" value="$PackageVO.packageNo}">
			    				 				 <input type="hidden" name="action"	value="EMPGetOneForUpdate">
                                               	<input type="hidden" name="loginUser" value="${loginUser}">
                                               </form>
                                                </td>
                                            </tr>          
                                       </c:forEach>                                                            
                                        </tbody>
                                     
                                    </table>
                                   
                                     <a href="<%=request.getContextPath()%>/PackagesBackEndServlet?action=packageADD" class="nav-link">
                                        <input type="button" name="packageADD"  value="新增行程" text-align=center style="margin-right: 0%;width:250px;float: right;">
                                    </a>
                                    
                                </div>
						  
                                </tfoot>
                                
<!--                                 <div style="width:100%;text-align:center"> -->
<!--                                     <input style="display:inline-block;width:150px" type="button" -->
<!--                                         onclick="history.go(-1)" value="上一頁"></input> -->
<!--                                     <input style="display:inline-block;width:150px" type="button" -->
<!--                                         onclick="history.forward()" value="下一頁"> -->
<!--                                 </div> -->
                            </div>
                            <%@ include file="page2.file" %>

                        </div>
                        <!-- /.card -->
                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-6"></div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
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
        <!-- Default to the left -->
        <!-- <strong
                    >Copyright &copy; 2014-2021
                    <a href="https://adminlte.io">AdminLTE.io</a>.</strong
                >
                All rights reserved. -->
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
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="js/adminlte.js"></script>
    <script>
        //exporte les données sélectionnées
        var $table = $('#table');


        var trBoldBlue = $(" table"); $(trBoldBlue).on("click", "tr", function () {
            $(this).toggleClass("bold-blue");
        }); 
    </script>

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
</body>

</html>