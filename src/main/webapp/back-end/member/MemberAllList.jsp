<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.member.bean.MemberVO"%>
<%@ page import="web.member.bean.DiscountVO"%>
<%@ page import="web.member.service.MemberService"%>
<%@ page import="web.member.service.impl.MemberServiceImpl"%>

<% 
    MemberServiceImpl memberSvc = new MemberServiceImpl();
	List<MemberVO> list = memberSvc.getAll();
	pageContext.setAttribute("list",list);

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ROYAL CLASS PANDORA_會員資料</title>


    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/member/css/adminlte.min.css" />

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
                                    <a href="#">會員資料</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    EMP Page
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
                                        會員資料表

                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="container">


                                    <table id="table" data-toggle="table" data-search="true" data-filter-control="true"
                                        data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                        <thead>
                                            <tr>

                                                <th data-field="Member_ID" data-filter-control="input"
                                                    data-sortable="true">會員編號</th>
                                                <th data-field="Member_EMAIL" data-filter-control="select"
                                                    data-sortable="true">帳號(E-MAIL)</th>
                                                <th data-field="Member_Password" data-filter-control="select"
                                                    data-sortable="true">密碼</th>
                                                <th data-field="Chinese_Name" data-filter-control="select"
                                                    data-sortable="true">中文姓名</th>
                                                <th data-field="Englis_Last_Name" data-filter-control="select"
                                                    data-sortable="true">英文姓氏
                                                </th>
                                                <th data-field="Englis_First_Name" data-filter-control="select"
                                                    data-sortable="true">英文姓名</th>
                                                <th data-field="Member_Phone" data-filter-control="select"
                                                    data-sortable="true">電話</th>
                                                <th data-field="Gender" data-filter-control="select"
                                                    data-sortable="true">性別</th>
                                                <th data-field="Member_Birthdy" data-filter-control="select"
                                                    data-sortable="true">生日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                <th data-field="Passport_No" data-filter-control="select"
                                                    data-sortable="true">護照號碼</th>
                                                <th data-field="Address" data-filter-control="select"
                                                    data-sortable="true">地址&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</th>
                                                <th data-field="Register_Date" data-filter-control="select"
                                                    data-sortable="true">註冊時間</th>
                                                <th data-field="Last_Update_Date" data-filter-control="select"
                                                    data-sortable="true">最後修改時間</th>
                                                <th data-field="Member_Level" data-filter-control="select"
                                                    data-sortable="true">等級&nbsp;&nbsp;</th>
                                                <th data-field="Member_Accumulated_Consumption" data-filter-control="select"
                                                    data-sortable="true">累積消費金額</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="MemberVO" items="${list}">
                                            <tr>
                                                <td>${MemberVO.memberId}</td>
                                                <td>${MemberVO.memberEmail}</td>
                                                <td>${MemberVO.memberPassword}</td>
                                                <td>${MemberVO.chineseName}</td>
                                                <td>${MemberVO.memberEnglishLastName}</td>
                                                <td>${MemberVO.memberEnglishFirstName}</td>
                                                <td>${MemberVO.memberPhoneNumber}</td>
                                                <td>${MemberVO.gender}</td>
                                                <td>${MemberVO.memberBirthday}</td>
                                                <td>${MemberVO.memberPassportNo}</td>
                                                <td>${MemberVO.memberAddress}</td>
                                                <td>${MemberVO.registrationTime}</td>
                                                <td>${MemberVO.lastUpdateDate}</td>
                                                <td>${MemberVO.discountNo}</td>
                                                <td>${MemberVO.accumulatedConsumption}</td>
                                            </tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                    <input type="button" name="EMPregister" value="新增會員" text-align=center
                                        style="margin-right: 0%;width:250px;float: right;"
                                        onclick="javascript:window.location.href='https://www.mcdelivery.com.tw/tw/browse/menu.html?daypartId=45&catId=97&ds_rl=1286001&gclid=CjwKCAjww8mWBhABEiwAl6-2RemLn9LCVipc4JLKDeA_Ud3tKTr2dqyx9NsxZvXjWgzORY4Ke2oGlxoCE-EQAvD_BwE&gclsrc=aw.ds'" />
                                </div>

                                </tfoot>
                                <div style="width:100%;text-align:center">
                                    <input style="display:inline-block;width:150px" type="button"
                                        onclick="history.go(-1)" value="上一頁"></input>
                                    <input style="display:inline-block;width:150px" type="button"
                                        onclick="history.forward()" value="下一頁">
                                </div>


                            </div>

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
    <script src="<%=request.getContextPath()%>/back-end/emp/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<%=request.getContextPath()%>/back-end/emp/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/back-end/member/js/adminlte.js"></script>
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
</body>

</html>