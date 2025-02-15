<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description"
    content="Citytours - Premium site template for city tours agencies, transfers and tickets." />
  <meta name="author" content="Ansonika" />
  <title>Welcome to Royal Pandora</title>

  <!-- Favicons-->
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/Cart/html/img/favicon.ico" type="image/x-icon" />
  <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png" />
  <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png" />
  <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
    href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-114x114-precomposed.png" />
  <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
    href="<%=request.getContextPath()%>/Cart/html/img/apple-touch-icon-144x144-precomposed.png" />

  <!-- GOOGLE WEB FONT -->
  <link
    href="https://fonts.googleapis.com/css2?family=Gochi+Hand&family=Montserrat:wght@300;400;500;600;700&display=swap"
    rel="stylesheet" />

  <!-- COMMON CSS -->
  <link href="<%=request.getContextPath()%>/front-end/package/css/bootstrap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/front-end/package/css/style.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/front-end/package/css/vendors.css" rel="stylesheet" />

  <!-- CUSTOM CSS -->
  <link href="<%=request.getContextPath()%>/front-end/package/css/custom.css" rel="stylesheet" />

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
  <%@ include file="/front-end/header.jsp" %> 
  <!-- End Header -->
 <form action="<%=request.getContextPath()%>/IndexServlet" method="POST">
  <section id="search_container" style="background: url('https://picsum.photos/1903/800?random=5')">
    
   
    <div id="search">
      <ul class="nav nav-tabs">

        <li><a href="#hotels" data-bs-toggle="tab" class="active show">行程選擇</a></li>

      </ul>

      <div class="tab-content">

        <!-- End rab -->
        <div class="tab-pane active show" id="hotels">
          <h3>全球環遊</h3>

          <!-- End row -->
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                <label>出發地</label>
                <div class="styled-select-common">
               
       <select  name="Departure" id="departureID" class="departureSelect">
        			<option value="" selected></option>
         			<c:forEach var="departure" items="${departureDistinct}" >            		            	
         		   <option value="${departure}" ${departure==param["Departure"]?"selected":""}>
         		             	  ${departure}
         			</c:forEach>   
       </select>
                
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>目的地</label>
                <div class="styled-select-common">
                  <select  name="Destination" id="destinationID" class="destinationSelect" >
        			<option value="" selected></option>
        				 <c:forEach var="destination" items="${destinationDistinct}" > 
           		    <option value="${destination}" ${destination==param["Destination"]?"selected":""}>         		
         		          		    ${destination}      		
         		    
         				</c:forEach>   
       		     </select>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>出發年月</label>
                <div class="styled-select-common">
            <select  name="DepartureTime" id="departureTimeID" class="departureTimeSelect">
        			<option value="" selected></option>
        		<c:forEach var="departureTime" items="${departureTimeDistinct}" > 
           		            		
         		    <option value="${departureTime}">         		
         		          		    ${departureTime}
         		</c:forEach>   
       		</select>
                </div>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label>天數</label>
                <div class="styled-select-common">
                  <select name="Duration" id="durationID" class="durationSelect">
                    <option value="" selected></option>
                    <option value="5">1~5天</option>
                    <option value="10">6~9天</option>
                    <option value="20">10天以上</option>
                    
                  </select>
                </div>
              </div>
            </div>
          </div>
          <!-- End row -->
          <hr />
         		<button class="btn_1 green" type="submit" name="action" value="listPackagesByCompositeQuery" style=width:200px>查詢行程</button>
          </form>      
                <button type="button" class="btn_1 green" id="clearBtn" style=width:200px>清除</button></br>
				<div id="count"><i class="icon-search"></i>共有${fn:length(packageNoList)}個匹配行程</div>
        </div>
                  
        
	      </div>
      </div>
    </div>

  </section>
 
  <hr>
  <!-- End hero -->

  <main>

    <div class="container margin_60">
      <div class="main_title">
        <h2>旅遊行程</h2>
        <p>
          我們致力規劃您的美好旅程，每次的旅遊，不僅帶來回憶，更是身心靈的滿足。
        </p>
      </div>
      <main>
        <div class="container">
          <div class="row">
            <div class="col-6">
              <img src="https://picsum.photos/500/500?random=11" style="border-radius:40px;" alt="" />
            </div>
            <div class="col-6 justify-content-center align-items-center" style="display: flex">
              <div class="col">
                <p>
                  <span style="font-size:30px ;    background: linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
                        background: -webkit-linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
                         background-clip: text;
                        -webkit-background-clip: text;
                          color: transparent;
                       ;"><u>潘多拉ROYAL CLASS PANDORA</u></span>
                  </br>
                  PANDORA號航班密集且舒適，多為台灣環島航班，尤其適合國人攜家帶眷上船度假。一覺醒來，就到達旅遊國度，不用像搭飛機出國一般，要扛厚重的行李、擔心嬰兒或長輩搭長途飛機的不適和困擾。航程途中，有囊括了24小時玩樂&料理饗宴的各式服務，一切隨心玩樂，一票到底、超值享受－「美食＋住宿＋免機票＋無限玩樂」。
                  </br>
                  我想在每個人的青春年歲里，都曾有過一段關於旅行的憧憬，一段說走就走的旅行。可是在現實里，因為種種的原因，這個美好的希冀變成了每個午夜夢回的美好夢想。

                  如果，你還沒有踏上那條夢寐的旅途，不妨讓我們先欣賞由小編整理的關於旅行的唯美句子開始，用心聆聽文字裡的旅行意義。


                  </br>
                  大理的洱海形如人耳，風平浪靜時，像一顆深綠色的寶石鑲嵌在雲南大地上，微風吹過，海面上金光閃閃，泛起一道道美麗的浪花，嫵媚動人，讓我感受到了大自然的神奇。

                </p>

              </div>

            </div>
            <div class="col-6 justify-content-center align-items-center order-last" style="display: flex">
              <img src="https://picsum.photos/500/500?random=12" style="border-radius:40px;" alt="" />
            </div>
            <div class="col-6 aligen-item">
              <p style=" margin-top: 10%">
                潘朵拉打開魔盒，釋放出人世間的所有邪惡——貪婪、虛偽、誹謗、嫉妒、痛苦等等，
                宙斯要求潘朵拉不可以開，但是潘朵拉不敵好奇心的誘惑，還是偷偷的把盒子打開了，然而在盒子裡面裝的是許多不幸的事物——疾病、禍害等。潘朵拉把盒子打開後，原本寧靜沒有任何災害動亂的世界開始動盪不安起來，但潘多拉卻照眾神之王宙斯的旨意趁「希望」（希臘文Elpis）沒有來得及釋放時，在慌亂中趕緊蓋住盒子，結果盒內只剩希望沒飛出去，永遠鎖在盒內。因此即使人類不斷地受苦受難、遭遇種種挫折和折磨，希望都不會消失。
                有指潘朵拉關住的應該是「預兆」，因為預兆這個災禍被困在盒底，所以人類才擁有希望，不致於活在絕望當中；如果潘朵拉關住了希望，那麼人類世界應該是沒有希望，活在沒有前途、充滿了毀滅的世界中。但有說法認為這盒子裡除了裝有不幸的事物之外，同時也裝有友情、愛情等幸福的事物，象徵一切美好的事物都收藏於內，所以潘朵拉在蓋上盒子時才留住了希望。
                其實「盒子中保存希望」的寓意歷來在學界頗有爭議。如果災禍被釋放出盒子會帶給人類災禍，那希望未被釋放應該是「沒帶給人類希望」，那麼這段神話記載的意涵應該是更悲觀的，亦即：本出於善意而想少放一個災禍出去的潘朵拉反而誤把「希望」截留下來，人間因此毫無希望。還有另一個問題是，宙斯為何要在盒中一堆災禍裡摻入性質不同的「希望」？這又牽涉了其希臘原文「Elpis」的詞意，古希臘這個詞其實可表達「對壞事或好事的期望」。若是「對壞事的期望」，那就是一種讓人容易「擔驚受怕」的災禍；但即使當成「對好事的期望」（最接近「希望」），尼采也曾給出最黑暗的另類詮釋：宙斯就是想要人類受盡各種災禍折磨後仍抱持虛假的希望，以致於願意苟延殘喘而繼續遭受折磨。
              </p>
            </div>
          </div>
        </div>

      </main>
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
    <span class="search-overlay-close"><i class="icon_set_1_icon-77"></i></span>
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
          <input type="password" class="form-control" name="password" id="password" value="" />
          <i class="icon_lock_alt"></i>
        </div>
        <div class="clearfix add_bottom_15">
          <div class="checkboxes float-start">
            <label class="container_check">Remember me
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
            <input type="email" class="form-control" name="email_forgot" id="email_forgot" />
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

  <!-- Common scripts /Pandora/src/main/webapp/Cart/html-->
  <script src="<%=request.getContextPath()%>/front-end/package/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/Cart/html/js/common_scripts_min.js"></script>
  <script src="<%=request.getContextPath()%>/front-end/package/js/functions.js"></script>

  <!-- Specific scripts -->
  <script>
  $.ajax({
      url: "<%=request.getContextPath()%>/IndexServlet",
      method: "POST",
      data: { "action": "homePage" },
      dataType: "json",
      success: function(data){
//         console.log(data);
//         console.log("success");
//         let count = parseInt(data.destinationDistinct.length);
        let destinationAll='<option>請選擇</option>';
        for(let i = 0 ;i< parseInt(data.destinationDistinct.length);i++ ){
        	destinationAll+='<option value="'+data.destinationDistinct[i]+'">'+data.destinationDistinct[i]+'</option>';
        };
		$('.destinationSelect').html(destinationAll);
		let departurAll='<option>請選擇</option>';
        for(let j = 0 ;j< parseInt(data.departureDistinct.length);j++ ){
        	departurAll+='<option value="'+data.departureDistinct[j]+'">'+data.departureDistinct[j]+'</option>';
        };
		$('.departureSelect').html(departurAll);
		let departureTimeAll='<option>請選擇</option>';
        for(let k = 0 ;k< parseInt(data.departureTimeDistinct.length);k++ ){
        	departureTimeAll+='<option value="'+data.departureTimeDistinct[k]+'">'+data.departureTimeDistinct[k]+'</option>';
        };
		$('.departureTimeSelect').html(departureTimeAll);
		let durationAll='<option>請選擇</option><option value="5">1~5天</option><option value="10">6~9天</option><option value="20">10天以上</option>';
		$('.durationSelect').html(durationAll);
		let counts=data.size.length
		var count=document.getElementById("count");
			count.innerHTML= "共有"+counts+"個匹配行程";
      },
      error: function(xhr){
    	  console.log(xhr.responseText);
    	  console.log("error");
      }
  });
  $(function (){
	 
	  $("#departureID").change(function(){
// 		  alert($( this ).val())
		    var request=$.ajax({
			url: "<%=request.getContextPath()%>/PackagesServlet",
		 	method:"POST",											   				
		 	data:{"action":"updateOption","Departure":$( this ).val(),"Destination":$(destinationID).val(),"DepartureTime":$(departureTimeID).val(),"Duration":$(durationID).val()},
		 	dataType:"json"
			  
		  });
		  request.done(function(data){
// 		  	console.log(data)
// 		  	console.log(data.departureDistinct)
// 		  	console.log(data.packageNoList.length)
// 			console.log(data.Duration)
// 			console.log(data.departureTimeDistinct)

			let departureAll='<option>請選擇</option>';
			data.departureDistinct.forEach(function(departureDistinct){
    			if(data.departureDistinct.length>1){
    				departureAll += '<option>'+departureDistinct+'</option>'
		    	}else{
		    		departureAll =  '<option>'+departureDistinct+'</option>'
		    	}    				    		
		         			    		
       		});	
    		$('.departureSelect').html(departureAll); 
			let destinationAll='<option>請選擇</option>';
    		data.destinationDistinct.forEach(function(destination){
    			if(data.destinationDistinct.length>1){
    				destinationAll =  destinationAll + '<option>'+destination+'</option>'
		    	}else{
		    		destinationAll =  '<option>'+destination+'</option>'
		    	}    				    		
		         			    		
       		});												
    		$('.destinationSelect').html(destinationAll); 
	    		       
			let departureTimeAll='<option>請選擇</option>';
    		data.departureTimeDistinct.forEach(function(departureTime){
    			if(data.departureTimeDistinct.length>1){
    				departureTimeAll = departureTimeAll + '<option>'+departureTime+'</option>'
    			}else  {
    				departureTimeAll ='<option>'+departureTime+'</option>'
    			}  			    		 		
       		});
    		$('.departureTimeSelect').html(departureTimeAll); 
    		
    		
    		let durationAll='<option>請選擇</option>';
    		let durationShort='';
    		let durationMedium='';
    		let durationLong='';   	   	  	   		
    		    	
    		if(Number(Math.min(...data.Duration))<=5){
				durationShort='<option>1~5天</option>'
			};
		    if(Number(Math.max(...data.Duration))>10){
		    	durationLong='<option>10天以上</option>'
		    };
		    
		    data.Duration.forEach(function(duration){
		    	if(duration<10 && duration>5){
		    		durationMedium='<option>6~9天</option>'
		    	}
		    });	
		    durationAll +=durationShort+durationMedium+durationLong;
		    console.log(durationAll.length);
		    if(durationShort!==("") &&　durationMedium!==("")　&&　durationLong!==("")){
				durationAll +=durationShort+durationMedium+durationLong;
			}else if(durationShort!==("") &&　durationMedium!==("")){
				durationAll +=durationShort+durationMedium;
			}else if(durationMedium!==("")　&&　durationLong!==("")){
				durationAll +=durationMedium+durationLong;
			}else if(durationShort!==("")　&&　durationLong!==("")){
				durationAll +=durationShort+durationLong;
			}else if(durationShort!==("")){
				durationAll =durationShort;
			}else if(durationMedium!==("")){
				durationAll =durationMedium;
			}else{
				durationAll =durationLong;
			}
			$('.durationSelect').html(durationAll).distinct;
    		
    		let counts=data.size.length
    		var count=document.getElementById("count");
    			count.innerHTML= "共有"+counts+"個匹配行程";
    		
    	
		  }); 	//end of  request.done	
		 
	  }); //change departure event
	  
	  $("#destinationID").change(function(){
// 		  alert($( this ).val())
		  var request=$.ajax({
			url: "<%=request.getContextPath()%>/IndexServlet",
		 	method:"POST",				  
		 	data:{"action":"updateOption","Destination":$( this ).val(),"Departure":$(departureID).val(),"DepartureTime":$(departureTimeID).val(),"Duration":$(durationID).val()},
		 	dataType:"json"
			  
		  });
		  request.done(function(data){
// 		  	console.log(data)
// 		  	console.log(data.packageNoList.length)
// 			console.log(data.Duration)
// 			console.log(data.departureTimeDistinct)
			
			
			
			let departureAll='<option>請選擇</option>';
	    	data.departureDistinct.forEach(function(departure){
	    		if(data.departureDistinct.length>1){
	    			departureAll = departureAll+  '<option>'+departure+'</option>'
		    	}else{
		    		departureAll = '<option>'+departure+'</option>'
		    	}	    	
	    	 });
	    	
	    	$('.departureSelect').html(departureAll);	
	    	let destinationAll='<option>請選擇</option>';
    		data.destinationDistinct.forEach(function(destination){
    			if(data.destinationDistinct.length>1){
    				destinationAll =  destinationAll + '<option>'+destination+'</option>'
		    	}else{
		    		destinationAll =  '<option>'+destination+'</option>'
		    	}    				    		
		         			    		
       		});												
    		$('.destinationSelect').html(destinationAll);
// 			let destinationAll='<option></option>';
//     		data.destinationDistinct.forEach(function(destination){
//     			destinationAll = destinationAll + '<option>'+destination+'</option>'
//        		});												
//     		$('.destinationSelect').html(destinationAll); 
	    		       
			let departureTimeAll='<option>請選擇</option>';
    		data.departureTimeDistinct.forEach(function(departureTime){
    			if(data.departureTimeDistinct.length>1){
    				 departureTimeAll = departureTimeAll + '<option>'+departureTime+'</option>'
    			}else{
    				 departureTimeAll = '<option>'+departureTime+'</option>'
    			}
    				
    			 		 
       		});
    		$('.departureTimeSelect').html(departureTimeAll); 
    		
    		
    		let durationAll='<option>請選擇</option>';
    		let durationShort='';
    		let durationMedium='';
    		let durationLong='';   	   	  	   		
    		    	
    		if(Number(Math.min(...data.Duration))<=5){
				durationShort='<option>1~5天</option>'
			};
		    if(Number(Math.max(...data.Duration))>10){
		    	durationLong='<option>10天以上</option>'
		    };
		    
		    data.Duration.forEach(function(duration){
		    	if(duration<10 && duration>5){
		    		durationMedium='<option>6~9天</option>'
		    	}
		    });	
// 		    durationAll +=durationShort+durationMedium+durationLong;
		    console.log(durationAll.length);
		    if(durationShort!==("") &&　durationMedium!==("")　&&　durationLong!==("")){
				durationAll +=durationShort+durationMedium+durationLong;
			}else if(durationShort!==("") &&　durationMedium!==("")){
				durationAll +=durationShort+durationMedium;
			}else if(durationMedium!==("")　&&　durationLong!==("")){
				durationAll +=durationMedium+durationLong;
			}else if(durationShort!==("")　&&　durationLong!==("")){
				durationAll +=durationShort+durationLong;
			}else{
				durationAll =durationShort+durationMedium+durationLong;
			}
			$('.durationSelect').html(durationAll).distinct;
			
			let counts=data.size.length
    		var count=document.getElementById("count");
    			count.innerHTML= "共有"+counts+"個匹配行程";
    		
    	
		  }); 	//end of  request.done	
		 
	  }); // change destination
	  
	  
	  $("#departureTimeID").change(function(){
// 		  alert($( this ).val())
		  var request=$.ajax({
			url: "<%=request.getContextPath()%>/IndexServlet",
		 	method:"POST",				  	
		 	data:{"action":"updateOption","DepartureTime":$( this ).val(),"Departure":$(departureID).val(),"Destination":$(destinationID).val(),"Duration":$(durationID).val()},
		 	dataType:"json"
			  
		  });
		  request.done(function(data){
// 		  	console.log(data)
// 		  	console.log(data.packageNoList.length)
// 			console.log(data.Duration)
// 			console.log(data.departureTimeDistinct)
			
			
			
			let departureAll='<option>請選擇</option>';
	    	data.departureDistinct.forEach(function(departure){
	    	if(data.departureDistinct.length>1){
	    		departureAll = departureAll+  '<option>'+departure+'</option>'
	    	}else{
	    		departureAll ='<option>'+departure+'</option>'
	    	}
	    		
		        	
	    	 });
	    	
	    	$('.departureSelect').html(departureAll);	

			let destinationAll='<option>請選擇</option>';			
    		data.destinationDistinct.forEach(function(destination){
    		if(data.destinationDistinct.length>1){
    			destinationAll = destinationAll +'<option>'+destination+'</option>'
    		}else{
    			destinationAll ='<option>'+destination+'</option>'
    		}
    		
		    	       			
       		});												
    		$('.destinationSelect').html(destinationAll); 
	  		      
    	
    		let durationAll='<option>請選擇</option>';
    		let durationShort='';
    		let durationMedium='';
    		let durationLong='';   	   	  	   		
    		    	
    		if(Number(Math.min(...data.Duration))<=5){
				durationShort='<option>1~5天</option>'
			};
		    if(Number(Math.max(...data.Duration))>10){
		    	durationLong='<option>10天以上</option>'
		    };
		    
		    data.Duration.forEach(function(duration){
		    	if(duration<10 && duration>5){
		    		durationMedium='<option>6~9天</option>'
		    	}
		    });	
		    durationAll +=durationShort+durationMedium+durationLong;
		    console.log(durationAll.length);
		    if(durationShort!==("") &&　durationMedium!==("")　&&　durationLong!==("")){
				durationAll +=durationShort+durationMedium+durationLong;
			}else if(durationShort!==("") &&　durationMedium!==("")){
				durationAll +=durationShort+durationMedium;
			}else if(durationMedium!==("")　&&　durationLong!==("")){
				durationAll +=durationMedium+durationLong;
			}else if(durationShort!==("")　&&　durationLong!==("")){
				durationAll +=durationShort+durationLong;
			}else if(durationShort!==("")){
				durationAll =durationShort;
			}else if(durationMedium!==("")){
				durationAll =durationMedium;
			}else{
				durationAll =durationLong;
			}
			$('.durationSelect').html(durationAll).distinct;
				
    		let counts=data.size.length
    		var count=document.getElementById("count");
    			count.innerHTML= "共有"+counts+"個匹配行程";
    		
    	
		  }); 	//end of  request.done	
		 
	  }); // change destination
	  
	
	  $("#durationID").change(function(){
// 		  alert($( this ).val())
		  var request=$.ajax({
			url: "<%=request.getContextPath()%>/IndexServlet",
		 	method:"POST",				  	
		 	data:{"action":"updateOption","Duration":$( this ).val(),"Departure":$(departureID).val(),"Destination":$(destinationID).val(),"DepartureTime":$(departureTimeID).val()},
		 	dataType:"json"
			  
		  });
		  request.done(function(data){
// 		  	console.log(data)
// 		  	console.log(data.packageNoList.length)
// 			console.log(data.Duration)
// 			console.log(data.departureTimeDistinct)
			
			
			
			let departureAll='<option>請選擇</option>';
	    	data.departureDistinct.forEach(function(departure){
	    	if(data.departureDistinct.length>1){
	    		departureAll = departureAll+  '<option>'+departure+'</option>'
	    	}else{
	    		departureAll ='<option>'+departure+'</option>'
	    	}	    				        	
	    	 });
	    	
	    	$('.departureSelect').html(departureAll);	

			let destinationAll='<option>請選擇</option>';			
    		data.destinationDistinct.forEach(function(destination){
    		if(data.destinationDistinct.length>1){
    			destinationAll = destinationAll +'<option>'+destination+'</option>'
    		}else{
    			destinationAll ='<option>'+destination+'</option>'
    		}    				    	       		
       		});												
    		$('.destinationSelect').html(destinationAll); 
    		
    		
    		let departureTimeAll='<option>請選擇</option>';
    		data.departureTimeDistinct.forEach(function(departureTime){
    			if(data.departureTimeDistinct.length>1){
    				 departureTimeAll = departureTimeAll + '<option>'+departureTime+'</option>'
    			}else{
    				 departureTimeAll = '<option>'+departureTime+'</option>'
    			}   				
       		});
    		
    		$('.departureTimeSelect').html(departureTimeAll); 
    		let durationAll;
    		let durationShort='';
    		let durationMedium='';
    		let durationLong='';   	   	  	   		
    		    	
    		if(Number(Math.min(...data.Duration))<=5){
				durationShort='<option>1~5天</option>'
			};
		    if(Number(Math.max(...data.Duration))>10){
		    	durationLong='<option>10天以上</option>'
		    };
		    
		    data.Duration.forEach(function(duration){
		    	if(duration<10 && duration>5){
		    		durationMedium='<option>6~9天</option>'
		    	}
		    });	
		    durationAll =durationShort+durationMedium+durationLong;		       
		    if(durationAll.length>22){
		    	durationAll ='<option></option>'+durationShort+durationMedium+durationLong;
		    }else{
		    	durationAll =durationShort+durationMedium+durationLong;
		    }
			$('.durationSelect').html(durationAll).distinct;
    	    		
    		let counts=data.size.length
    		var count=document.getElementById("count");
    			count.innerHTML= "共有"+counts+"個匹配行程";
    		
    	
		  }); 	//end of  request.done	
		 
	  }); // change duration
	  
	  
	  
	  
  })//function
  
  </script>
     <script>
    $(function () {
    	$('#clearBtn').click(function(){
//     		alert("HI");
    		var request = $.ajax({
   			  url: "<%=request.getContextPath()%>/IndexServlet",
   			  method: "POST",
   			  data:{"action":"updateOption"},
   			  dataType: "json"
    		});
    			 
    		request.done(function( data ) {
//     			console.log(data)
    			
	    		let departureAll='<option>請選擇</option>';
	    		data.departureDistinct.forEach(function(departure){
	    			departureAll = departureAll + '<option>'+departure+'</option>'
	    		});
	    		
	    		let destinationAll='<option>請選擇</option>';
	    		data.destinationDistinct.forEach(function(destination){
	    			destinationAll = destinationAll + '<option>'+destination+'</option>'
	       		})
	       		
	       		let departureTimeAll='<option>請選擇</option>';
	    		data.departureTimeDistinct.forEach(function(departureTime){	    		
	    			departureTimeAll = departureTimeAll + '<option>'+ departureTime +'</option>'
	       		})
	       		
	       		let durationAll='<option>請選擇</option>';
	    			    				    			
	    		durationAll = '<option>請選擇</option>'+'<option value="5">1~5天</option>'+' <option value="10">6~9天</option>'+'<option value="20">10天以上</option>'
	    		
	       		
	   			$('#departureID').html(departureAll);	
	    		$('#destinationID').html(destinationAll);
	    		$('#departureTimeID').html(departureTimeAll);
	    		$('#durationID').html(durationAll);
	    		$()
	    		
	    		let counts=data.size.length
	    		var count=document.getElementById("count");
	    			count.innerHTML= "共有"+counts+"個匹配行程";
   			});
    	
    	})
    	
    	
    });
    </script>
  
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
//           console.log(
//             "New date range selected: " +
//             start.format("YYYY-MM-DD") +
//             " to " +
//             end.format("DD-MM-YYYY") +
//             " (predefined range: " +
//             label +
//             ")"
//           );
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

  <script src="<%=request.getContextPath()%>/front-end/package/js/jquery.ddslick.js"></script>
  <script>
    $("select.ddslick").each(function () {
      $(this).ddslick({
        showSelectedHTML: true,
      });
    });
  </script>
</body>

</html>