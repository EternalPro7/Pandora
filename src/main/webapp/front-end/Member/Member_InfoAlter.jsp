<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.bean.*"%>
<%@page import="web.member.bean.MemberVO"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="description"
      content="Citytours - Premium site template for city tours agencies, transfers and tickets."
    />
    <meta name="author" content="Ansonika" />
    <title>會員資料修改</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      href="img/apple-touch-icon-57x57-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="72x72"
      href="img/apple-touch-icon-72x72-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="114x114"
      href="img/apple-touch-icon-114x114-precomposed.png"
    />
    <link
      rel="apple-touch-icon"
      type="image/x-icon"
      sizes="144x144"
      href="img/apple-touch-icon-144x144-precomposed.png"
    />

    <!-- GOOGLE WEB FONT -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/front-end/Member/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/Member/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/Member/css/vendors.css" rel="stylesheet" />

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/front-end/Member/css/custom.css" rel="stylesheet" />
    <style>
      #sexOption {
        margin-right: 5px;
        margin-top: 10px;
      }
      .verifyImg {
        display: inline-block;
        width: 80px;
        height: 26px;
        vertical-align: top;
        border: 1px solid rgb(91, 91, 91);
      }
      #hero.login {
        height: auto;
        display: block;
        text-transform: none;
        font-size: 14px;
        background: url(https://www.celebritycruises.com/content/dam/celebrity/new-images/ships/celebrity-fleet-image-ships-v2-2560x1440.jpg)
          no-repeat center center;
        background-size: cover;
      }
      #twzipcode.form-row {
        display: flex;
        align-items: flex-end;
        flex-direction: row;
      }
      .address {
        margin-right: 10px;
      }
      .mbInfotext {
        display: flex;
        margin-top: 10px;
      }
      .mbImg {
        border: none;
        font-family: inherit;
        font-size: inherit;
        color: #fff;
        width: 40%;
        background: #0064b5;
        cursor: pointer;
        padding: 12px 20px;
        display: inline-block;
        outline: none;
        font-size: 12px;
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        transition: all 0.3s;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        text-transform: uppercase;
        font-weight: bold;
        display: block;
        text-align: center;
        margin-bottom: 10px;
      }
    </style>
  </head>
  <body>
<!--     <div id="preloader"> -->
<!--       <div class="sk-spinner sk-spinner-wave"> -->
<!--         <div class="sk-rect1"></div> -->
<!--         <div class="sk-rect2"></div> -->
<!--         <div class="sk-rect3"></div> -->
<!--         <div class="sk-rect4"></div> -->
<!--         <div class="sk-rect5"></div> -->
<!--       </div> -->
<!--     </div> -->
    <!-- End Preload -->

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <!-- Header================================================== -->
    <header>
    <div id="top_line">
      <div class="container">
        <div class="row">
          <div class="col-6">
            <i class="icon-phone"></i><strong>02 23456789</strong>
          </div>
          <div class="col-6">
            <ul id="top_links">
              <li>
              	
                <font>${loginMember.memberEnglishLastName}&nbsp${loginMember.memberEnglishFirstName}</font>  
                
              </li>
              <li>
              	<a href="<%=request.getContextPath()%>/MemberLoginServlet?action=MemberSignOut">
              		登出<i class="icon-logout-1" id="logout"></i>
              	</a>
              </li>
              <li><a href="wishlist.html" id="wishlist_link">聯絡我們</a></li>
            </ul>
          </div>
        </div>
        <!-- End row -->
      </div>
      <!-- End container-->
    </div>
    <!-- End top line-->

    <div class="container">
      <div class="row">
        <div class="col-3">
          <div id="logo_home">
            <h1>
              <a href="index7.html" title="Welcome to royal Pandora">Welcome to royal Pandora</a>
            </h1>
          </div>
        </div>
        <nav class="col-9">
          <a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>選單</span></a>
          <div class="main-menu">
            <div id="header_menu">
              <img src="./img/logo.png" width="160" height="34" alt="City tours" />
            </div>
            <a href="#" class="open_close" id="close_in"><i class="icon_set_1_icon-77"></i></a>
            <ul>
              <li class="submenu" style="margin: 0 0 0 75px;">
                <a href="javascript:void(0);" class="show-submenu " style="width: 100px;">行程管理
                </a>
              </li>
              <li class="submenu">
                <a href="javascript:void(0);" class="show-submenu" style="width: 100px;">郵輪介紹
                </a>
              </li>
              <li class="submenu">
                <a href="javascript:void(0);" class="show-submenu" style="width: 100px;">活動新訊
                </a>
              </li>
              <li class="megamenu submenu">
                <a href="javascript:void(0);" class="show-submenu-mega" style="width: 100px;">旅遊資訊</a>

                <!-- End row -->

                <!-- End menu-wrapper -->
              </li>
              <li class="submenu">
                <a href="javascript:void(0);" class="show-submenu">會員中心<i class="icon-down-open-mini"></i></a>
                <ul>
                  <li>
                  	<a href="<%=request.getContextPath()%>/MemberLoginServlet?action=GetOneMember" class="nav-link" >會員資訊</a>
                  </li>
                  <li>
                    <a href="all_restaurants_grid.html">會員資料修改</a>
                  </li>
                  <li>
                    <a href="all_restaurants_grid_masonry.html">密碼更改</a>
                  </li>
                  <li>
                    <a href="all_restaurants_map_listing.html">訂單查詢修改</a>
                  </li>
                  <li>
                    <a href="single_restaurant.html">聊天室</a>
                  </li>
                  <li>
                    <a href="payment_restaurant.html">討論區</a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
          <!-- End main-menu -->
          <ul id="top_tools">
            <li>
              <div class="dropdown dropdown-cart">
                <a href="#" data-bs-toggle="dropdown" class="cart_bt"><i class="icon_bag_alt"></i><strong>8</strong></a>
                <ul class="dropdown-menu" id="cart_items">
                  <li>
                    <div class="image">
                      <img src="img/thumb_cart_1.jpg" alt="image" />
                    </div>
                    <strong><a href="#">Louvre museum</a>1x $36.00 </strong>
                    <a href="#" class="action"><i class="icon-trash"></i></a>
                  </li>
                  <li>
                    <div class="image">
                      <img src="img/thumb_cart_2.jpg" alt="image" />
                    </div>
                    <strong><a href="#">Versailles tour</a>2x $36.00 </strong>
                    <a href="#" class="action"><i class="icon-trash"></i></a>
                  </li>
                  <li>
                    <div class="image">
                      <img src="img/thumb_cart_3.jpg" alt="image" />
                    </div>
                    <strong><a href="#">Versailles tour</a>1x $36.00 </strong>
                    <a href="#" class="action"><i class="icon-trash"></i></a>
                  </li>
                  <li>
                    <div>合計: <span>$120.00</span></div>
                    <a href="cart.html" class="button_drop">前往購物車</a>
                    <a href="payment.html" class="button_drop outline">退出</a>
                  </li>
                </ul>
              </div>
              <!-- End dropdown-cart-->
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- container -->
  </header>
  <!-- End Header -->

    <main>
      <form action="<%=request.getContextPath()%>/MemberLoginServlet" method="Post" enctype="multipart/form-data" >
      <section id="hero" class="login" style="background: url('https://picsum.photos/1903/800?random=5')">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-5 col-md-6 col-sm-8">
              <div id="login">
                <div class="text-center">
                  <img
                    src="<%=request.getContextPath()%>/front-end/Member/img/logo_sticky_2x.png"
                    alt="Image"
                    width="160"
                    height="34"
                  />
                  <h3>會員資料修改</h3>
                </div>
                <hr />
                
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                      
                      	<div style="display:none">${loginMember.memberId}</div>
                      	
                        <label>中文姓名*</label>
                        <input type="text" class="form-control" id="firstname_booking" name="chineseName"
                          value="${loginMember.chineseName}"/>
                        <font class="text-danger">${errorMsgsMap["chineseName"]}</font>
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>出生日期＊</label>
                        <input readonly class="date-pick form-control" type="date" name="memberBirthday" value="${loginMember.memberBirthday}">                                                 
                        <font class="text-danger">${errorMsgsMap["memberBirthday"]}</font>
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>護照英文名字*</label>
                        <input type="text" class="form-control" id="firstname_booking" name="memberEnglishLastName"
                          value="${loginMember.memberEnglishLastName}" />
                         <font class="text-danger">${errorMsgsMap["memberEnglishLastName"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>護照英文姓氏*</label>
                        <input type="text" class="form-control" id="firstname_booking" name="memberEnglishFirstName"
                          value="${loginMember.memberEnglishFirstName}" />
                        <font class="text-danger">${errorMsgsMap["memberEnglishFirstName"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>護照號碼*</label>
                        <input readonly type="text" class="form-control" id="firstname_booking" name="memberPassportNo"
                          value="${loginMember.memberPassportNo}" />
                        <font class="text-danger">${errorMsgsMap["memberPassportNo"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>身分證字號*</label>
                        <input readonly type="text" class="form-control" id="firstname_booking" name="memberIdNo"
                          value="${loginMember.memberIdNo}" />
                        <font class="text-danger">${errorMsgsMap["memberIdNo"]}</font>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>手機號碼*</label>
                        <input readonly type="text" class="form-control" id="firstname_booking" name="memberPhoneNumber"
                          value="${loginMember.memberPhoneNumber}" />
                        <font class="text-danger">${errorMsgsMap["memberPhoneNumber"]}</font>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>性別</label>
                        <input readonly type="text" class="form-control" id="firstname_booking" name="membergender"
                          value="${loginMember.gender}" />
                      </div>
                    </div>
                  </div>

<!--                   <div id="twzipcode" class="form-row"> -->
<!--                     <div class="form-group col-2"> -->
<!--                       <label>地址</label> -->
<!--                       <div class="address" data-role="county" data-style="form-control" data-name="county" data-value="台北市" ></div> -->
<!--                     </div> -->
<!--                     <div class="form-group col-2"> -->
<!--                       <div -->
<!--                         class="address" -->
<!--                         data-role="district" -->
<!--                         data-style="form-control" -->
<!--                         data-name="district" -->
<!--                         data-value="中正區" -->
<!--                       ></div> -->
<!--                     </div> -->
<!--                     <div class="form-group col-2"> -->
<!--                       <div -->
<!--                         data-role="zipcode" -->
<!--                         data-style="form-control" -->
<!--                         data-name="zipcode" -->
<!--                         data-value="100" -->
<!--                       ></div> -->
<!--                     </div> -->
<!--                   </div> -->
                  <div class="form-group">
                    <input type="text" class="form-control" id="inputAddress2" placeholder="居住地址" name="memberAddress"
                      value="${loginMember.memberAddress}"/>
					<font class="text-danger">${errorMsgsMap["memberAddress"]}</font>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>上傳照片＊</label>
                        <input type="file" name="memberPictureId" />
                      </div>
                    </div>
                  </div>
                  <div class="row d-flex justify-content-center">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <button class="btn_full col-sm-6" type="submit" name="action" value="MemberUpdate">確認</button>
						<input type="hidden" name="memberId" value="${loginMember.memberId}">
						<input type="hidden" name="discountNo" value="${loginMember.discountNo}">
						<input type="hidden" name="memberEmail" value="${loginMember.memberEmail}">
						<input type="hidden" name="accumulatedConsumption" value="${loginMember.accumulatedConsumption}">
						<input type="hidden" name="memberPassword" value="${loginMember.memberPassword}">
						<input type="hidden" name="registrationTime" value="${loginMember.registrationTime}">
						
                      </div>
                    </div>
                  </div>
                
              </div>
            </div>
          </div>
        </div>
      </section>
      </form>
    </main>
    <!-- End main -->

    <footer class="revealed">
      <div class="container">
        <!-- End row -->
        <div class="row">
          <div class="col-md-12">
            <div id="social_footer">
              <p>© Pandora 2022</p>
            </div>
          </div>
        </div>
        <!-- End row -->
      </div>
      <!-- End container -->
    </footer>
    <!-- End footer -->


    <!-- Common scripts -->
    <script src="<%=request.getContextPath()%>/front-end/Member/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/js/functions.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/Member/https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
    <!-- Specific scripts -->
    <script src="<%=request.getContextPath()%>/front-end/Member/js/pw_strenght.js"></script>
    <script>
      function myFunction() {
        var input = $("#datePicker").val();
        var birthday = new Date(input.replace(/-/g, "\/"));
        var birthYear = birthday.getFullYear();
        var birthMonth = birthday.getMonth();
        var birthDay = birthday.getDate();
        var today = new Date();
        var currentYear = today.getFullYear();
        var age = currentYear - birthYear;

        if (
          today.getMonth() < birthMonth ||
          (today.getMonth() == birthMonth && today.getDate() < birthDay)
        ) {
          age--;
        }
      }
    </script>

    <script>
      $("#twzipcode").twzipcode({});
    </script>
  </body>
</html>
