<%@page import="web.forum.bean.ForumVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
  ForumVO forumVO = (ForumVO) request.getAttribute("forumVO"); //ForumServlet.java (Concroller) 存入req的forumVO物件 (包括幫忙取出的forumVO, 也包括輸入資料錯誤時的forumVO物件)
%>
<%= forumVO==null %>--${forumVO.postId}--


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
    <title>CITY TOURS - City tours and travel site template by Ansonika</title>

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
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/vendors.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/adminlte.css" />
    <!-- 引用後台css -->

    <!-- CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
      }
    </style>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  
  <!-- COMMON CSS -->
    <link href="<%=request.getContextPath()%>/front-end/forum/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/forum/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/front-end/forum/css/vendors.css" rel="stylesheet" />

    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/forum/css/adminlte.css" />
    <!-- 引用後台css -->

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/front-end/forum/css/custom.css" rel="stylesheet" />
    <style>
      #wishlist_link::before {
        content: "\e97a";
      }
    </style>
  
  </head>
  <body>
    <div id="preloader">
      <div class="sk-spinner sk-spinner-wave">
        <div class="sk-rect1"></div>
        <div class="sk-rect2"></div>
        <div class="sk-rect3"></div>
        <div class="sk-rect4"></div>
        <div class="sk-rect5"></div>
      </div>
    </div>
    <!-- End Preload -->

    <div class="layer"></div>
    <!-- Mobile menu overlay mask -->

    <!-- Header================================================== -->
    <header id="plan">
      <div id="top_line">
        <div class="container">
          <div class="row">
            <div class="col-6">
              <i class="icon-phone"></i><strong>02 23456789</strong>
            </div>
            <div class="col-6">
              <ul id="top_links">
                <li><a href="#sign-in-dialog" id="access_link">登入</a></li>
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
                <a href="index7.html" title="Welcome to royal Pandora"
                  >Welcome to royal Pandora</a
                >
              </h1>
            </div>
          </div>
          <nav class="col-9">
            <a
              class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
              href="javascript:void(0);"
              ><span>選單</span></a
            >
            <div class="main-menu">
              <div id="header_menu">
                <img
                  src="./img/logo.png"
                  width="160"
                  height="34"
                  alt="City tours"
                />
              </div>
              <a href="#" class="open_close" id="close_in"
                ><i class="icon_set_1_icon-77"></i
              ></a>
              <ul>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >行程管理
                  </a>
                </li>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >郵輪介紹
                  </a>
                </li>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >活動新訊
                  </a>
                </li>
                <li class="megamenu submenu">
                  <a href="javascript:void(0);" class="show-submenu-mega"
                    >旅遊資訊</a
                  >

                  <!-- End row -->

                  <!-- End menu-wrapper -->
                </li>
                <li class="submenu">
                  <a href="javascript:void(0);" class="show-submenu"
                    >會員中心<i class="icon-down-open-mini"></i
                  ></a>
                  <ul>
                    <li>
                      <a href="all_restaurants_list.html">會員資訊</a>
                    </li>
                    <li>
                      <a href="all_restaurants_grid.html">會員資料修改</a>
                    </li>
                    <li>
                      <a href="all_restaurants_grid_masonry.html">密碼更改</a>
                    </li>
                    <li>
                      <a href="all_restaurants_map_listing.html"
                        >訂單查詢修改</a
                      >
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
                  <a href="#" data-bs-toggle="dropdown" class="cart_bt"
                    ><i class="icon_bag_alt"></i><strong>8</strong></a
                  >
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
                      <a href="payment.html" class="button_drop outline"
                        >退出</a
                      >
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

    
    <!-- End hero -->

    <main>
      <div class="container">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ForumServlet" enctype='multipart/form-data'>
<!-- 					<input type="hidden" name="merberusing" -->
<%--                         value="<%=memberVO.getmemberId()%>"> --%>

					<div class="col-lg-10">
						<div class="card mb-7">
							<div class="card-body">
								<div class="mb-4">
									<label for="product_title" class="form-label">文章標題</label> 
									　　<input
										type="text" placeholder="Type here" class="form-control"
										id="product_title" name="postTitle"
										value="<%=(forumVO == null) ? "" : forumVO.getPostTitle()%>"/>
								</div>
								<div id="errMsg"></div>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
							</div>
						</div>
						<!-- card end// -->
						<div class="card mb-7">
							<div class="card-body">
								<div>
									<label for="article_content" class="form-label">文章內容</label>
									<textarea id="article_content" placeholder="Type here" class="form-control"
										rows="20" name="postContent" style="height: 300px"><%=(forumVO == null) ? "" : forumVO.getPostContent()%></textarea>
								</div>
								<div id="errMsg2"/></div>
							</div>
							<div class="card-body">
							
						<tr>
		
		<td><input type="hidden" name="memberId" size="45" value="<%=forumVO.getMemberId()%>" /></td>
	</tr>

<tr>
		
		<td><input type="hidden" name="postTime" size="45"	value="<%=forumVO.getPostTime()%>" /></td>
	</tr>
	
	<tr>
		
		<td><input type="hidden" name="clicks" size="45"	value="<%=forumVO.getClicks()%>" /></td>
	</tr>
	
<tr>
		
		<td><input type="hidden" name="status" size="45"	value="<%=forumVO.getStatus()%>" /></td>
	</tr>
<!-- 								<div class="mb-4"> -->
<!-- 									<label class="form-label">#HashTags</label> <input type="text" -->
<!-- 										placeholder="Type here" class="form-control" /> -->
<!-- 								</div> -->
<!-- 								<span>熱門#HashTags</span> <a href="#" -->
<!-- 									class="font-xs hover-up mr-15"><i -->
<!-- 									class="font-xs material-icons md-close text-body"></i> 兔兔這麼可愛</a> <a -->
<!-- 									href="#" class="font-xs hover-up mr-15"><i -->
<!-- 									class="font-xs material-icons md-close text-body"></i> 喵主子</a> <a -->
<!-- 									href="#" class="font-xs hover-up mr-15"><i -->
<!-- 									class="font-xs material-icons md-close text-body"></i> 黃金獵犬</a> -->

							</div>
						</div>
						<!-- card end// -->



						<div class="card mb-7">
							<div class="card-body">
								<div>


									<label class="form-label">上傳圖片</label> <input
										type="file" name="postPic" />
								</div>
							</div>
						</div>
						<div class="card mb-7"></div>

						<div>
<input type="hidden" name="action" value="update">
<input type="hidden" name="postId" value="<%=forumVO.getPostId()%>">
<input type="submit" value="送出修改"></FORM>
          
        </div>
      </div>
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

    <div id="toTop"></div>
    <!-- Back to top button -->

    <!-- Search Menu -->
    <div class="search-overlay-menu">
      <span class="search-overlay-close"
        ><i class="icon_set_1_icon-77"></i
      ></span>
      <form role="search" id="searchform" method="get">
        <input value="" name="q" type="text" placeholder="Search..." />
        <button type="submit"><i class="icon_set_1_icon-78"></i></button>
      </form>
    </div>
    <!-- End Search Menu -->

    <!-- Sign In Popup -->
    <div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
      <div class="small-dialog-header">
        <h3>Sign In</h3>
      </div>
      <form>
        <div class="sign-in-wrapper">
          <a href="#0" class="social_bt facebook">Login with Facebook</a>
          <a href="#0" class="social_bt google">Login with Google</a>
          <div class="divider"><span>Or</span></div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" name="email" id="email" />
            <i class="icon_mail_alt"></i>
          </div>
          <div class="form-group">
            <label>Password</label>
            <input
              type="password"
              class="form-control"
              name="password"
              id="password"
              value=""
            />
            <i class="icon_lock_alt"></i>
          </div>
          <div class="clearfix add_bottom_15">
            <div class="checkboxes float-start">
              <label class="container_check"
                >Remember me
                <input type="checkbox" />
                <span class="checkmark"></span>
              </label>
            </div>
            <div class="float-end">
              <a id="forgot" href="javascript:void(0);">Forgot Password?</a>
            </div>
          </div>
          <div class="text-center">
            <input type="submit" value="Log In" class="btn_login" />
          </div>
          <div class="text-center">
            Don’t have an account? <a href="javascript:void(0);">Sign up</a>
          </div>
          <div id="forgot_pw">
            <div class="form-group">
              <label>Please confirm login email below</label>
              <input
                type="email"
                class="form-control"
                name="email_forgot"
                id="email_forgot"
              />
              <i class="icon_mail_alt"></i>
            </div>
            <p>
              You will receive an email containing a link allowing you to reset
              your password to a new preferred one.
            </p>
            <div class="text-center">
              <input type="submit" value="Reset Password" class="btn_1" />
            </div>
          </div>
        </div>
      </form>
      <!--form -->
    </div>
    <!-- /Sign In Popup -->

    <!-- Common scripts -->
    <script src="<%=request.getContextPath()%>/front-end/forum/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/js/common_scripts_min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/forum/js/functions.js"></script>
    
    

    <!-- Specific scripts -->
    <script>
      $(function () {
        $("input.date-pick").daterangepicker(
          {
            autoUpdateInput: true,
            singleDatePicker: true,
            autoApply: true,
            minDate: new Date(),
            showCustomRangeLabel: false,
            locale: {
              format: "MM-DD-YYYY",
            },
          },
          function (start, end, label) {
            console.log(
              "New date range selected: " +
                start.format("YYYY-MM-DD") +
                " to " +
                end.format("DD-MM-YYYY") +
                " (predefined range: " +
                label +
                ")"
            );
          }
        );
      });
    </script>
    <script>
      $("input.time-pick").timepicker({
        minuteStep: 15,
        showInpunts: false,
      });
    </script>

    <script src="<%=request.getContextPath()%>/front-end/forum/js/jquery.ddslick.js"></script>
    <script>
      $("select.ddslick").each(function () {
        $(this).ddslick({
          showSelectedHTML: true,
        });
      });
    </script>

  </body>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</html>